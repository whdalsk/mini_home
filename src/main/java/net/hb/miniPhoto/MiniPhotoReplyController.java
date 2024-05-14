package net.hb.miniPhoto;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MiniPhotoReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniPhotoReplyController.class);
	
	@Autowired
	MiniPhotoReplyDAO dao;
	
	@RequestMapping("/photoAlbumReply.do")
	public String photoAlbumReply(Model model, int idx) {
		List<MiniPhotoReplyDTO> MPR = dao.photoReplySelect(idx);
		model.addAttribute("MPR", MPR);
		model.addAttribute("idx", idx);
		return "photoAlbumReply";
	}//end
	
	@RequestMapping("/photoAlbumReplyInsert.do")
	public String photoAlbumReplyInsert(MiniPhotoReplyDTO dto, HttpSession session) {
		String data = (String)session.getAttribute("cyw");
		dao.photoReplyInsert(dto, data);
		return "redirect:/photoAlbumR.do";
	}//end
	
}//class MiniPhotoReplyController END
