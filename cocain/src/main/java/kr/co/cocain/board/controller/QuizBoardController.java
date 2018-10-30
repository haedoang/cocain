package kr.co.cocain.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.cocain.board.service.QuizBoardService;
import kr.co.cocain.repository.domain.QuizBoard;

@Controller("kr.co.cocain.board.controller.QuizBoardController")
@RequestMapping("/board/quiz")
public class QuizBoardController {
	
	@Autowired
	QuizBoardService service;
	
	@RequestMapping("dqlist.do")
	public void dqlist(Model model) {
		Map<String,Object> result = service.selectDQList();
		List<QuizBoard> list =  (List<QuizBoard>) result.get("list");
		
		System.out.println(list);
		
		model.addAttribute("data", service.selectDQList());
	}
	
	@RequestMapping("uqlist.do")
	public void uqlist(Model model) {
		model.addAttribute("data",service.selectUQList());
	}
}
