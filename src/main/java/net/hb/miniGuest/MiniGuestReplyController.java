package net.hb.miniGuest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.hb.miniPhoto.MiniPhotoReplyDTO;

@Controller
public class MiniGuestReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniGuestReplyController.class);
	
	@Autowired
	MiniGuestReplyDAO dao;
	
	@RequestMapping("/guestBookReply.do")
	public String guestBookReply(Model model, int idx) {
		List<MiniGuestReplyDTO> MGR = dao.guestReplySelect(idx);
		model.addAttribute("MGR", MGR);
		model.addAttribute("idx", idx);
		return "guestBookReply";
	}//end
	
	@RequestMapping("/guestBookReplyInsert.do")
	public String guestBookReplyInsert(MiniGuestReplyDTO dto, HttpSession session) {
		String data = (String)session.getAttribute("cyw");
		dao.guestReplyInsert(dto, data);
		return "redirect:/guestBookR.do";
	}//end
	
}//class MiniGuestReplyController END
