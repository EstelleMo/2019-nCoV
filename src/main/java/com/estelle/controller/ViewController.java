package com.estelle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estelle.service.StudentService;
import com.estelle.service.impl.StudentServiceImpl;

@Controller
public class ViewController {

	@Autowired
	private StudentService userServiceImpl;

	@RequestMapping("/")
	public ModelAndView loadIndex() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		return "login";
	}

	@RequestMapping("/index")
	public String index() {

		return "index";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request
			, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session.getAttribute("student")!=null) {
			
			session.removeAttribute("student");
			return "/test";
		}else if(session.getAttribute("manager")!=null) {
			session.removeAttribute("manager");
			return "manager";
		}
		return "login";
	}

	@RequestMapping("/person")
	public String person() {

		return "person";
	}

	@RequestMapping(value = "/manager")
	public String manager() {

		return "manager";
	}
	@RequestMapping(value = "/managertop")
	public String managertop() {
		
		return "managertop";
	}
	@RequestMapping(value = "/managermenu")
	public String managermenu() {
		
		return "managermenu";
	}

	@RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		return "test";
	}

	@RequestMapping("/menu")
	public String menu() {

		return "menu";
	}

	@RequestMapping("/welcome")
	public String welcome() {

		return "welcome";
	}

	@RequestMapping("/managerwel")
	public String managerwel() {

		return "managerwel";
	}

	@RequestMapping("/top")
	public String top() {

		return "top";
	}

	@RequestMapping("/ncov")
	public String ncov() {

		return "ncov";
	}

	@RequestMapping("/normal")
	public String normal() {

		return "normal";
	}

	@RequestMapping("/daily")
	public String daily() {

		return "daily";
	}

}
