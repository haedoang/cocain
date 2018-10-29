package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.QuizLevel;

public interface QuizMapper {
	
	//category, level 
	List<QuizCategory> selectCategory();
	List<QuizLevel> selectLevel();
	
	//daily quiz list
	List<QuizBoard> selectDQList();
	//user quiz list
	List<QuizBoard> selectUQList();
	
	

	
}
