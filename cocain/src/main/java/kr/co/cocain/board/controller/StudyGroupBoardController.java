package kr.co.cocain.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.StudyGroupBoardService;
import kr.co.cocain.repository.domain.StudyBoard;

@Controller
@RequestMapping("/board/studygroup")
public class StudyGroupBoardController {

	@Autowired
	private StudyGroupBoardService service;

	@RequestMapping("list.do")
	public void list(Model model) throws Exception {
	
		model.addAttribute("list", service.list());
		
	}
	
	@RequestMapping("detail.do")
	public void detail(int no, Model model) throws Exception {
		model.addAttribute("board", service.detail(no));
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm() {}
	

	@RequestMapping("write.do")
	public String write(StudyBoard board) throws Exception {
		service.write(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int no) throws Exception {
		service.delete(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	

	@RequestMapping("updateForm.do")
	public void updateForm(int no, Model model) throws Exception {
		model.addAttribute("board", service.updateForm(no));
	}
	

	@RequestMapping("update.do")
	public String update(StudyBoard board) throws Exception {
		service.update(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
