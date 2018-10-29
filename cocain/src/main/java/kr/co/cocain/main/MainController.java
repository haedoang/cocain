package kr.co.cocain.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.cocain.main.mainController")
@RequestMapping("/main")
public class MainController {

	@RequestMapping("main.do")
	public void mains() {}
	
} // end class
