package kr.co.cocain.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.cocain.board.service.QNABoardService;
import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.Qna;

@Controller
@RequestMapping("/board/qna")
public class QNABoardController {

	@Autowired
	QNABoardService service;

	@RequestMapping("/list.do")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.listqna());
		model.addAttribute("listCount", service.listCount());
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
}
