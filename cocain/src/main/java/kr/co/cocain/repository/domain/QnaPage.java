package kr.co.cocain.repository.domain;

public class QnaPage {
	private int pageNo;
	private int begin;
	
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBegin() {
		return (pageNo-1)*15;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
}
