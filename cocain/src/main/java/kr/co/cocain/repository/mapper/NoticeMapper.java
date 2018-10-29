package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticeRecom;

public interface NoticeMapper {

	/**
	 * 공지사항 전체 조회
	 * @param page = pageNo, end, begin(pageNo를 통해 해당 페이지의 첫글번호와 마지막글번호를 가져옴)
	 * @return 공지사항 전체
	 */
	List<Notice> listNotice(NoticePage page);
	
	/**
	 * @return 공지사항 전체 글 갯수
	 */
	int listCount();
	
	/**
	 * 공지사항 글 상세 정보
	 * @param no
	 * @return
	 */
	Notice detailNotice(int no);
	
	void writeNotice(Notice notice);
	
	void deleteNotice(int no);
	
	void updateNotice(Notice notice);
	
	/**
	 * 추천수 표시
	 * @param recom
	 * @return
	 */
	int selectRecom(NoticeRecom recom);
	
	
	int insertRecom(NoticeRecom recom);
	
	List<NoticeComment> listComment(int commentNo);
}
