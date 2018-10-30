package kr.co.cocain.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.QuizBoardService;
import kr.co.cocain.repository.domain.QuizBoard;

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
	public void dqlist(Model model) {
		model.addAttribute("data", service.selectDQList());
	}
	/**
	 * uqlist : uqlist.jsp 호출
	 * param  : category,level,list
	 */
	@RequestMapping("uqlist.do")
	public void uqlist(Model model) {
		model.addAttribute("data",service.selectUQList());
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
	
/*	*//**
	 * uqform : uqform.jsp호출
	 * param  : category:category select 내 option value. 설정  
	 *		  : level : level    input radio. 설정
	 *//*		
	@RequestMapping("uqform.do")
	public void uqWriteForm(Model model) {
		model.addAttribute("data",service.onLoadForm());
	}*/
	
/*	*//**
	 * dqWrite :dqform의 dqForm action 호출 페이지
	 * param   : QuizBoard type 
	 * 
	 *//*
	@RequestMapping("uqwrite.do")
	public String uqWrite(QuizBoard quizBoard) {
		service.insertUQ(quizBoard);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"dqlist.do";
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
}
