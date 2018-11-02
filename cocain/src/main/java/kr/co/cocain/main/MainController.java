package kr.co.cocain.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.cocain.board.service.NoticeBoardService;
import kr.co.cocain.board.service.QNABoardService;
import kr.co.cocain.board.service.QuizBoardService;
import kr.co.cocain.board.service.StudyGroupBoardService;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.QnaPage;
import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.user.service.UserService;
import kr.co.cocain.util.PageResult;


@Controller("kr.co.cocain.main.mainController")
@RequestMapping("/main")
public class MainController {
    @Autowired
    NoticeBoardService noticeService;
    
	@Autowired
	private StudyGroupBoardService studyService;
	
	@Autowired
	private QuizBoardService quizService;

	@Autowired
	private QNABoardService qnaService;
	
	@Autowired
	private UserService userService;
    
    
	@RequestMapping("main.do")
	public void mains(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		// 공지사항
        NoticePage page = new NoticePage();
        page.setPageNo(pageNo);
	    model.addAttribute("noticeList", noticeService.listNotice(page));
	    
		// 스터디 
	    model.addAttribute("studyList", studyService.list());
	    
		// 유저 퀴즈
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
    	model.addAttribute("quizList", quizService.selectUQList(qp));
    	
    	// QnA
		QnaPage qnap = new QnaPage();
		qnap.setPageNo(pageNo);
		model.addAttribute("qnaList", qnaService.listqna(qnap));
		
		// 전체 게시물 수
		model.addAttribute("articleCount", userService.allArticleCount());
		
		// 전체 문제 수
		model.addAttribute("quizCount", userService.allQuizCount());
	} // mains
	
} // end class
