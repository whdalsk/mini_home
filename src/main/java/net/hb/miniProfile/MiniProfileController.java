package net.hb.miniProfile;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.hb.miniHome.MiniHomeDTO;

@Controller
public class MiniProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniProfileController.class);
	
	@Autowired
	MiniProfileDAO dao;
	
	@RequestMapping("/profileL.do")
	public String photoAlbumL() {
		
		return "profileL";
	}//end
	
	@RequestMapping("/profileR.do")
	public String photoAlbumR(Model model, HttpSession session, MiniProfileDTO dto) {
		
		String data = (String)session.getAttribute("cyw");
		
		if (data==null || data=="") {
			dto.setP_img("login_large.png");
			model.addAttribute("p_dto", dto);
		}else {
			model.addAttribute("p_dto", dao.mini_profileDetail(data));
		}
		return "profileR";
	}//end
	
}//class MiniProfileController END
