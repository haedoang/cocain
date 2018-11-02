package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.QuizCategory;
import kr.co.cocain.repository.domain.StudyBoard;
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
	public List<StudyBoard> list() {
		List<StudyBoard> list = mapper.selectBoard();
		
		System.out.println(list);
		return list;
	}

	@Override
	public StudyBoard detail(int no) {
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
	
	


	
}
