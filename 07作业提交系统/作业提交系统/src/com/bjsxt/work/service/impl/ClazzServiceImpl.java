package com.bjsxt.work.service.impl;

import java.util.List;

import com.bjsxt.work.dao.ClazzDao;
import com.bjsxt.work.dao.impl.ClazzDaoImpl;
import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Teacher;
import com.bjsxt.work.service.ClazzService;

public class ClazzServiceImpl implements ClazzService {
	ClazzDao clazzDao = new ClazzDaoImpl();//创建dao层对象

	@Override
	public int add(Clazz clazz,Teacher teacher1,Teacher teacher2,Teacher teacher3) {
		return this.clazzDao.save(clazz,teacher1,teacher2,teacher3);//调用dao层save方法
	}

	@Override
	public List<Teacher> findAllTeacher() {
		return this.clazzDao.findAllTeacher();
	}

	@Override
	public List<Clazz> showClazz() {
		return this.clazzDao.findClazz();
	}

}
