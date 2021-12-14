package com.koreait.shoegether.controller.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.shoegether.domain.Admin;
import com.koreait.shoegether.exception.AdminNullException;
import com.koreait.shoegether.model.service.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//로그인폼 요청
	@GetMapping("/loginform")
	public String loginForm(HttpServletRequest request) {
		return "admin/login/loginform";
	}
	
	//로그인 요청
	@PostMapping("/login")
	public String login(Admin admin, HttpServletRequest request) {
		Admin manager = adminService.select(admin);
		
		HttpSession session = request.getSession();
		session.setAttribute("admin", manager);
		
		return "redirect:/admin/main";
	}
	
	//메인페이지 요청
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {
		return "admin/main/index";
	}

	//로그아웃 요청
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "admin/login/loginform";
	}

}
