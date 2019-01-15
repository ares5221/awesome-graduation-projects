package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.Clazz;

public interface ClazzDao {

	public List<Clazz> findAll();

	public String findMajorByClazzId(String classId);

	public int add(Clazz clazz);

	public void delete(String classId);

}
