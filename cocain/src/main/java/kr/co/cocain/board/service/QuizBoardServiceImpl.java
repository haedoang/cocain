package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.mapper.QuizMapper;

@Service
public class QuizBoardServiceImpl  implements QuizBoardService{
	@Autowired
	QuizMapper mapper;
	
	
	@Override
	public List<QuizBoard> selectDQList() {
		
		return mapper.selectDQList();
	}

}
