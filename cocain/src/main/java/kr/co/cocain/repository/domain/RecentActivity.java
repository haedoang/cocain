package kr.co.cocain.repository.domain;

import java.util.Date;


/**
 * 최근활동에 대한 VO
 * @author 조성일
 */
public class RecentActivity {
	private int no;
	private String title;
	private String writer;
	private String typeqna;
	private Date regDate;
	private int pageNo;
	private int begin;
	
	
	// 페이지 번호
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	// 페이지의 게시물 시작번호
	public int getBegin() {
		return (pageNo - 1) * 5;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	// 게시물 번호
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	// 게시물 제목
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	// 게시물 작성자
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	// 게시판 타입
	public String getTypeqna() {
		return typeqna;
	}
	public void setTypeqna(String typeqna) {
		this.typeqna = typeqna;
	}
	
	// 게시물 등록일
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	// toString
	@Override
	public String toString() {
		return "RecentActivity [no=" + no + ", title=" + title + ", writer=" + writer + ", typeqna=" + typeqna
				+ ", regDate=" + regDate + ", pageNo=" + pageNo + ", begin=" + begin + "]";
	}
	
} // end class
