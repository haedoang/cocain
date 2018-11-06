package kr.co.cocain.repository.domain;

import java.util.Date;


/**
 * 메인화면 검색 대한 VO
 * @author 조성일
 */
public class MainSearch {
	private int no;
	private String title;
	private String writer;
	private String content;
	private String typeqna;
	private Date regDate;
	private int comCnt;
	private String searchContent;
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
		return (pageNo - 1) * 10;
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
	
	// 댓글 수
	public int getComCnt() {
		return comCnt;
	}
	public void setComCnt(int comCnt) {
		this.comCnt = comCnt;
	}
	
	// 게시물 내용
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	// 검색어
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	// toString
	@Override
	public String toString() {
		return "MainSearch [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", typeqna=" + typeqna + ", regDate=" + regDate + ", comCnt=" + comCnt + ", searchContent="
				+ searchContent + ", pageNo=" + pageNo + ", begin=" + begin + "]";
	}
	
} // end class
