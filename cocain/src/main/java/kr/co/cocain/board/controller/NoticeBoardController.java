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

import kr.co.cocain.board.service.NoticeBoardService;
import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticePage2;
import kr.co.cocain.repository.domain.NoticeRecom;

@Controller
@RequestMapping("/board")
public class NoticeBoardController {

	@Autowired
	NoticeBoardService service;

	// /jsp/board/ notice/list .jsp 로 이동해야한다 그러므로 ModelAndView 혹은 Model을 써야한다.
	// ModelAndView 객체를 계속 만들어서 계속 주소를 지정하는것보다
	// 요청한 주소와 이동할 주소가 같을때에는 Model객체로 정보를 공유하는게 편하다고 함....? 이 부분 공부 필요
	@RequestMapping("/notice/list.do")
	public void list(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, Notice notice) {
		// System.out.println(model);

		NoticePage page = new NoticePage();
		page.setPageNo(pageNo);

		int count = service.listCount();
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		model.addAttribute("list", service.listNotice(page));
		model.addAttribute("count", service.listCount());
	}

	@RequestMapping("/notice/list2.do")
	public ModelAndView list2(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		// System.out.println(model);

		ModelAndView mav = new ModelAndView("board/notice/list");
		NoticePage page = new NoticePage();
		page.setPageNo(pageNo);

		int count = service.listCount();
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		mav.addObject("beginPage", beginPage);
		mav.addObject("endPage", endPage);
		mav.addObject("lastPage", lastPage);
		mav.addObject("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		mav.addObject("list", service.listNotice2(page));
		mav.addObject("count", service.listCount());
		return mav;
	}

	@RequestMapping("/notice/list3.do")
	public ModelAndView list3(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		// System.out.println(model);

		ModelAndView mav = new ModelAndView("board/notice/list");

		NoticePage page = new NoticePage();
		page.setPageNo(pageNo);

		int count = service.listCount();
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		mav.addObject("beginPage", beginPage);
		mav.addObject("endPage", endPage);
		mav.addObject("lastPage", lastPage);
		mav.addObject("pageNo", pageNo);
		// System.out.println(service.listNotice(page).size());
		mav.addObject("list", service.listNotice3(page));
		mav.addObject("count", service.listCount());
		return mav;
	}

	@RequestMapping("/notice/detail.do")
	public void detail(Model model, int no, NoticeRecom recom) {
		model.addAttribute("recCount", service.recomExist(recom));
		model.addAttribute("board", service.detail(no));
	}

	// 추천수 카운트
	@RequestMapping("/notice/recomCount.do")
	@ResponseBody
	public int recnumber(int no) {
		return service.recomCount(no);
	}

	// 추천 여부 확인 0 / 1
	@RequestMapping("/notice/recomExist.do")
	@ResponseBody
	public int recExist(NoticeRecom recom) {
		return service.recomExist(recom);
	}

	@RequestMapping("/notice/writeForm.do")
	public void writeForm() {
	}

	@RequestMapping("/notice/write.do")
	public String write(Notice notice) {
		service.write(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/notice/delete.do")
	public String delete(int no) {
		service.delete(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/notice/updateForm.do")
	public void updateForm(Model model, int no) {
		model.addAttribute("board", service.detail(no));
	}

	@RequestMapping("/notice/update.do")
	public String update(Notice notice) {
		service.update(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/notice/insertrecom.do")
	@ResponseBody
	public int insertrecom(NoticeRecom recom) {
		// System.out.println("댓글 " + recom);
		service.insertRecom(recom);
		return service.recomExist(recom);
	}

	@RequestMapping("/notice/deleterecom.do")
	@ResponseBody
	public int deleterecom(NoticeRecom recom) {
		service.deleteRecom(recom);
		return service.recomExist(recom);
	}

	@RequestMapping("/listComment.do")
	@ResponseBody
	public List<NoticeComment> commentList(int no) throws Exception {
		return service.listComment(no);
	}

	/**
	 * 물어볼 예제
	 * 
	 * @param no
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/CommentCount.do")
	@ResponseBody
	public List<NoticeComment> commentCount(int no) throws Exception {
		service.commentCount(no);
		return service.listComment(no);
	}

	@RequestMapping("/insertComment.do")
	@ResponseBody
	public List<NoticeComment> insertComment(NoticeComment comment) {
		// System.out.println("코멘트"+comment);
		service.insertComment(comment);
		return service.listComment(comment.getNo());
	}

	@RequestMapping("/deleteComment.do")
	@ResponseBody
	public List<NoticeComment> deleteComment(NoticeComment comment) {
		// System.out.println("딜리트코맨" + comment);
		service.deleteComment(comment.getCommentNo());
		return service.listComment(comment.getCommentNo());
	}

	@RequestMapping("/updateComment.do")
	@ResponseBody
	public List<NoticeComment> updateComment(NoticeComment comment) {
		// System.out.println("업뎃코맨" + comment);
		service.updateComment(comment);
		return service.listComment(comment.getCommentNo());
	}

	@RequestMapping("/notice/category.do")
	public ModelAndView category(@RequestParam(value = "pageNo", defaultValue = "0") int pageNo,
			NoticePage2 noticePage) {
		ModelAndView mav = new ModelAndView("board/notice/list");

		int count = service.categoryCount(noticePage);

		noticePage.setPageNo(pageNo);

		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		mav.addObject("result", noticePage);
		mav.addObject("beginPage", beginPage);
		mav.addObject("endPage", endPage);
		mav.addObject("lastPage", lastPage);
		mav.addObject("pageNo", pageNo);
		mav.addObject("list", service.category(noticePage));
		mav.addObject("count", service.categoryCount(noticePage));

		return mav;
	}

}
