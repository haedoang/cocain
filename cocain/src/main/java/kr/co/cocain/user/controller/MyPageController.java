package kr.co.cocain.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.cocain.user.controller.MyPageController")
@RequestMapping("/user")
public class MyPageController {

	@RequestMapping("myPage.do")
	public void mypage() {};
	
} // end class
