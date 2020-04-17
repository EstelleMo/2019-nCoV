package com.estelle.service;

import java.util.List;

import com.estelle.bean.Student;

public interface StudentService extends BaseService{

	Student login(String no,String password);

	List<Student> findNewUser();
}
