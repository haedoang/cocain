package kr.co.cocain.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.cocain.repository.domain.User;


/**
 * 유저 인터셉터에 대한 클래스
 * @author 조성일
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 인터셉터 처리
	 * @param request, response, handler
	 * 	- 로그인에 의해 세션이 있다면 마이페이지 및 상세 글 정보 등을 해당 url을 통해 직접접근 가능하지만,
	 * 	    세션이 없다면 메인화면으로 돌아가게 만들어 직접접근할 수 없도록 한다.
	 */
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
