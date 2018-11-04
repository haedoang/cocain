package kr.co.cocain.repository.domain;

public class QuizBoardSearch {
	
	//검색으로 보낼 데이터. 
	// typeNo , categoryNo , title, nickname , word 검색어 
	
	private int typeNo;
	private int categoryNo;
	private int search; // nick or title 
	private String word; // 입력받아서 보낼 값
	
	private int pageNo;
	private int begin;
	
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBegin() {
		return (pageNo-1)*10;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	
	
	
	
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "QuizBoardSearch [typeNo=" + typeNo + ", categoryNo=" + categoryNo + ", search=" + search + ", word="
				+ word + ", pageNo=" + pageNo + ", begin=" + begin + "]";
	}
	


	
}
