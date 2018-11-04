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
	// 조회수 증가
	void viewCnt(int no);

	List<QnaComment> listComment(int no);
	void insertComment(QnaComment comment);
	void deleteComment(int no);
	void updateComment(QnaComment comment);
	// 댓글 수 확인
	int commentCount(int no);
	
	// 답변선택하기
	void selectAnswerList(int no);
	void selectAnswerComment(int no);
	// 채택답변존재여부 확인
	int answerCount(int no);
}
