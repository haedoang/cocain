package kr.co.cocain.repository.mapper;

import java.util.List;


import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.StudyBoard;
import kr.co.cocain.repository.domain.StudyComment;
import kr.co.cocain.repository.domain.StudyPage;


public interface StudyBoardMapper {
	List<StudyBoard> selectBoard(StudyPage studyPage);
	StudyBoard selectBoardByNo(int no);
	void insertBoard(StudyBoard board);
	int deleteBoard(int no);
	int updateBoard(StudyBoard board);
	// 카테고리
	List<QuizCategory> selectCategory();
	// 조회수
	void viewCnt(int no);
	
	// 댓글 관련
	List<StudyComment> listComment(int no);
	void insertComment(StudyComment studyComment);
	void deleteComment(int no);
	void updateComment(StudyComment studyComment);
	int commentCount(int no);
	// 페이징
	int selectBoardCount();
	
	// 검색
	List<StudyBoard> searchStudy(StudyBoard board);
	
}
