package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.RecentActivity;
import kr.co.cocain.repository.domain.User;
import kr.co.cocain.repository.domain.UserFile;


public interface UserMapper {
	
	// 회원 등록
	void registerUser(User user);
	
	// 아이디 중복 체크
	int checkId(User user);
	
	// 닉네임 중복 체크
	int checkName(User user);

	// 로그인
	User userLogin(User user);
	
	// 로그인
	User checkPass(String id);
	
	// 비밀번호 수정
	void updatePass(User user);
	
	// 파일 등록
	void insertFile(UserFile userFile);
	
	// 파일 삭제
	void deleteFile(UserFile userFile);
	
	// 파일정보 검색
	UserFile selectFile(UserFile userFile);
	
	// 최근활동 리스트
	List<RecentActivity> userRecentActivity(String nickname);
	
} // end interface
