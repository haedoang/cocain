package kr.co.cocain.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.util.PageResult;

@Controller("kr.co.cocain.board.controller.RankBoardController")
@RequestMapping("/board/rank")
public class RankBoardController {
	
	@RequestMapping("rank.do")
	public void ranklist() {
		
	}
	
}
