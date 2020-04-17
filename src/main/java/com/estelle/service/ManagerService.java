package com.estelle.service;

import com.estelle.bean.Manager;

public interface ManagerService extends BaseService {
	Manager login(String no, String password);
}
