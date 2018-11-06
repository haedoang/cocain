package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.domain.QnaComment;
import kr.co.cocain.repository.domain.QnaPage;
import kr.co.cocain.repository.domain.QnaPageSearch;
import kr.co.cocain.repository.domain.QnaRecom;

public interface QnaMapper {
	
	// 리스트
	List<Qna> listqna(QnaPage qnaPage);
	// 검색 리스트
	List<Qna> searchlist(QnaPageSearch qps);
	
	int searchlistCount(QnaPageSearch qps);
	
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
	
	//추천여부 확인 0 or 1
	int recomExist(QnaRecom recom);
	// 추천수
	int recomCount(int no);
	int insertRecom(QnaRecom recom);
	int deleteRecom(QnaRecom recom);
}
