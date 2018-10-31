package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.QuizLevel;
import kr.co.cocain.repository.domain.QuizPage;

public interface QuizMapper {
	
	//category, level 
	List<QuizCategory> selectCategory();
	List<QuizLevel> selectLevel();
	
	//daily quiz list
	List<QuizBoard> selectDQList(QuizPage quizPage);
	//user quiz list
	List<QuizBoard> selectUQList(QuizPage quizPage);
	
	//paging count..
	int selectDQListCount();
	int selectUQListCount();

	
	//quiz insert..
	void insertQuizBoard(QuizBoard quizBoard);
	
	//quiz detail
	QuizBoard selectQuizBoardByNo(int quizNo);
	
	//uq correct return true 1 false 0 
	int selectQuizCorrect(QuizBoard quizBoard);
	
	void deleteQuizBoard(int quizNo);
	
	
	//paging test
	List<QuizBoard> selectQuizPaging(int PageNo);
	
}
