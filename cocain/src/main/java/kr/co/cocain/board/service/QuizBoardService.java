package kr.co.cocain.board.service;

import java.util.List;
import java.util.Map;

import kr.co.cocain.repository.domain.QuizBoard;

public interface QuizBoardService {
	//category, level
	//List<QuizCategory> selectCategory();
	
	//List<QuizLevel> selectLevel();
	
	//dq list
	Map<String,Object> selectDQList();
	
	
	//uq list
	Map<String,Object> selectUQList();
	
	
	
	
}
