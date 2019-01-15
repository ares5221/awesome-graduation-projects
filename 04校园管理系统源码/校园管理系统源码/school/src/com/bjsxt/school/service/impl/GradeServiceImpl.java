package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.GradeDao;
import com.bjsxt.school.dao.impl.GradeDaoImpl;
import com.bjsxt.school.entity.Grade;
import com.bjsxt.school.service.GradeService;

public class GradeServiceImpl implements GradeService {
	private GradeDao gradeDao  = new GradeDaoImpl();

	//添加年级
	@Override
	public int addGrade(Grade grade) {
		return  this.gradeDao.save(grade);
	}
	//查看年级信息
	@Override
	public List<Grade> findAll() {
		return this.gradeDao.findAll();
	}
	//删除指定年级信息
	@Override
	public void delete(String gradeNo) {
		this.gradeDao.delete(gradeNo);
		
	}
	//修改更新年级信息
	@Override
	public int updateMno(Grade grade) {
		return this.gradeDao.update(grade);
	}
	@Override
	public Grade findGrade(String gradeNo) {
		return this.gradeDao.findGrade(gradeNo);
	}

}
