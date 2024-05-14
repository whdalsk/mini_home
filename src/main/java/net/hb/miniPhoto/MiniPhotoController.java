package net.hb.miniPhoto;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MiniPhotoController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniPhotoController.class);
	
	@Autowired
	ServletContext application;
	
	@Autowired
	MiniPhotoDAO dao;
	
	@RequestMapping("/photoAlbumL.do")
	public String photoAlbumL() {
		
		return "photoAlbumL";
	}//end
	
	@RequestMapping("/photoAlbumR.do")
	public String photoAlbumR(Model model, String idx, String keyfield, String keyword) {
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
		
		int Gtotal = dao.miniPhotoCount();
		
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
		
		start=(pageNUM-1)*3+1; //현재 페이지 데이터 시작 번호
		end=pageNUM*3; //현재 페이지 데이터 끝 번호
		
		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp; //페이지 숫자 시작 번호
		endpage=startpage+9; //페이지 숫자 끝 번호
		
		if(endpage>pagecount){
			endpage=pagecount;
		}//if end
		
		List<MiniPhotoDTO> MP = dao.miniPhotoSelect(start, end);
		model.addAttribute("MP", MP);
		model.addAttribute("pageNUM", pageNUM);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("pagecount", pagecount);
		
		return "photoAlbumR";
	}//end
	
	@RequestMapping("/photoAlbumInsert.do")
	public String photoAlbumInsert(MiniPhotoDTO dto) {
		return "photoAlbumInsert";
	}//end
	
	@RequestMapping("/photoInsertCommit.do")
	public String photoInsertCommit(MiniPhotoDTO dto) {
		String path=application.getRealPath("/resources/upload");
		String img=dto.getUpload_f().getOriginalFilename();

		File file = new File(path, img);
  
		try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
		dto.setP_img(img);
		dao.miniPhotoInsert(dto);
		return "redirect:/photoAlbumR.do";
	}//end
	
	@RequestMapping("/photoUpdate.do")
	public String photoUpdate(MiniPhotoDTO dto, Model model) {
		model.addAttribute("p_code", dto.getP_code());
		model.addAttribute("p_title", dto.getP_title());
		model.addAttribute("p_img", dto.getP_img());
		model.addAttribute("p_content", dto.getP_content());
		return "photoAlbumUpdate";
	}//end
	
	@RequestMapping("/photoUpdateCommit.do")
	public String photoUpdateCommit(MiniPhotoDTO dto, HttpSession session) {
		String data = (String)session.getAttribute("cyw");
		
		String path=application.getRealPath("/resources/upload");
		String img=dto.getUpload_f().getOriginalFilename();

		File file = new File(path, img);
  
		try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }
		dto.setP_img(img);
		dto.setP_name(data);
		dao.miniPhotoUpdate(dto);
		return "redirect:/photoAlbumR.do";
	}//end
	
	@RequestMapping("/photoDelete.do")
	public String photoDelete(int idx) {
		dao.miniPhotoDelete(idx);
		return "redirect:/photoAlbumR.do";
	}//end
	
	@RequestMapping("/photoAlbumR2.do")
	public String photoAlbumR2() {
		return "photoAlbumR2";
	}//end
	
	@RequestMapping("/photoAlbumR3.do")
	public String photoAlbumR3() {
		return "photoAlbumR3";
	}//end
	
	@RequestMapping("/photoAlbumR4.do")
	public String photoAlbumR4() {
		return "photoAlbumR4";
	}//end
	
}//class MiniPhotoController END
