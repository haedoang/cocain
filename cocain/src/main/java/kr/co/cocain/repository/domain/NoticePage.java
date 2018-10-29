package kr.co.cocain.repository.domain;

public class NoticePage {

		private int pageNo;
		private int begin;
		private int end;
		
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
		
		
	
}
