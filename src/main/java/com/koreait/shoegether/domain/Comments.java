package com.koreait.shoegether.domain;

import lombok.Data;

@Data
public class Comments {
	private int comment_id;
	private int board_id;
	private String writer;
	private String content;
	private String date;
	private String spacing;
	private String inner;
}
