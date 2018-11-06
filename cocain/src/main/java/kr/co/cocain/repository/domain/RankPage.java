package kr.co.cocain.repository.domain;

public class RankPage {

	private int pageNo;
	private int begin;
	
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBegin() {
		return (pageNo-1)*20;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	//commit;
	
}