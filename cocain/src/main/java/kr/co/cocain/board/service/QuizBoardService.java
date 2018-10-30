package kr.co.cocain.board.service;

import java.util.List;
import java.util.Map;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.QuizLevel;

public interface QuizBoardService {
	
	//dq list
	Map<String,Object> selectDQList();
	
	
	//uq list
	Map<String,Object> selectUQList();
	
	//dq up.. form data invoke
	Map<String,Object> onLoadForm();

	//dq insert
	void insertQuizBoard(QuizBoard quizBoard);

	
	
}
