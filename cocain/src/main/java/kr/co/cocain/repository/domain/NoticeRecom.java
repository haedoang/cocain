package kr.co.cocain.repository.domain;

public class NoticeRecom {

	private int no;
	private String id;

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

	@Override
	public String toString() {
		return "NoticeRecom [no=" + no + ", id=" + id + "]";
	}

}
