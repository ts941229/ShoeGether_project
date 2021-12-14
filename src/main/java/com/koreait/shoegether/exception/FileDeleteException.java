package com.koreait.shoegether.exception;

public class FileDeleteException extends RuntimeException{
	
	public FileDeleteException(String msg) {
		super(msg);
	}
	public FileDeleteException(Throwable e) {
		super(e);
	}
	public FileDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
	
	
}
