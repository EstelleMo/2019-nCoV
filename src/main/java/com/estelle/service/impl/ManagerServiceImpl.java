package com.estelle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.estelle.bean.Manager;
import com.estelle.bean.Student;
import com.estelle.mapper.ManagerMapper;
import com.estelle.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	ManagerMapper mMapper;

	@Override
	public Manager login(String no, String password) {
		Manager manager = mMapper.selectByNo(no);
		if (manager != null && password.equals(manager.getPwd())) {
			return manager;
		} else if (manager != null && !password.equals(manager.getPwd())) {
			throw new RuntimeException("密码错误");
		} else {
			throw new RuntimeException("用户名/密码错误");
		}
	}

}
