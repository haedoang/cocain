package kr.co.cocain.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.cocain.board.service.RankBoardService;
import kr.co.cocain.repository.domain.UserRank;

@Controller("kr.co.cocain.board.controller.RankBoardController")
@RequestMapping("/board/rank")
public class RankBoardController {
	
	@Autowired
	RankBoardService service;
	
	@RequestMapping("rank.do")
	public void ranklist(Model model) {
		model.addAttribute("list",service.selectRank());
	}
	
}
