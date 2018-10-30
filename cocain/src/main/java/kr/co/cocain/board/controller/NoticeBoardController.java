package kr.co.cocain.board.controller;

	import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.NoticeBoardService;
import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticeRecom;

	@Controller
	@RequestMapping("/board")
	public class NoticeBoardController {

	    @Autowired
	    NoticeBoardService service;
	    
//	     /jsp/board/     notice/list    .jsp    로 이동해야한다 그러므로 ModelAndView 혹은 Model을 써야한다.
	//  ModelAndView 객체를 계속 만들어서 계속 주소를 지정하는것보다
	// 요청한 주소와 이동할 주소가 같을때에는 Model객체로 정보를 공유하는게 편하다고 함....? 이 부분 공부 필요
	    @RequestMapping("/notice/list.do")
	    public void list(@RequestParam(value="pageNo" , defaultValue="1")int pageNo ,Model model){
//	        System.out.println(model);
	    
	        
	        NoticePage page = new NoticePage();
	        page.setPageNo(pageNo);
	        
	        int count = service.listCount();
	        int lastPage = (int)Math.ceil(count/10d);
	         
	         // 페이지 블럭 시작
	        int pageSize = 10;
	        int currTab = (pageNo-1)/pageSize +1;
	        //11번 부터 2페이지가 되는것
	        int beginPage =  (currTab-1)*pageSize +1;
	        int endPage = currTab*pageSize < lastPage ? currTab*pageSize : lastPage;  
	        
	        
	        model.addAttribute("beginPage",beginPage);
	        model.addAttribute("endPage",endPage);
	    model.addAttribute("lastPage",lastPage);
	    model.addAttribute("pageNo",pageNo);
	    model.addAttribute("list", service.listNotice(page));
	    model.addAttribute("count", service.listCount());
	    }
	    
	    @RequestMapping("/notice/detail.do")
	    public void detail(Model model, int no , NoticeRecom recom) {
	    	model.addAttribute("recom" , service.recom(recom));
	        model.addAttribute("board" ,service.detail(no));
	    }
	    
	    @RequestMapping("/notice/writeForm.do")
	    public void writeForm() {}

	    @RequestMapping("/notice/write.do")
	    public String write(Notice notice) {
	        service.write(notice);
	        return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	    }
	    
	    @RequestMapping("/notice/delete.do")
	    public String delete(int no) {
	        service.delete(no);
	        return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	    }
	    
	    @RequestMapping("/notice/updateForm.do")
	    public void updateForm(Model model, int no) {
	        model.addAttribute("board", service.detail(no));
	    }
	    
	    @RequestMapping("/notice/update.do")
	    public String update(Notice notice) {
	        service.update(notice);
	        return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	    }

	    @RequestMapping("/recom/insertrecom.do")
	    @ResponseBody
	    public int insertrecom(Model model,NoticeRecom recom) {
	    	 System.out.println("댓글 " + recom);
	    	 model.addAttribute("recom" , service.insertRecom(recom));
	    	 return service.recom(recom);
	    }
	    
	    @RequestMapping("/recom/deleterecom.do")
	    @ResponseBody
	    public int deleterecom(Model model, NoticeRecom recom) {
			model.addAttribute("recom", service.deleteRecom(recom));
	    	return service.recom(recom);
	    }
	    
	    @RequestMapping("/listComment.do")
	    @ResponseBody
	    public List<NoticeComment> commentList(int no) throws Exception {
	    	System.out.println("댓글 리스트" + no);
	    	return service.listComment(no);
	    }
	      
}
