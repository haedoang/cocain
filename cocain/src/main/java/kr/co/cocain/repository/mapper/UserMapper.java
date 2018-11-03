package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.RecentActivity;
import kr.co.cocain.repository.domain.User;
import kr.co.cocain.repository.domain.UserFile;
import kr.co.cocain.repository.domain.UserRank;


/**
 * 유저에 대한 매퍼 인터페이스
 * @author 조성일
 */
public interface UserMapper {
	
	/**
	 * 회원 등록
	 * @param user
	 */
	void registerUser(User user);
	
	/**
	 * 회원 가입시 아이디 중복 체크
	 * @param user
	 */
	int checkId(User user);
	
	/**
	 * 회원 가입시 닉네임 중복 체크
	 * @param user
	 */
	int checkName(User user);

	/**
	 * 로그인
	 * @param user
	 */
	User userLogin(User user);
	
	/**
	 * 현재 비밀번호 확인
	 * @param id
	 */
	User checkPass(String id);
	
	/**
	 * 비밀번호 수정
	 * @param user
	 */
	void updatePass(User user);
	
	/**
	 * 파일 등록
	 * @param userFile
	 */
	void insertFile(UserFile userFile);
	
	/**
	 * 파일 삭제
	 * @param userFile
	 */
	void deleteFile(UserFile userFile);
	
	/**
	 * 유저 파일 검색
	 * @param userFile
	 */
	UserFile selectFile(UserFile userFile);
	
	/**
	 * 최근활동 리스트
	 * @param recentActivity
	 */
	List<RecentActivity> userRecentActivity(RecentActivity recentActivity);
	
	/**
	 * 최근활동 리스트 갯수
	 * @param recentActivity
	 */
	int userRecentActivityCount(RecentActivity recentActivity);
	
	/**
	 * 전체 게시물 수
	 */
	int allArticleCount();
	
	/**
	 * 전체 문제 수
	 */
	int allQuizCount();
	
	/**
	 * 닉네임에 대한 유저정보
	 * @param writer
	 */
	User selectUser(String writer);
	
	/**
	 * 해당 유저 랭킹
	 * @param nickname
	 */
	UserRank selectRankById(String nickname);
	
	/**
	 * 유저 랭킹
	 */
	List<UserRank> selectRank();
	
} // end interface
