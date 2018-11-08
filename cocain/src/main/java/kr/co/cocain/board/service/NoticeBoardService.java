package kr.co.cocain.board.service;

import java.util.List;

import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticePage2;
import kr.co.cocain.repository.domain.NoticeRecom;

public interface NoticeBoardService {

	int listCount();

	List<Notice> listNotice(NoticePage page);

	List<Notice> listNotice2(NoticePage page);

	List<Notice> listNotice3(NoticePage page);

	Notice detail(int no);

	void write(Notice notice);

	void delete(int no);

	void update(Notice notice);

	int insertRecom(NoticeRecom notice);

	int deleteRecom(NoticeRecom recom);
	// 댓글

	List<NoticeComment> listComment(int no);

	void insertComment(NoticeComment comment);

	void deleteComment(int no);

	void updateComment(NoticeComment comment);

	List<Notice> category(NoticePage2 noticePage);

	int categoryCount(NoticePage2 noticePage);

	void updateViewCnt(int no);

	// 추천여부 확인
	int recomExist(NoticeRecom recom);

	// 추천수 카운트
	int recomCount(int no);

	/**
	 * 물어볼 예제
	 * 
	 * @param no
	 * @return
	 */
	int commentCount(int no);

}
