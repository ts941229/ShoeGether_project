package com.koreait.shoegether.aop.admin;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import com.koreait.shoegether.exception.StrangerException;

public class AdminSessionCheckAspect {
	
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable, StrangerException{
		//System.out.println("원래 호출하려했던 메서드는 : "+joinPoint.getSignature().getName());
		Object[] args = joinPoint.getArgs();
		
		HttpServletRequest request = null;
		HttpSession session = null;
		
		Object result=null;
		
		for(Object obj : args) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		
		String uri = request.getRequestURI();
		
		if(uri.equals("/admin/loginform") || uri.equals("/admin/login") || uri.equals("/admin/logout")) {
			result = joinPoint.proceed();
		}else {
			session = request.getSession();
			if(session.getAttribute("admin")==null) {
				throw new StrangerException("잘못된 접근입니다. 다시 로그인 해주세요.");
			}else {
				result = joinPoint.proceed();
			}
		}
		return result;
	}
}
