package kr.co.cocain.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.cocain.board.controller.QuizBoardController")
@RequestMapping("/board/quiz")
public class QuizBoardController {

	@RequestMapping("dqlist.do")
	public void dqlist() {
		
	}
}
