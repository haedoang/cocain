package kr.co.cocain.board.service;

import java.util.List;

import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticeRecom;

public interface NoticeBoardService {

    int listCount();

    List<Notice> listNotice(NoticePage page);

    Notice detail(int no);

    void write(Notice notice);

    void delete(int no);

    void update(Notice notice);

	int recom(NoticeRecom recom);

	int insertRecom(NoticeRecom notice);
	
	int deleteRecom(NoticeRecom recom);
//	댓글
	
	List<NoticeComment> listComment(int no);

	

	

    
}
