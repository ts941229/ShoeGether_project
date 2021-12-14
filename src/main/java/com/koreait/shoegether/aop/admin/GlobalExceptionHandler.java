package com.koreait.shoegether.aop.admin;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.shoegether.exception.AdminNullException;
import com.koreait.shoegether.exception.StrangerException;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(AdminNullException.class)
	public ModelAndView handleException(AdminNullException e) {
		System.out.println("어드민 널 익셉션 호출 : "+e);
		ModelAndView mav = new ModelAndView("error/result");
		mav.addObject("e", e);
		return mav;
	}
	
	@ExceptionHandler(StrangerException.class)
	public ModelAndView handleException(StrangerException e) {
		ModelAndView mav = new ModelAndView("error/result");
		mav.addObject("e", e);
		return mav;
	}
	
}
