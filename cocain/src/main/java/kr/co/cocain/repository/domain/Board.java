package kr.co.cocain.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private String writer;
	private String content;
	private String title;
	private int no;
	private Date regDate;
}
