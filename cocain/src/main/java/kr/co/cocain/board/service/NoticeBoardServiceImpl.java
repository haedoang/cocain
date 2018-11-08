package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticePage2;
import kr.co.cocain.repository.domain.NoticeRecom;
import kr.co.cocain.repository.mapper.NoticeMapper;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	NoticeMapper mapper;

	@Override
	public int listCount() {
		return mapper.listCount();
	}

	public List<Notice> listNotice(NoticePage page) {
		return mapper.listNotice(page);
	}

	public List<Notice> listNotice2(NoticePage page) {
		return mapper.listNotice2(page);
	}

	public List<Notice> listNotice3(NoticePage page) {
		return mapper.listNotice3(page);
	}

	@Override
	public Notice detail(int no) {
		mapper.updateViewCnt(no);
		return mapper.detailNotice(no);
	}

	@Override
	public void write(Notice notice) {
		mapper.writeNotice(notice);
	}

	@Override
	public void delete(int no) {
		mapper.deleteNotice(no);
	}

	@Override
	public void update(Notice notice) {
		mapper.updateNotice(notice);
	}

	@Override
	public int insertRecom(NoticeRecom recom) {
		return mapper.insertRecom(recom);
	}

	@Override
	public int deleteRecom(NoticeRecom recom) {
		return mapper.deleteRecom(recom);
	}

	@Override
	public List<NoticeComment> listComment(int no) {
		return mapper.listComment(no);
	}

	@Override
	public void insertComment(NoticeComment comment) {
		mapper.insertComment(comment);
	}

	@Override
	public void deleteComment(int no) {
		mapper.deleteComment(no);
	}

	@Override
	public void updateComment(NoticeComment comment) {
		mapper.updateComment(comment);
	}

	@Override
	public List<Notice> category(NoticePage2 noticePage) {
		return mapper.categoryList(noticePage);
	}

	@Override
	public int categoryCount(NoticePage2 noticePage) {
		return mapper.categoryCount(noticePage);
	}

	@Override
	public void updateViewCnt(int no) {
		mapper.updateViewCnt(no);
	}

	@Override
	public int recomExist(NoticeRecom recom) {
		return mapper.recomExist(recom);
	}

	@Override
	public int recomCount(int no) {
		return mapper.recomCount(no);
	}

	/**
	 * 물어볼 예제
	 */
	@Override
	public int commentCount(int no) {
		return mapper.CommentCount(no);
	}

}
