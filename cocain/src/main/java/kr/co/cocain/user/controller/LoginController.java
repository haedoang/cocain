package kr.co.cocain.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@RequestMapping("login.do")
	@ResponseBody
	public User login(HttpSession session, User user) {
		try {
			String raw = user.getPassword();
			user = service.userLogin(user);
			String encoded = user.getPassword();
			
			if(passwordEncoder.matches(raw, encoded)) {
				session.setAttribute("user", user);
			} else {
				user = null;
			} // if-else
			
			return user;
		} catch(Exception e) {
			
			return user;
		} // try-catch		
	} // login
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); 
		
		return "redirect:/main/main.do";
	} // logout
	
} // end class
