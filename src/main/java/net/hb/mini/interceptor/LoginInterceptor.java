package net.hb.mini.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

   private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
   
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		    //preHandle(request,response, Object)
			HttpSession session = request.getSession();
			String ss = (String)session.getAttribute("cyw");
	
			String uri = request.getRequestURI();
			System.out.println("\nrequest.getRequestURI()  " + uri);
	        
	       // http://127.0.0.1:9090/crud/~.do
	      int idx = uri.lastIndexOf("/");
		  uri = uri.substring(idx+1);
			
		  System.out.println("LoginInterceptor  uri =  " + uri);
		  String query = request.getQueryString();
		  System.out.println("request.getQueryString() " + query);
			
		  if(query==null || query.equals("null")){ query=""; }
		  else{ query="?" + query;}
		  uri = uri + query;
		
		  boolean adminCheck = false;
		  response.setContentType("text/html; charset=UTF-8");
		  PrintWriter out = response.getWriter() ;
		  	
			if(ss!=null){
				adminCheck=true;	
			}else {
				out.append("<script>"
					+ "alert('로그인 후 이용해주세요');"
				    + "history.back();"
					+ "</script>").flush();
				adminCheck=false;
			}
			return adminCheck;
	}//end

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3) throws Exception {
		//afterCompletion(request,response, Object, Exception)
        logger.info("=======================afterCompletion start========================");
		logger.info("=======================afterCompletion end=========================");
	}//end
			
	
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3) throws Exception {
		//postHandle(request,response, Object, ModelAndView)
	   logger.info("=======================postHandle start======================");
	   logger.info("=======================postHandle end=========================");	
	}//end

}//class LoginInterceptor END
