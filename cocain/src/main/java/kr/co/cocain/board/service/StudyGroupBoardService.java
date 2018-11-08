package kr.co.cocain.board.service;

import java.util.List;
import java.util.Map;


import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.StudyBoard;
import kr.co.cocain.repository.domain.StudyComment;
import kr.co.cocain.repository.domain.StudyPage;


public interface StudyGroupBoardService {

	List<StudyBoard> list(StudyPage studyPage);
	StudyBoard detail(int no);
	void write(StudyBoard board);
	void delete(int no);
	public StudyBoard updateForm(int no); 
	void update(StudyBoard board);
	List<QuizCategory> category();

	void viewCnt(int no);

	List<StudyComment> listComment(int no);
	void insertComment(StudyComment studyComment);
	void deleteComment(int no);
	void updateComment(StudyComment studyComment);
	int commentCnt(int no);
	
	int selectBoardCount();
	
	
	List<StudyBoard> searchStudy(StudyBoard board);

}
