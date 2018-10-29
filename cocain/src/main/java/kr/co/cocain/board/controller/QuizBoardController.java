package kr.co.cocain.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.cocain.board.service.QuizBoardService;

@Controller("kr.co.cocain.board.controller.QuizBoardController")
@RequestMapping("/board/quiz")
public class QuizBoardController {
	
	@Autowired
	QuizBoardService service;
	
	@RequestMapping("dqlist.do")
	public void dqlist(Model model) {
		model.addAttribute("list", service.selectDQList());
	}
}
