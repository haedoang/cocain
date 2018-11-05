package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.cocain.repository.domain.UserRank;
import kr.co.cocain.repository.mapper.UserMapper;


@Controller
public class RankBoardServiceImpl implements RankBoardService{

	@Autowired
	UserMapper mapper;
	
	@Override
	public List<UserRank> selectRank() {
		return mapper.selectRank();
	}

}
