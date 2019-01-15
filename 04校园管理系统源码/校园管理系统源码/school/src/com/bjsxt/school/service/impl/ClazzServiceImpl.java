package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.ClazzDao;
import com.bjsxt.school.dao.impl.ClazzDaoImpl;
import com.bjsxt.school.entity.Clazz;
import com.bjsxt.school.service.ClazzService;

public class ClazzServiceImpl implements ClazzService {

	private ClazzDao clazzDao = new ClazzDaoImpl();
	@Override
	public List<Clazz> findAll() {
		return clazzDao.findAll();
	}
	@Override
	public String findMajorByClazzId(String classId) {
		return clazzDao.findMajorByClazzId(classId);
	}
	@Override
	public int addClass(Clazz clazz) {
		return this.clazzDao.add(clazz);
	}
	@Override
	public List<Clazz> showAll() {
		return clazzDao.findAll();
	}
	@Override
	public void delete(String classId) {
		this.clazzDao.delete(classId);
		
	}

}
