package com.koreait.shoegether.domain;

import lombok.Data;

@Data
public class Member {
	 private int member_id;
	 private String host_id;
	 private String password;
	 private String name;
	 private String date;
	 private String auth;
}
