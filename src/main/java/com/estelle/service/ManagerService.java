package com.estelle.service;

import java.util.List;

import com.estelle.bean.Manager;
import com.estelle.bean.Student;

public interface ManagerService {
	Manager login(String no, String password);
	
	Manager findManager(String mno);

	Student managerFindStudentByNo(String mno, String no);

	List<Student> managerFindByName(String mno, String name);
}
