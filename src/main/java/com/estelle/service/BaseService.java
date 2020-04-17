package com.estelle.service;

import java.util.List;

public interface BaseService<T> {
	T login(String no,String password);
}
