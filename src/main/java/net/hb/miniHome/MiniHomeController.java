package net.hb.miniHome;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MiniHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniHomeController.class);
	
	@Autowired
	MiniHomeDAO dao;
	
	
	@RequestMapping("/main.do")
	public String main(Model model, HttpServletRequest request, HttpSession session, MiniHomeDTO dto) {
		
		String data = (String)session.getAttribute("cyw");
		if (data==null || data=="") {
			dto.setH_title("로그인 후 이용해주세요");
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("dto", dao.mini_homeDetail(data));
		}		

		return "../../main"; 
	}//end

	
	@RequestMapping("/homeL.do")
	public String homeL(Model model, HttpServletRequest request, HttpSession session, MiniHomeDTO dto) {
		
		String data = (String)session.getAttribute("cyw");
		if (data==null || data=="") {
			dto.setH_img("login.png");
			dto.setH_content("로그인 후 이용해주세요");
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("dto", dao.mini_homeDetail(data));
		}
	   return "homeL";
	}//end
	
	@RequestMapping("/homeR.do")
	public String homeR(Model model, HttpServletRequest request, HttpSession session, MiniHomeDTO dto) {
		
		String data = (String)session.getAttribute("cyw");
		if (data==null || data=="") {
			dto.setH_room_img("login.png");
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("dto", dao.mini_homeDetail(data));
		}
		
		List<MiniHomeDTO> MI = dao.ilchonSelect();
		model.addAttribute("MI", MI);
		return "homeR";
	}//end
	
	@RequestMapping("/ilchonInsert.do")
	public String ilchonInsert(String i_content) {
		dao.ilchonInsert(i_content);
		return "redirect:/homeR.do";
	}//end
	
	
}//class MiniController END
