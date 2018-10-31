package kr.co.cocain.repository.domain;


public class UserFile {
	private String id;
	private String fileName;
	private String uploadPath;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	@Override
	public String toString() {
		return "UserFile [id=" + id + ", fileName=" + fileName + ", uploadPath=" + uploadPath + "]";
	}
	
} // end class
