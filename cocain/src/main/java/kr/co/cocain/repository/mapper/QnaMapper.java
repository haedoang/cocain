package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.domain.QnaComment;
import kr.co.cocain.repository.domain.QnaPage;

public interface QnaMapper {

	List<Qna> listqna(QnaPage qnaPage);
	int listCount();
	void writeqna(Qna qna);
	Qna detailqna(int no);
	void deleteqna(int no);
	void updateqna(Qna qna);
	
//	int qnaPagingCount();

	List<QnaComment> listComment(int no);
	void insertComment(QnaComment comment);
	void deleteComment(int no);
	void updateComment(QnaComment comment);
	
}
