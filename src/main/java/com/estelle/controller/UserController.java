package com.estelle.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
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

	@RequestMapping("/login1")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response, @Param("no") String no,
			@Param("password") String password, @Param("checkcode") String checkcode) throws IOException {
		HttpSession session = request.getSession();
		System.out.println(no + " and  " + password);
		System.out.println(checkcode);
		String check = (String) session.getAttribute("verifyCodeValue");

		if (check.equalsIgnoreCase(checkcode)) {
			try {
				System.out.println("进来了");
				// 调用登陆方法
//				 System.out.println(user.getName());
				String auto = request.getParameter("autoLogin");// 登录页面还没添加name属性
				// 保存账号密码到cookie
				if ("on".equals(auto)) {
//					String username = user.getName();
//					Cookie nameCookie = new Cookie("username", username);
//					Cookie pwdCookie = new Cookie("password", password);
//					nameCookie.setMaxAge(Integer.MAX_VALUE);
//					pwdCookie.setMaxAge(Integer.MAX_VALUE);
//					nameCookie.setPath(request.getContextPath());
//					pwdCookie.setPath(request.getContextPath());
//					response.addCookie(nameCookie);
//					response.addCookie(pwdCookie);

				}

//				response.sendRedirect(request.getContextPath());
			} catch (Exception e) {
				request.setAttribute("exception1", e);
				System.out.println(e);
				response.sendRedirect("login");
			}

		} else {
			System.out.println("没进来");
			RuntimeException runtimeException = new RuntimeException("验证码错误");
			request.setAttribute("exception", runtimeException);
			response.sendRedirect("login");
		}

		return "index";
	}

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
