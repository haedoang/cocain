package kr.co.cocain.board.service;

import java.util.List;
import java.util.Map;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizPage;

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


	List<QuizBoard> selectQuizSearch(QuizBoard quizBoard);

	
	//test	
}
