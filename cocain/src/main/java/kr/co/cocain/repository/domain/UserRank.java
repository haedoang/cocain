package kr.co.cocain.repository.domain;


/**
 * 유저 랭킹에 대한 VO
 * @author 조성일
 */
public class UserRank {
	private String id;
	private String nickname;
	private int point;
	private int rank;
	
	
	// 유저 아이디
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	// 유저 닉네임
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	// 유저 포인트
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	// 유저 랭킹
	public int getrank() {
		return rank;
	}
	public void setrank(int rank) {
		this.rank = rank;
	}
	
	// toString
	@Override
	public String toString() {
		return "UserRank [id=" + id + ", nickname=" + nickname + ", point=" + point + ", rank=" + rank + "]";
	}
	
	
} // end class
