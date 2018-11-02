package kr.co.cocain.board.service;

import java.util.List;
import java.util.Map;

import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.domain.QnaComment;
import kr.co.cocain.repository.domain.QnaPage;


public interface QNABoardService {
	
	Map<String, Object> listqna(QnaPage qnaPage);
	// paging관련 및 전체 게시글수
	int listCount();
	// paging
//	int qnaPagingCount();
	
	void write(Qna qna);
	Qna detail(int no);
	void delete(int no);
	void update(Qna qna);
	
	List<QnaComment> listComment(int no);
	void insertComment(QnaComment comment);
	void deleteComment(int no);
	void updateComment(QnaComment comment);
	
}
