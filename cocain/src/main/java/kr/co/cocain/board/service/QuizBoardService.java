package kr.co.cocain.board.service;

import java.util.List;
import java.util.Map;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizBoardSearch;
import kr.co.cocain.repository.domain.QuizComment;
import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.repository.domain.QuizSubmit;

public interface QuizBoardService {
	
	//dq list
	Map<String,Object> selectDQList(QuizPage quizPage);
	
	
	//uq list
	Map<String,Object> selectUQList(QuizPage quizPage);
	
	//dq up.. form data invoke
	Map<String,Object> onLoadForm();

	//dq insert
	void insertQuizBoard(QuizBoard quizBoard);

	// detail.
	Map<String,Object> selectQuizBoardByNo(int quizNo);
	
	//정답 호출 ajax
	int selectQuizCorrect(QuizBoard quizBoard);


	void deleteQuizBoard(int quizNo);


	//paging count..
	int selectDQListCount();
	int selectUQListCount();


	Map<String,Object> selectQuizSearch(QuizBoard quizBoard);

	//submit 게시판
	Map<String,Object> selectSubmitList(QuizPage quizPage);
	int selectSubmitListCount();
	
	//submit 등록하기!!!
	void insertQuizSubmit(QuizSubmit quizSubmit);

	//게시글 수정하기 
	void updateQuizBoard(QuizBoard quizBoard);
	
	//댓글목록
	List<QuizComment> selectCommentByNo(int QuizNo);

	void insertComment(QuizComment quizComment);


	void deleteComment(int comNo);


	void updateComment(QuizComment quizComment);

	
	//quiz board search test
	List<QuizBoard> selectSearchBoard(QuizBoardSearch quizBoardSearch);
	int selectSearchBoardCount(QuizBoardSearch quizBoardSearch);

}
