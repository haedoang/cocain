package kr.co.cocain.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.cocain.repository.domain.User;


public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");	
		
		if(user != null) {										
			return true;			
		} // if
		
		response.sendRedirect("/cocain/main/main.do");	
		
		return false;	
	} // preHandle
	
} // end class
