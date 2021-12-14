package com.koreait.shoegether.domain;

import lombok.Data;

@Data
public class Admin {
	private int admin_id;
	private String admin_name;
	private String password;
	private String email;
	
}
