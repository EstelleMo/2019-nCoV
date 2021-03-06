package com.estelle.service;

import java.util.Date;
import java.util.List;

import com.estelle.bean.AppBackSch;
import com.estelle.bean.Manager;
import com.estelle.bean.PageBean;
import com.estelle.bean.Student;
import com.estelle.bean.StudentHealthy;

public interface StudentService{

	Student login(String no,String password);

	List<Student> findNewUser();
	
	List<StudentHealthy> findHistory();

	List<StudentHealthy> findHistoryByDate(String subDate);

	int saveMsg(Student student);

	Student findStudentByNo(String no);

	List<Student> findByName(String name);

	PageBean findStudentList();

	int saveDaily(StudentHealthy studentHealthy);

	StudentHealthy findMyDailyHistory(String subDate);

	int saveAppBackSch(AppBackSch appBackSch);

	AppBackSch findAppHistoryByNo(String no);

	int upDateAppHistory(AppBackSch appBackSch);

	List<AppBackSch> findAppList(String no, String subDate);

	PageBean managerCheckDaily(Manager manager);
}
