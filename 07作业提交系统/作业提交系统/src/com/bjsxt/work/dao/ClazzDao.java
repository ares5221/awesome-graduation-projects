package com.bjsxt.work.dao;

import java.util.List;

import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Teacher;

public interface ClazzDao {
	
	//将用户创建的班级保存到数据库
	public int save(Clazz clazz,Teacher teacher1,Teacher teacher2,Teacher teacher3);

	public List<Teacher> findAllTeacher();//查询所有老师，显示在下拉列表中

	public List<Clazz> findClazz();//查询所有已创建的班级，显示在list中  

}
