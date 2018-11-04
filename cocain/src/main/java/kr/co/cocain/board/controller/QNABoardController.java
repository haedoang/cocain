package kr.co.cocain.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.QNABoardService;
import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.domain.QnaComment;
import kr.co.cocain.repository.domain.QnaPage;
import kr.co.cocain.util.PageResult;

@Controller
@RequestMapping("/board/qna")
public class QNABoardController {

	@Autowired
	QNABoardService service;

	@RequestMapping("/list.do")
	public void list(@RequestParam(value="pageNo" ,defaultValue="1")int pageNo,Model model) throws Exception {
		QnaPage qnap = new QnaPage();
		qnap.setPageNo(pageNo);
//		PageResult pageResult = new PageResult(pageNo, service.qnaPagingCount());
		PageResult pageResult = new PageResult(pageNo, service.listCount(),15,10);
		
		model.addAttribute("list", service.listqna(qnap));
		model.addAttribute("listCount", service.listCount());
//		model.addAttribute("cmtcnt", service.commentCnt(no))
		model.addAttribute("pageResult", pageResult);
	}
	
    @RequestMapping("/writeForm.do")
    public void writeForm() {}
    
    @RequestMapping("/write.do")
    public String write(Qna qna) {
        service.write(qna);
        System.out.println(qna.getNo());
        return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do?no=" + qna.getNo();
    }
    
    @RequestMapping("/detail.do")
	public void detail(int no, Model model) throws Exception {
		model.addAttribute("qna", service.detail(no));
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
}
