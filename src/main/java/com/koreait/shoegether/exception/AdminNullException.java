package com.koreait.shoegether.exception;

public class AdminNullException extends RuntimeException{
	
	public AdminNullException(String msg) {
		super(msg);
	}
	public AdminNullException(Throwable e) {
		super(e);
	}
	public AdminNullException(String msg, Throwable e) {
		super(msg, e);
	}
}
