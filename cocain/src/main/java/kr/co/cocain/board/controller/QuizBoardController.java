package kr.co.cocain.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.QuizBoardService;
import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.util.PageResult;

@Controller("kr.co.cocain.board.controller.QuizBoardController")
@RequestMapping("/board/quiz")
public class QuizBoardController {
	
	@Autowired
	QuizBoardService service;
	/* list 출력 관련 */
	/**
	 * dqlist : dqlist.jsp 호출
	 * param  : category,level,list
	 */
	@RequestMapping("dqlist.do")
	public void dqlist(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) {
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo,service.selectDQListCount());
		
		model.addAttribute("data", service.selectDQList(qp));
		model.addAttribute("pageResult",pageResult);
		
	}
	/**
	 * uqlist : uqlist.jsp 호출
	 * param  : category,level,list
	 */
	@RequestMapping("uqlist.do")
	public void uqlist(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) {
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo,service.selectDQListCount());
		
    	model.addAttribute("data",service.selectUQList(qp));
    	model.addAttribute("pageResult",pageResult);
	}
	
	
	/* Insert 관련 */ 
	/**
	 * dqform : dqform.jsp, uqform.jsp호출
	 * param  : category:category select 내 option value. 설정  
	 *		  : level : level    input radio. 설정
	 */		  
	@RequestMapping(value= {"dqform.do","uqform.do"})
	public void dqWriteForm(Model model) {
		model.addAttribute("data",service.onLoadForm());
	}
	
	/**
	 * dqWrite :dqform의 dqForm action 호출 페이지
	 * param   : QuizBoard type 
	 * return  : typeNo==1 데일리퀴즈 게시판으로 이동 typeNo==2 유저퀴즈게시판으로이동
	 */
	@RequestMapping(value= {"dqwrite.do","uqwrite.do"})
	public String dqWrite(QuizBoard quizBoard) {
		int type= quizBoard.getTypeNo();
	
		service.insertQuizBoard(quizBoard);
		if(type==1) {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"dqlist.do";			
		} else return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"uqlist.do";
	}
	
	/* detail */ 
	//파라미터값 게시글번호..
	@RequestMapping(value= {"dqdetail.do","uqdetail.do"})
	public void detail(int quizNo, Model model) {
		model.addAttribute("data",service.selectQuizBoardByNo(quizNo));
	}
	
	/* user quiz 정답 호출 ajax */
	@RequestMapping("uqcorrect.do")
	@ResponseBody
	public int correct(QuizBoard quizBoard) {	
		return service.selectQuizCorrect(quizBoard);
	}
	
	
	/* delete  */ 
	@RequestMapping("deleteboard.do")
	public String deleteBoard(int quizNo,int typeNo) {
		service.deleteQuizBoard(quizNo);
		
		if(typeNo==1) {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"dqlist.do";
		}
		else {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"uqlist.do";
		}
		
	}
	
	
	@RequestMapping("dqlistpaging.do")
	public void selectQuizPaging(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) {
		model.addAttribute("list",service.selectQuizPaging(pageNo));
	}
	
	
	
}
