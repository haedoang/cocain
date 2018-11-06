package kr.co.cocain.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.cocain.board.service.RankBoardService;
import kr.co.cocain.repository.domain.RankPage;
import kr.co.cocain.util.PageResult;

@Controller("kr.co.cocain.board.controller.RankBoardController")
@RequestMapping("/board/rank")
public class RankBoardController {
	
	@Autowired
	RankBoardService service;
	
	@RequestMapping("rank.do")
	public void ranklist(@RequestParam(value="pageNo",defaultValue="1")int pageNo,Model model) {
		RankPage rp = new RankPage();
		rp.setPageNo(pageNo);
		
		PageResult pageResult = new PageResult(pageNo,service.selectRankCount(),20,5);
		
		model.addAttribute("list",service.selectRankPaging(rp));
		model.addAttribute("pageResult",pageResult);
		
	}
	
}
