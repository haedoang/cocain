package kr.co.cocain.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuizSubmit {
	private int submitNo;
	private int quizNo;
	private String nickname;
	private int levelPoint;
	private String evaluation;
	private String path;
	private String fileName;
	private Date regDate;
	
	//commit;
}
