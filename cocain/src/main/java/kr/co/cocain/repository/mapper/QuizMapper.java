package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.QuizComment;
import kr.co.cocain.repository.domain.QuizLevel;
import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.repository.domain.QuizSubmit;

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
	
	//정답 ajax  correct return true 1 false 0 
	int selectQuizCorrect(QuizBoard quizBoard);
	
	//게시글 삭제 
	void deleteQuizBoard(int quizNo);
	
	//게시글 수정
	
	void updateQuizBoard(QuizBoard quizBoard);
	

	//search
	List<QuizBoard> selectQuizSearch(QuizBoard quizBoard);
	
	//제출게시판
	List<QuizSubmit>selectSubmitList(QuizPage quizPage);
	int selectSubmitListCount();
	
	
	//제출게시판 등록하기 
	void insertQuizSubmit(QuizSubmit quizSubmit);
	
	//comment
    List<QuizComment> selectCommentByNo(int QuizNo);
	
	//comment insert
    void insertComment(QuizComment quizComment);
    
    //comment delete
    void deleteComment(int comNo);
    
    //comment update
    void updateComment(QuizComment quizComment);
    
    
	
}
