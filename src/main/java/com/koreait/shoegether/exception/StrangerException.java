package com.koreait.shoegether.exception;

public class StrangerException extends RuntimeException{
	
	public StrangerException(String msg) {
		super(msg);
	}
	public StrangerException(Throwable e) {
		super(e);
	}
	public StrangerException(String msg, Throwable e) {
		super(msg, e);
	}
}
