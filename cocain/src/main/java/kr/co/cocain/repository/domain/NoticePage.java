package kr.co.cocain.repository.domain;

public class NoticePage {

		private String select;
		private String text;
		private int pageNo;
		private int begin;
		private int end;
		
		
		
		public String getSelect() {
			return select;
		}
		public void setSelect(String select) {
			this.select = select;
		}
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		public int getPageNo() {
			return pageNo;
		}
		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}
		public int getBegin() {
			return (pageNo-1)*10 +1;
		}
		public void setBegin(int begin) {
			this.begin = begin;
		}
		public int getEnd() {
			return pageNo*10;
		}
		public void setEnd(int end) {
			this.end = end;
		}
		@Override
		public String toString() {
			return "NoticePage [select=" + select + ", text=" + text + ", pageNo=" + pageNo + ", begin=" + begin
					+ ", end=" + end + "]";
		}
		
		
	
}
