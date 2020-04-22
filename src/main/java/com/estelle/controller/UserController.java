package com.estelle.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.estelle.bean.Manager;
import com.estelle.bean.Student;
import com.estelle.bean.StudentHealthy;
import com.estelle.service.ManagerService;
import com.estelle.service.StudentService;
import com.estelle.util.PwdUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private StudentService stuService;
	@Autowired
	private ManagerService manService;

	@RequestMapping("/login")
	public @ResponseBody ModelAndView studentLogin(HttpServletRequest request, HttpServletResponse response,
			@Param("no") String no, @Param("password") String password, @Param("checkcode") String checkcode) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("verifyCodeValue");

		if (check.equalsIgnoreCase(checkcode)) {
			Student student = stuService.login(no, password);
			if (student != null) {
				session.setAttribute("student", student);
				String sname = student.getName();
				mav.setViewName("test"); // 要改成 index
				return mav;
			} else { // 若学生表中找不到该用户则到managaer表中查找
				Manager manager = manService.login(no, password);
				session.setAttribute("manager", manager);
				mav.setViewName("manager");
				return mav;
			}
		} else if (!check.equals(checkcode)) {
			RuntimeException runtimeException = new RuntimeException("验证码错误");
			mav.setViewName("login");
			return mav;
		}
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping("/dailyList")
	public String dailyList(HttpServletRequest request, HttpServletResponse response,
			@Param(value = "subDate") Date subDate) {

		System.out.println(subDate);
		

		return "success";
	}

	@RequestMapping("/backApp")
	public String backApplication() {

		return "Appsuccess";
	}

	@RequestMapping("/saveNormal")
	public @ResponseBody() String saveNormal(HttpServletRequest request
			,HttpServletResponse response
			,@Param(value = "nativePlace")String nativePlace
			,@Param(value = "homeDetAdd")String homeDetAdd
			,@Param(value = "tel")String tel
			,@Param(value = "idcard")String idcard
			) {
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		Student student = new Student();
		student.setHomeDetAdd(homeDetAdd);
		student.setIdcard(idcard);
		student.setTel(tel);
		int i = stuService.saveMsg(student);
		
		
		return "success";
	}

	@RequestMapping("/saveDaily")
	public String saveDaily() {

		return "success";
	}
	@RequestMapping("/saveFamDaily")
	public String saveFamDaily() {
		
		return "success";
	}

	@RequestMapping("/getVerifyCode")
	public void generate(HttpServletResponse response, HttpSession session) {
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String verifyCodeValue = drawImg(output);
		// 将校验码保存到session中
		session.setAttribute("verifyCodeValue", verifyCodeValue);

		try {
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
//            Object logger;
//			logger.info("<--验证码前端写出.出现异常-->");
			System.out.println("验证码有误");
			e.printStackTrace();

		}
	}

	/* 绘制验证码 */
	private String drawImg(ByteArrayOutputStream output) {
		String code = "";
		// 随机产生4个字符
		for (int i = 0; i < 4; i++) {
			code += randomChar();
		}
		int width = 70;
		int height = 25;
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
		Font font = new Font("Times New Roman", Font.PLAIN, 20);
		// 调用Graphics2D绘画验证码
		Graphics2D g = bi.createGraphics();
		g.setFont(font);
		Color color = new Color(66, 2, 82);
		g.setColor(color);
		g.setBackground(new Color(226, 226, 240));
		g.clearRect(0, 0, width, height);
		FontRenderContext context = g.getFontRenderContext();
		Rectangle2D bounds = font.getStringBounds(code, context);
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
		g.drawString(code, (int) x, (int) baseY);
		g.dispose();
		try {
			ImageIO.write(bi, "jpg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}

	/* 获取随机参数 */
	private char randomChar() {
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}

}
