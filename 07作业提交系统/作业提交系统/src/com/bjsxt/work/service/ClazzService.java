package com.bjsxt.work.service;

import java.util.List;

import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Teacher;

public interface ClazzService {

	public int add(Clazz clazz,Teacher teacher1,Teacher teacher2,Teacher teacher3);//添加学生

	public List<Teacher> findAllTeacher();

	public List<Clazz> showClazz();



	

}
