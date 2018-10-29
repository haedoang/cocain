package kr.co.cocain.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.user.service.UserService;


@Controller("kr.co.cocain.user.controller.LoginController")
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService service;
	
	
	@RequestMapping("login.do")
	@ResponseBody
	public User login(HttpSession session, User user) {	
		user = service.userLogin(user);
		session.setAttribute("user", user);
		if(user == null) {
			return user;
		} // if
		
		return user;	
	} // login
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); 
		
		return "redirect:/main/main.do";
	} // logout
	
} // end class
