package kr.co.cocain.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.StudyGroupBoardService;
import kr.co.cocain.repository.domain.QnaPageSearch;
import kr.co.cocain.repository.domain.StudyBoard;
import kr.co.cocain.repository.domain.StudyComment;
import kr.co.cocain.repository.domain.StudyPage;
import kr.co.cocain.util.PageResult;

@Controller
@RequestMapping("/board/studygroup")
public class StudyGroupBoardController {

	@Autowired
	private StudyGroupBoardService service;

		
	@RequestMapping("list.do")
	public void list(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) throws Exception {
		StudyPage qp = new StudyPage();
		qp.setPageNo(pageNo);

		model.addAttribute("list", service.list(qp));
		model.addAttribute("category", service.category());

		PageResult pageResult = new PageResult(pageNo, service.selectBoardCount(), 20,10);
		model.addAttribute("pageResult", pageResult); 
		
		model.addAttribute("comment", service.commentCnt(pageNo));
	} 

	
	@RequestMapping("detail.do")
	public void detail(int no, Model model) throws Exception {
		model.addAttribute("board", service.detail(no));
		
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) {
		model.addAttribute("category", service.category());
	}
	

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
		model.addAttribute("category", service.category());
	}
	

	@RequestMapping("update.do")
	public String update(StudyBoard board) throws Exception {
		service.update(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	
	@RequestMapping("/listComment.do")
    @ResponseBody
    public List<StudyComment> commentList(int no) throws Exception {
    	return service.listComment(no);
    }
	
	@RequestMapping("/insertComment.do")
    @ResponseBody
    public List<StudyComment> insertComment(StudyComment studyComment){
    	service.insertComment(studyComment);
    	return service.listComment(studyComment.getNo());
    }

    @RequestMapping("/deleteComment.do")
    @ResponseBody
    public List<StudyComment> deleteComment(StudyComment studyComment){
    	service.deleteComment(studyComment.getCommentNo());
    	return service.listComment(studyComment.getCommentNo());
    }
    
    @RequestMapping("/updateComment.do")
    @ResponseBody
    public List<StudyComment> updateComment(StudyComment studyComment){
    	service.updateComment(studyComment);
    	return service.listComment(studyComment.getCommentNo());
    }
    
    @RequestMapping("/commentCount.do")
    @ResponseBody
    public String commentCount(int no) throws Exception {
    	return Integer.toString(service.commentCnt(no));
    }
    
    @RequestMapping("/searchlist.do")
	public ModelAndView searchStudy(StudyBoard board) throws Exception {
		ModelAndView mav = new ModelAndView("board/studygroup/list");
		
		mav.addObject("keyword", board.getKeyword());
		mav.addObject("category", service.category());
        mav.addObject("list", service.searchStudy(board));
		return mav;
	}
    
    
	
}
