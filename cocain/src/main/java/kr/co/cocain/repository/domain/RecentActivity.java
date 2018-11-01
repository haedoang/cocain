package kr.co.cocain.repository.domain;

import java.util.Date;


public class RecentActivity {
	private int no;
	private String title;
	private String writer;
	private String typeqna;
	private Date regDate;
	private int pageNo;
	private int begin;
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getBegin() {
		return (pageNo - 1) * 5;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getTypeqna() {
		return typeqna;
	}
	public void setTypeqna(String typeqna) {
		this.typeqna = typeqna;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "RecentActivity [no=" + no + ", title=" + title + ", writer=" + writer + ", typeqna=" + typeqna
				+ ", regDate=" + regDate + ", pageNo=" + pageNo + ", begin=" + begin + "]";
	}
	
} // end class
