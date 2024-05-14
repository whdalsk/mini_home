package net.hb.miniGuest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.hb.miniHome.MiniHomeDAO;
import net.hb.miniHome.MiniHomeDTO;

@Controller
public class MiniGuestController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniGuestController.class);
	
	@Autowired
	MiniGuestDAO dao;
	@Autowired
	MiniHomeDAO dao2;
	
	@RequestMapping("/guestBookL.do")
	public String guestBookL(Model model, HttpSession session, MiniHomeDTO dto) {
		
		String data = (String)session.getAttribute("cyw");
		if (data==null || data=="") {
			dto.setH_img("login.png");
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("dto", dao2.mini_homeDetail(data));
		}
		return "guestBookL";
	}//end
	
	@RequestMapping("/guestBookR.do")
	public String guestBookR(Model model, HttpSession session, String idx, String keyfield, String keyword) {
		String data = (String)session.getAttribute("cyw");
		
		//페이징 변수
		String pnum="1";
		int pageNUM, pagecount; //선택한 페이지 숫자, 전체 페이지 수
		int start, end; //현재 페이지 데이터 시작 번호, 끝 번호
		int startpage, endpage; //페이지 번호 시작, 끝
		int temp; 
		//검색 변수
		String skey=keyfield; //검색 필드
		String sval=keyword; //검색 입력값
		
		if(skey==null || skey=="" || sval==null || sval==""){
			skey="name";
			sval="";
		}//if end
		
		int Gtotal = dao.miniGuestCount();
		
		pnum = idx;
		if(pnum==null || pnum==""){
			pnum="1";
		}//if end
		pageNUM = Integer.parseInt(pnum);

		if(Gtotal%3==0){
			pagecount = Gtotal/3; //전체 페이지 개수
		}else{
			pagecount = (Gtotal/3)+1; 
		}//if-else end
		
		start=Gtotal-pageNUM*3+1; //현재 페이지 데이터 시작 번호
		end=Gtotal-(pageNUM-1)*3; //현재 페이지 데이터 끝 번호
		
		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp; //페이지 숫자 시작 번호
		endpage=startpage+9; //페이지 숫자 끝 번호
		
		if(endpage>pagecount){
			endpage=pagecount;
		}//if end
		
		List<MiniGuestDTO> MG = dao.miniGuestSelect(start, end);
		model.addAttribute("MG", MG);
		model.addAttribute("pageNUM", pageNUM);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("pagecount", pagecount);
		
		return "guestBookR";
	}//end
	
	@RequestMapping("/guestInsert.do")
	public String guestInsert(MiniGuestDTO dto) {
		dao.miniGuestInsert(dto);
		return "redirect:/guestBookR.do";
	}//end
	
	@RequestMapping("/guestDelete.do")
	public String guestDelete(int idx) {
		dao.miniGuestDelete(idx);
		return "redirect:/guestBookR.do";
	}//end
	
}//class MiniController END
