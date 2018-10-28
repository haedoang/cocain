package kr.co.cocain.repository.domain;

import java.util.Date;


public class User {
	private String id;
	private String password;
	private String nickname;
	private String email;
	private int point;
	private Date regDate;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", nickname=" + nickname + ", email=" + email + ", point="
				+ point + ", regDate=" + regDate + "]";
	}
	
} // end class
