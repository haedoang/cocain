package kr.co.cocain.repository.domain;

import lombok.Data;

@Data
public class QuizType {
	private int typeNo;
	private String typeName;
	
	//1 DailyQuiz 2 UserQuiz
}
