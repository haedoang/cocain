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

import kr.co.cocain.board.service.QNABoardService;
import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.domain.QnaComment;
import kr.co.cocain.repository.domain.QnaPage;
import kr.co.cocain.repository.domain.QnaPageSearch;
import kr.co.cocain.repository.domain.QnaRecom;
import kr.co.cocain.util.PageResult;

@Controller
@RequestMapping("/board/qna")
public class QNABoardController {

	@Autowired
	QNABoardService service;

	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) throws Exception {
		QnaPage qp = new QnaPage();
		System.out.println(pageNo);
		qp.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo, service.listCount(),15,10);
		
		model.addAttribute("qna", service.listqna(qp));
		model.addAttribute("listCount", service.listCount());
		model.addAttribute("pageResult", pageResult);
//		System.out.println(service.listqna(qnap));
//		model.addAttribute("cmtcnt", service.commentCnt(no))
	}
		
	@RequestMapping("/searchlist.do")
	public ModelAndView searchlist(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo, QnaPageSearch qnaPage) throws Exception {
		ModelAndView mav = new ModelAndView("board/qna/list");
		qnaPage.setPageNo(pageNo);
		PageResult pageResult = new PageResult(pageNo, service.searchlistCount(qnaPage),15, 10);
		
		mav.addObject("search", qnaPage);
        mav.addObject("qna", service.searchlist(qnaPage));
        mav.addObject("listCount", service.searchlistCount(qnaPage));
        mav.addObject("pageResult", pageResult);
		return mav;
	}

	
    @RequestMapping("/writeForm.do")
    public void writeForm() {}
    
    @RequestMapping("/write.do")
    public String write(Qna qna) {
        service.write(qna);
        return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?no=" + qna.getNo();
    }
    
    @RequestMapping("/detail.do")
	public void detail(int no, Model model, QnaRecom recom) {
		model.addAttribute("qna", service.detail(no));
		model.addAttribute("recCount", service.recomExist(recom));
	}
    
    @RequestMapping("/delete.do")
	public String delete(int no) throws Exception {
		service.delete(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
    
    @RequestMapping("/updateForm.do")
    public void updateForm(Model model, int no) {
        model.addAttribute("qna", service.detail(no));
    }
    
    @RequestMapping("/update.do")
    public String update(Qna qna) {
        service.update(qna);
        return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?no=" + qna.getNo();
    }
    
    @RequestMapping("/listComment.do")
    @ResponseBody
    public List<QnaComment> commentList(int no) throws Exception {
    	return service.listComment(no);
    }
    @RequestMapping("/commentCount.do")
    @ResponseBody
    public String commentCount(int no) throws Exception {
    	return Integer.toString(service.commentCnt(no));
    }
    	
    @RequestMapping("/insertComment.do")
    @ResponseBody
    public List<QnaComment> insertComment(QnaComment comment){
    	service.insertComment(comment);
    	return service.listComment(comment.getNo());
    }

    @RequestMapping("/deleteComment.do")
    @ResponseBody
    public List<QnaComment> deleteComment(QnaComment comment){
    	service.deleteComment(comment.getCommentNo());
    	return service.listComment(comment.getCommentNo());
    }
    
    @RequestMapping("/updateComment.do")
    @ResponseBody
    public List<QnaComment> updateComment(QnaComment comment){
    	service.updateComment(comment);
    	return service.listComment(comment.getCommentNo());
    }
    
    @RequestMapping("/selectAnswer.do")
//    @ResponseBody
//    public List<QnaComment> selectAnswer(QnaComment comment){
    public String selectAnswer(int no, int commentNo){
    	service.selectAnswerList(no);
    	service.selectAnswerComment(commentNo);
//    	return service.listComment(no);
    	return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?no=" + no;
    }
    @RequestMapping("/answerCount.do")
    @ResponseBody
    public String answerCount(int no) throws Exception {
    	return Integer.toString(service.answerCount(no));
    }
    
    @RequestMapping("/insertrecom.do")
    @ResponseBody
    public int insertrecom(QnaRecom recom) {
//    	 System.out.println("댓글 " + recom);
//    	 model.addAttribute("recom", service.insertRecom(recom));
    	 service.insertRecom(recom);
    	 return service.recomExist(recom);
    }
    
    @RequestMapping("/deleterecom.do")
    @ResponseBody
    public int deleterecom(QnaRecom recom) {
//		model.addAttribute("recom", service.deleteRecom(recom));
		service.deleteRecom(recom);
    	return service.recomExist(recom);
    }
    
    // 추천수 카운트
    @RequestMapping("/recomCount.do")
    @ResponseBody
	public int recnumber(int no) {
		return service.recomCount(no);
	}
    
    // 추천 여부 확인 0 / 1
    @RequestMapping("/recomExist.do")
    @ResponseBody
	public int recExist(QnaRecom recom) {
		return service.recomExist(recom);
	}
    
}
