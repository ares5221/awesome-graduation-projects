package com.bjsxt.school.service;

import java.util.List;

import com.bjsxt.school.entity.Clazz;


public interface ClazzService {

	List<Clazz> findAll();

	String findMajorByClazzId(String classId);

	int addClass(Clazz clazz);

	List<Clazz> showAll();

	void delete(String classId);

}
