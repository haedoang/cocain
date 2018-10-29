package kr.co.cocain.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuizBoard {
	private int quizNo;
	private int typeNo;
	private int categoryNo;
	private int levelNo;
	private String id;
	private String title;
	private String content;
	private Date regDate;
	private String hint;
	private String correct;
	private int answerCnt; // 정답 맞춘사람 수
	private int tryCnt; //문제 푼 사람 수
	
}
