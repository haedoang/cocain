package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.cocain.repository.domain.RankPage;
import kr.co.cocain.repository.domain.UserRank;
import kr.co.cocain.repository.mapper.UserMapper;


@Controller
public class RankBoardServiceImpl implements RankBoardService{

	@Autowired
	UserMapper mapper;
	
	@Override
	public List<UserRank> selectRankPaging(RankPage rankPage) {
		return mapper.selectRankPaging(rankPage);
	}

	@Override
	public int selectRankCount() {
		return mapper.selectRankCount();
	}

	@Override
	public UserRank selectRankById(String nickname) {
		return mapper.selectRankById(nickname);
	}

}
