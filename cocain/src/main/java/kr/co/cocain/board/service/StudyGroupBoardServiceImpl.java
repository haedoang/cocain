package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.StudyBoard;
import kr.co.cocain.repository.domain.StudyComment;
import kr.co.cocain.repository.domain.StudyPage;
import kr.co.cocain.repository.mapper.StudyBoardMapper;

@Service
public class StudyGroupBoardServiceImpl implements StudyGroupBoardService {
	
	@Autowired
	private StudyBoardMapper mapper;
/*	
	@Override
	public List<StudyBoard> list() {
		mapper.selectBoard();
		System.out.println(new StudyBoard().toString());
		return mapper.selectBoard();
	}*/

	@Override
	public List<StudyBoard> list(StudyPage studyPage) {
		List<StudyBoard> list = mapper.selectBoard(studyPage);

		return list;
	}

	@Override
	public StudyBoard detail(int no) {
		mapper.viewCnt(no);
		
		return mapper.selectBoardByNo(no);
	}

	@Override
	public void write(StudyBoard board) {
		mapper.insertBoard(board);
		
	}
	
	@Override
	public void delete(int no) {
		mapper.deleteBoard(no);
	}
	
	@Override
	public StudyBoard updateForm(int no) {
		return mapper.selectBoardByNo(no);
	}

	@Override
	public void update(StudyBoard board) {
		mapper.updateBoard(board);
	}
	
	@Override
	public List<QuizCategory> category() {
		List<QuizCategory> category = mapper.selectCategory();
		
		return category;
	}

	// 조회수
	public void viewCnt(int no) {
		mapper.viewCnt(no);
	}
	
	public List<StudyComment> listComment(int no) {
		return mapper.listComment(no);
	}
	
	@Override
	public void insertComment(StudyComment studyComment) {
		mapper.insertComment(studyComment);
	}
	@Override
	public void deleteComment(int no) {
		mapper.deleteComment(no);
	}
	@Override
	public void updateComment(StudyComment studyComment) {
		mapper.updateComment(studyComment);
	}

	@Override
	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}
	
	@Override
	public int commentCnt(int no) {
		return mapper.commentCount(no);
	}
	
}
