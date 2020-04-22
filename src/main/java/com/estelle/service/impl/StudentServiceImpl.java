package com.estelle.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.estelle.bean.Student;
import com.estelle.bean.StudentExample;
import com.estelle.bean.StudentHealthy;
import com.estelle.bean.StudentHealthyExample;
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
		int i = sMapper.insertSelective(student);
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
		StudentExample example = new StudentExample();
		example.createCriteria().andNameEqualTo("name");
		List<Student> list = sMapper.selectByExample(example);
		return list;
	}

}
