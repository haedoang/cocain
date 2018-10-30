package kr.co.cocain.repository.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class QuizBoard {
	private int quizNo;
	private int typeNo;
	private int categoryNo;
	private int levelNo;
	private String nickname;
	private String title;
	private String content;
	private Date regDate;
	private Date endDate;
	private String hint;
	private String correct;
	private int answerCnt; // 정답 맞춘사람 수
	private int tryCnt; //문제 푼 사람 수
	private double probability;//확률 ㅎㅎ; 
	
	//확률 처리하기~! 
	public double getProbability() {
		if(this.tryCnt==0) {
			return 0;
		}else {
		double result = (double)this.answerCnt/this.tryCnt*100.0;
		return result;
		}
	}
	
	
	public void setProbability(double probability) {
		this.probability = probability;
	}
	
	
	
	public int getQuizNo() {
		return quizNo;
	}
	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
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
	public int getLevelNo() {
		return levelNo;
	}
	public void setLevelNo(int levelNo) {
		this.levelNo = levelNo;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	//마감 날짜 설정하기!! 
	public Date getEndDate() {
		SimpleDateFormat sdf= 
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Calendar cal= Calendar.getInstance();
		cal.setTime(regDate);
		cal.add(Calendar.DATE,1);
		
		return cal.getTime();
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getHint() {
		return hint;
	}
	public void setHint(String hint) {
		this.hint = hint;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	public int getAnswerCnt() {
		return answerCnt;
	}
	public void setAnswerCnt(int answerCnt) {
		this.answerCnt = answerCnt;
	}
	public int getTryCnt() {
		return tryCnt;
	}
	public void setTryCnt(int tryCnt) {
		this.tryCnt = tryCnt;
	}


	@Override
	public String toString() {
		return "QuizBoard [quizNo=" + quizNo + ", typeNo=" + typeNo + ", categoryNo=" + categoryNo + ", levelNo="
				+ levelNo + ", nickname=" + nickname + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", endDate=" + endDate + ", hint=" + hint + ", correct=" + correct + ", answerCnt="
				+ answerCnt + ", tryCnt=" + tryCnt + ", probability=" + probability + "]";
	}



	
	
	
	
	
	
	
}
