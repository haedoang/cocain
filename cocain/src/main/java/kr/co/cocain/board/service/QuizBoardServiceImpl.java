package kr.co.cocain.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.mapper.QuizMapper;

@Service
public class QuizBoardServiceImpl  implements QuizBoardService{
	
	@Autowired
	QuizMapper mapper;
	
	
	@Override
	public Map<String,Object> selectDQList() {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectDQList());
		map.put("category", mapper.selectCategory());
		map.put("level", mapper.selectLevel());
		
		return map;
	}


	@Override
	public Map<String, Object> selectUQList() {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectUQList());
		map.put("category", mapper.selectCategory());
		map.put("level", mapper.selectLevel());
		
		return map;	
	}

}
