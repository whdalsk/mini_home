package net.hb.miniLogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginDAO dao;
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/loginCommit.do")
	public void  loginprocess(LoginDTO dto, HttpServletResponse response, HttpServletRequest request , HttpSession session)  throws ServletException, IOException   {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("\n로그인컨트롤처리전 넘어온userid=" + dto.getM_id() );
		System.out.println("로그인컨트롤처리전 넘어온pwd=" + dto.getM_pw());
	
		String result = dao.login(dto);	
		System.out.println("세션m_id=" + result);
		if(result==null || result=="" ){
			out.append("<script>");
			out.append("alert('LoginController 아이디 비밀번호가 일치하지않습니다');");
			out.append("location.href='login.do';"); 
		    out.append("</script>");
		    out.flush();
		}	
		
		session.setAttribute("cyw",result ); 
		System.out.println("LoginController문서 세션이름=cyw");
		
	    RequestDispatcher dis = request.getRequestDispatcher("index.jsp");	//newproject.jsp 매핑이름(추가 예정)
	    dis.include(request, response);
	}//end

	
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
	  session.invalidate(); //session null 
	  return "redirect:/index.jsp"; 
   }//end
   
   @RequestMapping("/loginId.do")
   public String loginId() {
	   return "loginId"; 
   }//end
   
   @RequestMapping("/loginIdCommit.do")
   public String loginIdCommit(HttpServletResponse response, LoginDTO dto) throws IOException {
	   response.setContentType("text/html; charset=UTF-8");
	   PrintWriter out = response.getWriter();
	   String a = dao.find_id(dto);
		if(a != null) {
			out.append("<script> alert('찾은 아이디는 "+ a +" 입니다.'); location.href='login.do'; </script>");
			out.flush();
		}else {
			out.append("<script> alert('입력한 정보에 대한 아이디가 없습니다.'); location.href='signUp.do'; </script>");
			out.flush();
		}
	   return "redirect:/login.do"; 
   }//end
   
   @RequestMapping("/loginPwd.do")
   public String loginPwd() {
	   return "loginPwd"; 
   }//end
   
   @RequestMapping("/loginPwdCommit.do")
   public String loginPwdCommit(HttpServletResponse response, LoginDTO dto) throws IOException {
	   response.setContentType("text/html; charset=UTF-8");
	   PrintWriter out = response.getWriter();
	   String pwd = dao.findPwd(dto);
	   
	   if(pwd==null || pwd=="") {
		   out.append("<script> "
		   		+ "alert('회원정보가 없습니다 회원가입을 진행해주세요'); "
		   		+ "location.href='signUp.do';"
		   		+ "</script>").flush();
	   }else {
		   out.append("<script> "
		   		+ "alert('고객님의 비밀번호는 "+pwd+" 입니다'); "
		   		+ "location.href='login.do'; "
		   		+ "</script>").flush();
	   }
	   
	   return "redirect:/login.do"; 
   }//end
   
   @RequestMapping("/signUp.do")
   public String signUp() {
	   return "signUp"; 
   }//end
   
 //회원가입
  	@RequestMapping(value = "/signUpCommit.do", method = RequestMethod.POST)
  	public String signUpCommit(HttpServletResponse response, LoginDTO dto) throws IOException {
	   response.setContentType("text/html; charset=UTF-8");
	   PrintWriter out = response.getWriter();
	   
	   int result = dao.signUp(dto);
	   String viewPage = null;
	   System.out.println(result);
	   
		if(result==1) { // DB 저장 성공시실행
		   out.append("<script>");
		   out.append("alert('회원가입이 완료되었습니다');");
		   out.append("location.href='login.do';"); 
		   out.append("</script>");
		   out.flush();
		   
		   viewPage = "redirect:/login.do";
		   
		}else{ // DB저장 실패시 실행
		   out.append("<script>");
		   out.append("alert('회원가입에 실패했습니다.');");
		   out.append("location.href='signUp.do';"); 
		   out.append("</script>");
		   out.flush();
		   
		   viewPage = "signUp";
		}
	    return viewPage;
  }//end

}//class LoginController END
