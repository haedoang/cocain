package kr.co.cocain.user.service;

import kr.co.cocain.repository.domain.User;


/**
 * 유저에 대한 로직 처리
 * @author 조성일
 */
public interface UserService {

	/**
	 * 회원 등록에 대한 처리
	 * @param user
	 */
	void register(User user);
	
	/**
	 * 회원 가입시 아이디 중복 체크에 대한 처리
	 * @param user
	 */
	int checkId(User user);
	
	/**
	 * 회원 가입시 닉네임 중복 체크에 대한 처리
	 * @param user
	 */
	int checkName(User user);
	
/*	*//**
	 * 회원 가입시 이메일 인증코드 생성
	 *//*
	String createKey();*/
	
	/**
	 * 회원 가입시 인증코드 메일 보내기
	 */
	String sendMail(User user);
	
} // end interface
