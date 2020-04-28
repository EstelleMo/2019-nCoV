package com.estelle.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estelle.bean.FamHealthy;
import com.estelle.bean.PageBean;
import com.estelle.bean.Student;
import com.estelle.bean.StudentHealthy;
import com.estelle.service.FamilyService;
import com.estelle.service.StudentService;
import com.estelle.service.impl.StudentServiceImpl;

@Controller
public class ViewController {

	@Autowired
	private StudentService sServiceImpl;
	@Autowired
	private FamilyService fServiceImpl;

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
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("student") != null) {

			session.removeAttribute("student");
			return "/test";
		} else if (session.getAttribute("manager") != null) {
			session.removeAttribute("manager");
			return "/manager";
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

	@RequestMapping("/ncovinfo")
	public String ncovinfo() {

		return "checkncov";
	}

	@RequestMapping("/ncovList")
	public String ncovList() {

		return "ncovList";
	}

	@RequestMapping("/feverSub")
	public String feverSub() {

		return "checkfever";
	}

	@RequestMapping("/pwdReset")
	public String pwdReset() {

		return "managerReset";
	}

	@RequestMapping("/card")
	public String card() {

		return "card";
	}

	@RequestMapping("/normal")
	public String normal() {

		return "normal";
	}

	@RequestMapping("/daily")
	public String daily(HttpServletRequest request) {
		System.out.println("daily");
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		String sno = student.getNo();
		PageBean fpageBean = fServiceImpl.findAllFamily(sno);
		session.setAttribute("fpageBean", fpageBean);
		return "daily";
	}

	@RequestMapping("/addFamily")
	public String family() {
		
		return "family";
	}

	@RequestMapping("/showFamily")
	public String familyList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		String sno = student.getNo();
		PageBean fpageBean = fServiceImpl.findAllFamily(sno);
		session.setAttribute("fpageBean", fpageBean);
		return "familyList";
	}

	@RequestMapping("/fever")
	public String showFever() {

		return "fever";
	}

	@RequestMapping("/backSchool")
	public String showBack() {

		return "backSchool";
	}

	@RequestMapping("/outNIn")
	public String showOutNIn() {

		return "outNIn";
	}

	// 查看
	@RequestMapping("/dailyList")
	public String dailyList(HttpServletRequest request, HttpServletResponse respons,
			@Param(value = "subDate") Date subDate) {
		HttpSession session = request.getSession();
		List<StudentHealthy> dailyList = sServiceImpl.findHistory();
		session.setAttribute("dailyList", dailyList);

		return "list";
	}

	// 查看学生打卡详情的页面
	@RequestMapping("/studentSub")
	public String studentSub(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		PageBean pageBean = sServiceImpl.findStudentList();
		session.setAttribute("pageBean", pageBean);
		return "checklist";
	}

	// 修改密码跳转的页面
	@RequestMapping("/resetStudentPwd")
	public String reset() {
		return "reset";
	}

	@RequestMapping("/add")
	public String addStudent() {

		return "student";
	}

	@RequestMapping("/update")
	public String updateStudent() {

		return "student";
	}

}
