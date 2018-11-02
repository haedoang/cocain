package kr.co.cocain.repository.domain;

import java.util.Date;

import lombok.Data;
@Data
public class StudyBoard {
	private int no;
	private String id;
	private String content;
	private int viewCnt;
	private String title;
	private Date regDate;
	private String categoryName;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "StudyBoard [no=" + no + ", id=" + id + ", content=" + content + ", viewCnt=" + viewCnt + ", title="
				+ title + ", regDate=" + regDate + "]";
	}
	
	
}
