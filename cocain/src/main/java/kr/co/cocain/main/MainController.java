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


/**
 * 메인화면 컨트롤러
 * @author 조성일
 */
@Controller("kr.co.cocain.main.mainController")
@RequestMapping("/main")
public class MainController {
	
	/**
	 * 공지사항 서비스 인터페이스에 대한 멤버 필드
	 */
    @Autowired
    NoticeBoardService noticeService;
    
	/**
	 * 스터디그룹 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private StudyGroupBoardService studyService;
	
	/**
	 * 퀴즈 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private QuizBoardService quizService;

	/**
	 * 지식iN 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private QNABoardService qnaService;
	
	/**
	 * 유저 서비스 인터페이스에 대한 멤버 필드
	 */
	@Autowired
	private UserService userService;
    
    
	/**
	 * 메인화면 처리
	 * @param pageNo, model
	 * 	- 각 게시판 목록과 전제 게시물 수, 전체 문제 수를 보여준다.
	 */
	@RequestMapping("main.do")
	public void mains(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		// 공지사항 목록
        NoticePage page = new NoticePage();
        page.setPageNo(pageNo);
	    model.addAttribute("noticeList", noticeService.listNotice(page));
	    
		// 스터디 목록
	    model.addAttribute("studyList", studyService.list());
	    
		// 유저 퀴즈 목록
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
    	model.addAttribute("quizList", quizService.selectUQList(qp));
    	
    	// 지식iN 목록
		QnaPage qnap = new QnaPage();
		qnap.setPageNo(pageNo);
		model.addAttribute("qnaList", qnaService.listqna(qnap));
		
		// 전체 게시물 수
		model.addAttribute("articleCount", userService.allArticleCount());
		
		// 전체 문제 수
		model.addAttribute("quizCount", userService.allQuizCount());
	} // mains
	
} // end class
