package kr.co.cocain.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.user.service.UserService;


/**
 * 회원가입 컨트롤러
 * @author 조성일
 */
@Controller("kr.co.cocain.user.controller.SignUp")
@RequestMapping("/user")
public class SignUpController {

	/**
	 * 유저 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private UserService service;
	
	
	/**
	 * 회원가입 폼
	 */
	@RequestMapping("signUpForm.do")
	public void signUpForm() {} 
	// signUpForm
	
	/**
	 * 회원등록
	 * @param user
	 */
	@RequestMapping("signUp.do")
	public String signUp(User user) {
		service.register(user);

		return "redirect:/main/main.do";
	} // signUp
	
	/**
	 * 아이디 중복 체크
	 * @param user
	 */
	@RequestMapping("checkId.do")
	@ResponseBody
	public String checkId(User user) {
		return Integer.toString(service.checkId(user));
	} // checkId
	
	/**
	 * 닉네임 중복 체크
	 * @param user
	 */
	@RequestMapping("checkName.do")
	@ResponseBody
	public String checkName(User user) {
		return Integer.toString(service.checkName(user));
	} // checkName
	
	/**
	 * 인증코드 메일 보내기
	 * @param user
	 */
	@RequestMapping("sendMail.do")
	@ResponseBody
	public String sendMail(User user) {
		return service.sendMail(user);
	} // sendMail
	
} // end class
