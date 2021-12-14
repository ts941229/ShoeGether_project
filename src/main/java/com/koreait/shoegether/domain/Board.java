package com.koreait.shoegether.domain;

import lombok.Data;

@Data
public class Board {
	private int board_id;
	private String title;
	private String writer;
	private String content;
	private String date;
	private int hit;
}