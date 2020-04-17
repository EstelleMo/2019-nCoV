package com.estelle.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.estelle.bean.Student;
import com.estelle.bean.StudentExample;
import com.estelle.mapper.StudentMapper;
import com.estelle.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper sMapper;

	private StudentExample example = new StudentExample();
	@Override
	public Student login(String no, String password) {
		
		Student student = sMapper.selectByNo(no);
		if (student != null) {
			if(password.equals(student.getDefaultPwd())||password.equals(student.getRealPwd())) {
				return student;
			}
			return null;
		}
		return null;
	}

	@Override
	public List<Student> findNewUser() {
		example.createCriteria().andDefaultPwdIsNotNull();
		example.createCriteria().andRealPwdIsNull();
		return sMapper.selectByExample(example);
	}

}
