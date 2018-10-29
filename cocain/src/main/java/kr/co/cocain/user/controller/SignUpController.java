package kr.co.cocain.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.user.service.UserService;


@Controller("kr.co.cocain.user.controller.SignUp")
@RequestMapping("/user")
public class SignUpController {

	@Autowired
	private UserService service;
	
	
	@RequestMapping("signUpForm.do")
	public void signUpForm() {} 
	// signUpForm
	
	@RequestMapping("signUp.do")
	public String signUp(User user) {
		service.register(user);

		return "redirect:signUpForm.do";
	} // signUp
	
	@RequestMapping("checkId.do")
	@ResponseBody
	public String checkId(User user) {
		return Integer.toString(service.checkId(user));
	} // checkId
	
	@RequestMapping("checkName.do")
	@ResponseBody
	public String checkName(User user) {
		return Integer.toString(service.checkName(user));
	} // checkName
	
	@RequestMapping("sendMail.do")
	@ResponseBody
	public String sendMail(User user) {
		return service.sendMail(user);
	} // sendMail
	
} // end class
