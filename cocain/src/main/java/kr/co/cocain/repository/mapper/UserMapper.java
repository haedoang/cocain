package kr.co.cocain.repository.mapper;

import kr.co.cocain.repository.domain.User;


public interface UserMapper {
	
	// 회원 등록
	void registerUser(User user);
	
	// 아이디 중복 체크
	int checkId(User user);
	
	// 닉네임 중복 체크
	int checkName(User user);

} // end interface
