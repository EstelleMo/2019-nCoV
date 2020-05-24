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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.estelle.bean.Epidemic;
import com.estelle.bean.FamHealthy;
import com.estelle.bean.Fever;
import com.estelle.bean.PageBean;
import com.estelle.bean.Student;
import com.estelle.bean.StudentHealthy;
import com.estelle.service.EpidemicService;
import com.estelle.service.FamilyService;
import com.estelle.service.FeverService;
import com.estelle.service.StudentService;
import com.estelle.service.impl.StudentServiceImpl;

@Controller
public class ViewController {

	@Autowired
	private StudentService sServiceImpl;
	@Autowired
	private FamilyService fServiceImpl;
	@Autowired
	private EpidemicService eServiceImpl;
	@Autowired
	private FeverService feverServiceImpl;

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

	@RequestMapping("/epidemic")
	public String epidemic() {

		return "epidemic";
	}

	@RequestMapping("/ncovinfo")
	public String ncovinfo() {

		return "checkncov";
	}

	@RequestMapping("/ncovHistory")
	public String ncovHistory(
			HttpServletRequest request,
			HttpServletResponse response
			) {
		return "ncovHistory";
	}
	@RequestMapping("/dailyHistory")
	public String dailyHistory(
			HttpServletRequest request,
			HttpServletResponse response
			) {
		return "dailyHistory";
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
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		String sno = student.getNo();
		PageBean fpageBean = fServiceImpl.findAllFamily(sno);
		session.setAttribute("fpageBean", fpageBean);
		return "daily";
	}

	@RequestMapping("/addFamily")
	public String family() {
		
		return "addFamily";
	}

	@RequestMapping("/showFamily")
	public String familyList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		String sno = student.getNo();
		PageBean fpageBean = fServiceImpl.findAllFamily(sno);
		session.setAttribute("fpageBean", fpageBean);
		return "familyDaily";
	}

	@RequestMapping("/fever")
	public String showFever() {

		return "fever";
	}
	@RequestMapping("/feverHistory")
	public String feverHistory() {
		
		return "feverHistory";
	}
	@RequestMapping("/feverList")
	public String feverList(HttpServletRequest request, HttpServletResponse respons) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		List<Fever> feverList = feverServiceImpl.findList(student.getNo());
		
		return "feverList";
	}

	@RequestMapping("/backSchool")
	public String showBack() {

		return "backSchool";
	}
	@RequestMapping("/back")
	public String backResult() {
		
		return "backResult";
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

		return "dailyList";
	}

	// 查看学生打卡详情的页面
	@RequestMapping("/checkList")
	@ResponseBody
	public StudentHealthy studentSub(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String subDate = request.getParameter("subDate");
		StudentHealthy sh = sServiceImpl.findMyDailyHistory(subDate);
		session.setAttribute("sh", sh);
		return sh;
	}
	// 查看
	@RequestMapping("/ncovList")
	public String ncovList(HttpServletRequest request, HttpServletResponse respons,
			@Param(value = "subDate") Date subDate) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		List<Epidemic> ncovList = eServiceImpl.findHistory(student.getNo());
		session.setAttribute("ncovList", ncovList);
		
		return "ncovList";
	}
	
	// 查看疫情防控信息详情的页面
	@RequestMapping("/checkNcovList")
	@ResponseBody
	public Epidemic checkNcovList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String subDate = request.getParameter("subDate");
		Epidemic e = eServiceImpl.findMyEpidemicHistory(subDate);
		session.setAttribute("e", e);
		return e;
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
