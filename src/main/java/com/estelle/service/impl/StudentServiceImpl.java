package com.estelle.service.impl;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.estelle.bean.AppBackSch;
import com.estelle.bean.PageBean;
import com.estelle.bean.Student;
import com.estelle.bean.StudentExample;
import com.estelle.bean.StudentHealthy;
import com.estelle.bean.StudentHealthyExample;
import com.estelle.bean.StudentHealthyExample.Criteria;
import com.estelle.mapper.AppBackSchMapper;
import com.estelle.mapper.StudentHealthyMapper;
//import com.estelle.mapper.StudentHealthyMapper;
import com.estelle.mapper.StudentMapper;
import com.estelle.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper sMapper;
	@Autowired
	private StudentHealthyMapper shMapper;
	@Autowired
	private AppBackSchMapper aMapper;

	@Override
	public Student login(String no, String password) {

		Student student = sMapper.selectByNo(no);
		if (student != null) {
			if (password.equals(student.getDefaultPwd()) || password.equals(student.getRealPwd())) {
				return student;
			}
			return null;
		}
		return null;
	}

	@Override
	public List<Student> findNewUser() {
		StudentExample example = new StudentExample();
		example.createCriteria().andDefaultPwdIsNotNull();
		example.createCriteria().andRealPwdIsNull();
		return sMapper.selectByExample(example);
	}

	@Override
	public List<StudentHealthy> findHistoryByDate(String subDate) {

		return null;
	}

	@Override
	public List<StudentHealthy> findHistory() {
		StudentHealthyExample e = new StudentHealthyExample();
		List<StudentHealthy> list = shMapper.selectByExample(e);
		System.out.println(list.toString());
		if (list != null) {

			return list;
		} else {
			return null;
		}
	}

	@Override
	public int saveMsg(Student student) {
		int i = sMapper.updateByPrimaryKeySelective(student);
		return i;
	}

	@Override
	public Student findStudentByNo(String no) {
		Student student = sMapper.selectByNo(no);
		if (student != null) {
			return student;
		}
		return null;
	}

	@Override
	public List<Student> findByName(String name) {
//		List<Student> list = sMapper.selectByName(name);
		StudentExample example = new StudentExample();
		example.createCriteria().andNameEqualTo(name);
		List<Student> list = sMapper.selectByExample(example);
		System.out.println("example  " + list);
		if (list != null) {
			System.out.println(list);
			return list;
		}
		return null;
	}

	@Override
	public PageBean findStudentList() {
		StudentExample sexample = new StudentExample();
		StudentHealthyExample example = new StudentHealthyExample();
		Date date = new Date();
		DateFormat df = DateFormat.getDateInstance();
		DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
//		String subDate = df.format(date);
		String subDate = df2.format(date);

		System.out.println(subDate);
//		example.createCriteria().andSubDateEqualTo(subDate);
//		List<StudentHealthy> list = shMapper.selectByExample(example);
//		int count = shMapper.countByExample(example);
		List<StudentHealthy> list = shMapper.selectBySubDate(subDate);
//		List<StudentHealthy> list2 = shMapper.selectByExample(example);
		int i = sMapper.countByExample(sexample);// 学生人数

		System.out.println("通过今日时间查询：" + list);
		System.out.println("-------------");
//		System.out.println(list2);
		System.out.println("有学生" + i + "人");
		PageBean pageBean = new PageBean();
		pageBean.setList(list);

		pageBean.setTotalCount(i);
		pageBean.setSubCount(i - list.size());
		pageBean.setUmSubCount(pageBean.getTotalCount() - pageBean.getSubCount());
//		pageBean.setList(list2);
		return pageBean;
	}

	@Override
	public int saveDaily(StudentHealthy studentHealthy) {
		return shMapper.insertSelective(studentHealthy);
	}

	@Override
	public StudentHealthy findMyDailyHistory(String subDate) {
		List<StudentHealthy> list = shMapper.selectBySubDate(subDate);
		StudentHealthy studentHealthy = list.get(0);
		System.out.println(studentHealthy);
		return studentHealthy;
	}

	@Override
	public int saveAppBackSch(AppBackSch appBackSch) {
		return aMapper.insertSelective(appBackSch);
	}

}
