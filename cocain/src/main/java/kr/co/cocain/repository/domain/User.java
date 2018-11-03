package kr.co.cocain.repository.domain;

import java.util.Date;
import java.util.List;


/**
 * 유저관리에 대한 VO
 * @author 조성일
 */
public class User {
	private String id;
	private String password;
	private String nickname;
	private String email;
	private int point;
	private Date regDate;
	private UserFile userFile;

	
	// 유저 파일
	public UserFile getUserFile() {
		return userFile;
	}
	public void setUserFile(UserFile userFile) {
		this.userFile = userFile;
	}
	
	// 유저 아이디
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	// 유저 비밀번호
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	// 유저 닉네임
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	// 유저 이메일
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	// 유저 포인트
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	// 유저 등록일
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	// toString
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", nickname=" + nickname + ", email=" + email + ", point="
				+ point + ", regDate=" + regDate + ", userFile=" + userFile + "]";
	}
	
} // end class
