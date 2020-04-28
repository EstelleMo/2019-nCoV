package com.estelle.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.estelle.bean.Manager;
import com.estelle.bean.Student;
import com.estelle.mapper.ManagerMapper;
import com.estelle.mapper.StudentHealthyMapper;
import com.estelle.mapper.StudentMapper;
import com.estelle.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	ManagerMapper mMapper;
	@Autowired
	StudentHealthyMapper shMapper;
	@Autowired
	StudentMapper sMapper;

	@Override
	public Manager login(String no, String password) {
		Manager manager = mMapper.selectByNo(no);
		if (manager != null && password.equals(manager.getPwd())) {
			return manager;
		} else if (manager != null && !password.equals(manager.getPwd())) {
			return null;
//			throw new RuntimeException("密码错误");
		} else {
			return null;
//			throw new RuntimeException("用户名/密码错误");
		}
	}

	@Override
	public Manager findManager(String mno) {
		
		return mMapper.selectByNo(mno);
	}
	
	@Override
	public Student managerFindStudentByNo(String mno, String no) {
		Manager manager = findManager(mno);
		String college = manager.getCollege();
//		Student student = sMapper.selectByNo(no);
//		String sCollege = student.getCollege();
//		if(college.equals(sCollege)) {
//			return student;
//		}
		
		//获取管理员学号,若不是校管理员，则按管理员所属身份去查找
		if(!college.equals("校")){
			return sMapper.selectByNoNCollege(no,college);
		}else {
			return sMapper.selectByNo(no);
		}
	}


	@Override
	public List<Student> managerFindByName(String mno, String name) {
		Manager manager = findManager(mno);
		String college = manager.getCollege();
		if(!college.equals("校")) {
			
			
			return sMapper.selectByNameNCollege(name,college);
		}else {
			
			return sMapper.selectByName(name);
		}
	}

}
