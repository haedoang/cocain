package kr.co.cocain.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuizComment {
	
	//user quiz 댓글
	private int comNo;
	private int quizNo;
	private String nickname;
	private String content;
	private Date regDate;
	
}
