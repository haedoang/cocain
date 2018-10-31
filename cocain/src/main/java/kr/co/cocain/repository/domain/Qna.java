package kr.co.cocain.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {

	private int no;
	private int viewCnt;
	private String qnaStatus;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
}
