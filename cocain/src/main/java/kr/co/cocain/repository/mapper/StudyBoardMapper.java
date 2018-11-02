package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.StudyBoard;


public interface StudyBoardMapper {
	List<StudyBoard> selectBoard();
	StudyBoard selectBoardByNo(int no);
	void insertBoard(StudyBoard board);
	int deleteBoard(int no);
	int updateBoard(StudyBoard board);
	// 카테고리
	List<QuizCategory> selectCategory();
}
