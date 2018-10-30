package kr.co.cocain.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.user.service.UserService;


@Controller("kr.co.cocain.user.controller.MyPageController")
@RequestMapping("/user")
public class MyPageController {
	
	@Autowired
	private UserService service;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@RequestMapping("myPage.do")
	public void mypage() {};
	
	@RequestMapping("passCheck.do")
	@ResponseBody
	public User oriPassCk(User user, String id, String oriPassword) {
		try {
			user = service.checkPass(id);
			String encoded = user.getPassword();
			
			if(passwordEncoder.matches(oriPassword, encoded)) {
				return user;
			} else {
				user = null;
			} // if-else
		} catch(Exception e) {
			
			return user;
		} // try-catch	
		
		return user;
	} // oriPassCk
	
	@RequestMapping("modifyPass.do")
	public String updatePass(User user, HttpSession session) {
		service.updatePass(user);
		session.invalidate(); 
		
		return "redirect:/main/main.do";
	} // updatePass
	
} // end class
