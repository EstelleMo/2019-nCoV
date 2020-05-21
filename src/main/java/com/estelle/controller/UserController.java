package com.estelle.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.apache.taglibs.standard.extra.spath.SPathFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.estelle.bean.Epidemic;
import com.estelle.bean.FamHealthy;
import com.estelle.bean.Family;
import com.estelle.bean.Fever;
import com.estelle.bean.Manager;
import com.estelle.bean.Student;
import com.estelle.bean.StudentHealthy;
import com.estelle.service.EpidemicService;
import com.estelle.service.FamilyService;
import com.estelle.service.FeverService;
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
	@Autowired
	private FamilyService familyService;
	@Autowired
	private FeverService feverService;
	@Autowired
	private EpidemicService epidemicService;

	@RequestMapping("/login")
	public @ResponseBody ModelAndView studentLogin(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "no", required = false) String no,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "checkcode", required = false) String checkcode) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("verifyCodeValue");

		if (check.equalsIgnoreCase(checkcode)) {
			Student student = stuService.login(no, password);
			if (student != null) {
				session.setAttribute("student", student);
				String sname = student.getName();
				mav.setViewName("index");
				return mav;
			} else { // 若学生表中找不到该用户则到managaer表中查找
				Manager manager = manService.login(no, password);
				System.out.println(manager.getMno());
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

	@RequestMapping("/backApp")
	public String backApplication() {

		return "Appsuccess";
	}

	@RequestMapping("/saveNormal")
	public @ResponseBody() String saveNormal(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "homeDetAdd", required = false) String homeDetAdd,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "idcard", required = false) String idcard) {
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
	public @ResponseBody String saveDaily(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "healthyCode", required = false) String healthyCode,
			@RequestParam(value = "amTw", required = false) String amTw,
			@RequestParam(value = "pmTw", required = false) String pmTw,
			@RequestParam(value = "isInSch", required = false) String isInSch,
			@RequestParam(value = "healthyStu", required = false) String healthyStu,
			@RequestParam(value = "isIll", required = false) String isIll,
			@RequestParam(value = "isNcov", required = false) String isNcov,
			@RequestParam(value = "isCure", required = false) String isCure,
			@RequestParam(value = "isAspect", required = false) String isAspect) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		if (student != null) {
			StudentHealthy studentHealthy = new StudentHealthy();
			studentHealthy.setNo(student.getNo());
			studentHealthy.setName(student.getName());
			studentHealthy.setHealthyCode(healthyCode);
			studentHealthy.setAmTw(amTw);
			studentHealthy.setPmTw(pmTw);
			studentHealthy.setIsAspect(isAspect);
			studentHealthy.setIsIll(isIll);
			studentHealthy.setIsCure(isCure);
			studentHealthy.setIsNcov(isNcov);
			studentHealthy.setHealthyStu(healthyStu);
			studentHealthy.setIsInSch(isInSch);

			String subDate = saveSubDate();
			studentHealthy.setSubDate(subDate);

			int i = stuService.saveDaily(studentHealthy);
			return "success";
		}
		return "success";
	}

	@RequestMapping("/saveFamDaily")
	public String saveFamDaily(HttpServletRequest request, HttpServletResponse response

	) {
		System.out.println("保存家庭成员每日打卡");
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		
		String subDate = saveSubDate();
		
		FamHealthy fh = new FamHealthy();
		fh.setSubDate(subDate);
		fh.setSname(s.getName());
		fh.setSno(s.getNo());
		
		familyService.saveFamilyDaily(fh);

		return "success";
	}

	@RequestMapping("/saveFever")
	public String saveFever(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "name", required = false) String name
	) {
		System.out.println("保存发热跟进表");
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		
		Fever fever = new Fever();
		fever.setName(name);
		
		String subDate = saveSubDate();
		fever.setSubDate(subDate);
		
		int i = feverService.saveFever(fever);
		return "success";
	}

	@RequestMapping("/saveEpidemic")
	public String saveEpidemic(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "healthyStu", required = false) String healthyStu,
			@RequestParam(value = "isHb", required = false) String isHb,
			@RequestParam(value = "iscloser", required = false) String iscloser,
			@RequestParam(value = "isTouch", required = false) String isTouch,
			@RequestParam(value = "healthyOfFam", required = false) String healthyOfFam,
			@RequestParam(value = "isIll", required = false) String isIll,
			@RequestParam(value = "isNcov", required = false) String isNcov,
			@RequestParam(value = "isLeave", required = false) String isLeave,
			@RequestParam(value = "isCure", required = false) String isCure) {
		System.out.println("保存疫情防控信息");
		Student s = (Student) request.getAttribute("student");
		Epidemic epidemic = new Epidemic();
		epidemic.setName(s.getName());
		epidemic.setNo(s.getNo());
		String currAdd = "";
		epidemic.setCurrAdd(currAdd);
		epidemic.setHealthyOfFam(healthyOfFam);
		epidemic.setHealthyStu(healthyStu);
		epidemic.setIscloser(iscloser);
		epidemic.setIsHb(isHb);
		epidemic.setIsLeave(isLeave);
		epidemic.setIsTouch(isTouch);

		String subDate = saveSubDate();
		epidemic.setSubDate(subDate);
		
		int i = epidemicService.saveEpidemic(epidemic);
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

	@RequestMapping("/addFamily")
	public String addFamily(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "relationship", required = false) String relationship) {
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		Family family = new Family();
		family.setSname(student.getName());
		family.setSno(student.getNo());
		family.setGender(gender);
		family.setName(name);
		family.setRelationship(relationship);

		int i = familyService.saveFamily(family);
		return "success";
	}

	private String saveSubDate() {
		Date date = new Date();
		DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String subDate = simpleDateFormat.format(date);
		return subDate;
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
