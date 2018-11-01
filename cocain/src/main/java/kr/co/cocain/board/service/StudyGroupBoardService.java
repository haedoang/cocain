package kr.co.cocain.board.service;

import java.util.List;

import kr.co.cocain.repository.domain.StudyBoard;


public interface StudyGroupBoardService {

	List<StudyBoard> list();
	StudyBoard detail(int no);
	void write(StudyBoard board);
	void delete(int no);
	public StudyBoard updateForm(int no);
	void update(StudyBoard board);

}
