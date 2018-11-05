package kr.co.cocain.board.service;

import java.util.List;

import kr.co.cocain.repository.domain.UserRank;

public interface RankBoardService {
	
	
	List<UserRank> selectRank();
}
