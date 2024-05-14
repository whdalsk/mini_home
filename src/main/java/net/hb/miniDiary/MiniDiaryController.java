package net.hb.miniDiary;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MiniDiaryController {
	
	private static final Logger logger = LoggerFactory.getLogger(MiniDiaryController.class);

	@Autowired
	MiniDiaryDAO dao;

	
	public void paging(int num, Model model, String idx) {
		
		String pnum;
	    int pageNUM, pagecount;
	    int start, end;  //start������=161, end����=170   //[11]~[17����]~[20]  
	    int startpage, endpage;    //[11]~[17����]~[20]  
	    int temp;
	    int Gtotal = dao.diaryCount();
		
	    pnum = idx; // 2, 3
	    if(pnum==null || pnum==""){ pnum="1"; }
	    pageNUM = Integer.parseInt(pnum); // 2, 3
	    
	    List<MiniDiaryDTO> LG = null;
	    
	    temp = (pageNUM-1)%10;      //temp6 = 17-1 % 10
	    startpage = pageNUM-temp ;  //startpage = 17pageNUM-6temp ���� ������
	    
	    start = (pageNUM-1)*3+1 ; // 11, 21
	    end = pageNUM*3 ;  // 20, 30 
	    // pageNUM =5, temp=1,  start 13 end 15
	    if(Gtotal%3==0){
	     	pagecount = Gtotal/3;
	     }else{
	     	pagecount = (Gtotal/3)+1 ; 
	     } 
	    
	    LG = dao.diaryList(start, end);
	    endpage = startpage+9;
	    if(endpage>pagecount){ endpage=pagecount;} 
	    
	    model.addAttribute("Gtotal", Gtotal);
	    model.addAttribute("LG", LG);
	    model.addAttribute("pageNum", pageNUM);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("pagecount", pagecount);
	}//end
	
	@RequestMapping(value = "/diaryL.do")
	public String diaryL() {

		return "diaryL";
	}//end oo
	

	
	@RequestMapping(value = "/diaryR.do")
	public String diaryR(Model model, String idx) {			
		paging(1, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(1));
		return "diaryR";
	}//end oo
	
	@RequestMapping(value = "/diary_R2.do")
	public String diaryR2(Model model, String idx) {			
		paging(2, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(2));
		return "diaryR2";
	}//end oo
	
	@RequestMapping(value = "/diary_R3.do")
	public String diaryR3(Model model, String idx) {			
		paging(3, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(3));
		return "diaryR3";
	}//end oo
	
	@RequestMapping(value = "/diary_R4.do")
	public String diaryR4(Model model, String idx) {			
		paging(4, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(4));
		return "diaryR4";
	}//end oo
	
	@RequestMapping(value ="/insert.do") // go to link
	public String insert_link() {
		return "diaryInsert";
	}
	
	@RequestMapping(value ="/insert_commit.do") // insert
	public String insert_commit(Model model, String idx, HttpSession session,
								@RequestParam("title") String title, 
								@RequestParam("content") String content) {
		String data = (String)session.getAttribute("cyw");
		MiniDiaryDTO dto = new MiniDiaryDTO();
		dto.setD_title(title);
		dto.setD_content(content);
		dto.setD_name(data);// session���� ����
		dao.diaryInsert(dto);
		
		paging(1, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(1));
		return "diaryR";
	} // 00
	
	@RequestMapping(value ="/del_diary.do")
    public String handleDeleteRequest(Model model, String idx,
    		@RequestParam("d_code") int d_code) {
        // ���� ������ ó��
		System.out.println("handleDeleteRequest");
        // ó�� ��� ��ȯ
		System.out.println(d_code);
		dao.diaryDelete(d_code);
		dao.diaryreplyDelete(d_code);
		paging(1, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(1));
        return "diaryR";
    } // 0
	
	@RequestMapping(value ="/update_diary.do")
    public String update_diary_link(Model model, @RequestParam("d_code") int d_code,
    									   @RequestParam("title") String title, 
    									   @RequestParam("content") String content) {
        // ���� ������ ó��
		System.out.println("update_diary");
        // ó�� ��� ��ȯ
        model.addAttribute("code", d_code);
        model.addAttribute("title", title);
        model.addAttribute("content", content);
		
        return "diaryUpdate";
    }//00
	
	
	@RequestMapping(value ="/update_diary_commit.do")
    public String update_diary_commit(Model model, String idx,
    								@RequestParam("code") int code,
    								@RequestParam("title") String title, 
    								@RequestParam("content") String content) {
		System.out.println(code);
		System.out.println("112");
		System.out.println(title);
		System.out.println("122");
		System.out.println(content);
		System.out.println("222");
		
        dao.diaryupdate(code, title, content);
        
        model.addAttribute("code", code);
        model.addAttribute("title", title);
        model.addAttribute("content", content);
        
        paging(1, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(1));
        return "diaryR";
    }//0
	@RequestMapping(value ="/writecmt.do")
	public String writecmt(Model model, String name, String cmt, @RequestParam("code") int d_code, String idx) {
		// System.out.println(name);
		// System.out.println(cmt);
		// System.out.println(d_code);
		dao.reply_insert(name, cmt, d_code);
		
		paging(1, model, idx);
		model.addAttribute("reply", dao.diaryReplytList(1));
        return "diaryR";
	}
}//class MiniController END