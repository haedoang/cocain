package kr.co.cocain.repository.domain;


/**
 * 유저 파일관리에 대한 VO
 * @author 조성일
 */
public class UserFile {
	private String id;
	private String fileName;
	private String uploadPath;
	
	
	// 유저 아이디
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	// 유저 프로필 사진 원본이름
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	// 유저 프로필 사진 저장경로
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	// toString
	@Override
	public String toString() {
		return "UserFile [id=" + id + ", fileName=" + fileName + ", uploadPath=" + uploadPath + "]";
	}
	
} // end class
