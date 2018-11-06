package kr.co.cocain.repository.domain;

public class QnaPageSearch {
	private String select;
	private String keyword;
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

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
