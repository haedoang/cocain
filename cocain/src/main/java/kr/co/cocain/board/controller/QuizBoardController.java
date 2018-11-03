package kr.co.cocain.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.QuizBoardService;
import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizComment;
import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.repository.domain.QuizSubmit;
import kr.co.cocain.util.PageResult;

@Controller("kr.co.cocain.board.controller.QuizBoardController")
@RequestMapping("/board/quiz")
public class QuizBoardController {
	
	@Autowired
	QuizBoardService service;
	/* list 출력 관련 */
	/**
	 * dqlist : dqlist.jsp 호출
	 * param  : model(category,level,list)
	 *          pageNo(페이지번호 default 1page) 
	 */
	@RequestMapping("dqlist.do")
	public void dqList(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) {
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo,service.selectDQListCount());
		
		model.addAttribute("data", service.selectDQList(qp));
		model.addAttribute("pageResult",pageResult);
		
	}
	/**
	 * uqlist : uqlist.jsp 호출
	 * param  : model(category,level,list)
	 *          pageNo(페이지번호 default 1page)
	 */       
	@RequestMapping("uqlist.do")
	public void uqList(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) {
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo,service.selectUQListCount());
		
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
	
	/**
	 * 
	 * @param quizNo
	 * @param model(detail,category,level)
	 * 		  : 게시글 번호에 해당하는 상세페이지, 수정페이지 호출 
	 */    
	@RequestMapping(value= {"dqdetail.do","uqdetail.do","dqupdateform.do","uqupdateform.do"})
	public void detail(int quizNo, Model model) {
		model.addAttribute("data",service.selectQuizBoardByNo(quizNo));
	}
	
	/**
	 * 
	 * @param quizBoard
	 * @return 1 정답 0 오답 
	 * 		  : userquiz 정답 작성 후 입력 호출 ajax  
	 */
	@RequestMapping("uqcorrect.do")
	@ResponseBody
	public int correct(QuizBoard quizBoard) {	
		return service.selectQuizCorrect(quizBoard);
	}
	
	
	/**
	 * 
	 * @param quizNo
	 * @param typeNo
	 * @return typeNo에 해당하는 게시글 목록으로 이동
	 *		 : 게시글 삭제 시 quizNo입력받아서 삭제. typeNo는 redirect 경로 지정 위해 설정 
	 */
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
	
	/* search ajax */
	
	@RequestMapping("search.do")
	@ResponseBody
	public Map<String,Object> selectQuizSearch(QuizBoard quizBoard) {
		return service.selectQuizSearch(quizBoard);
	}
	
	
	/* quizsubmit list */
	@RequestMapping("dqsubmit.do")
	public void dqSubmit(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) {
		QuizPage qp = new QuizPage();
		qp.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo, service.selectSubmitListCount());
		model.addAttribute("data", service.selectSubmitList(qp));
		model.addAttribute("pageResult",pageResult);
		
	}
	/* dq file upload */
	@RequestMapping(value="dqupload.do",method=RequestMethod.POST)
	@ResponseBody
	public String dqUpload(HttpServletRequest request,QuizSubmit quizSubmit,MultipartFile attach) throws IllegalStateException, IOException {
		System.out.println(quizSubmit);
		System.out.println("attach:"+attach);
		
		if(attach.isEmpty() == true) return "false";
		
		String oriName = attach.getOriginalFilename(); 
		
		//확장자 자르기
		String ext ="";
		int index = oriName.lastIndexOf(".");  
		if(index != -1 ) {	  
			ext = oriName.substring(index);  
		}
	
		String path= request.getRealPath("/resources/fileupload");
		
		String rename= quizSubmit.getQuizNo()+"_"+quizSubmit.getNickname()+ext;
	
		attach.transferTo(new File(path,rename));
		
		quizSubmit.setPath("/resources/fileupload");
		quizSubmit.setFileName(rename);
		service.insertQuizSubmit(quizSubmit);
		
		return "true";

	}
	
	/**
	 *  
	 * @param quizBoard
	 * @return typeNo에 따른 목록 페이지  리턴.
	 */
	@RequestMapping(value= "updateQuizBoard.do",method=RequestMethod.POST)
	public String updateQuizBoard(QuizBoard quizBoard) {
		int typeNo= quizBoard.getTypeNo();
		
		service.updateQuizBoard(quizBoard);
		
		if(typeNo==1) {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"dqlist.do";
		}
		else {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"uqlist.do";
		}
		
		
	}
	
	//댓글등록
	
	@RequestMapping("insertComment.do")
	@ResponseBody
	public List<QuizComment> insertComment(QuizComment quizComment) {
		service.insertComment(quizComment);	
		return service.selectCommentByNo(quizComment.getQuizNo());
	}
	//댓글삭제..
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(int comNo) {
		System.out.println(comNo);
		service.deleteComment(comNo);
	}
	
	

}
