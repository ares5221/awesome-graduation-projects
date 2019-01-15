package com.bjsxt.school.service.impl;

import java.sql.Date;
import java.util.List;

import com.bjsxt.school.dao.TeacherDao;
import com.bjsxt.school.dao.impl.TeacherDaoImpl;
import com.bjsxt.school.entity.Teacher;
import com.bjsxt.school.entity.TeacherCourse;
import com.bjsxt.school.service.TeacherService;
import com.bjsxt.school.util.PageBean;

public class TeacherServiceImpl implements TeacherService {

	private TeacherDao teacherDao = new TeacherDaoImpl();

	@Override
	public boolean register(Teacher teacher) {
		return teacherDao.save(teacher) > 0 ? true : false;
	}

	@Override
	public void show(PageBean<Teacher> pageBean, String tname, String mname) {
		int totalCount = teacherDao.findCount(tname, mname);
		pageBean.setTotalCount(totalCount);

		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		List<Teacher> teaList = teacherDao.findTeacher(startRow, endRow, tname,
				mname);
		pageBean.setList(teaList);
	}

	@Override
	public Teacher showById(String tno) {
		return teacherDao.findById(tno);
	}

	@Override
	public boolean update(Teacher teacher) {
		return teacherDao.update(teacher) > 0 ? true : false;
	}

	@Override
	public boolean delete(String tno) {
		return teacherDao.delete(tno) > 0 ? true : false;
	}

	@Override
	public int arrangeCourse(String tno, String mno, Date workDate) {
		// TODO Auto-generated method stub
		return  teacherDao.arrangeCourse(tno,mno,workDate);
	}

	@Override
	public Teacher showByMno(String msg1) {
		// TODO Auto-generated method stub
		return teacherDao.findByMno(msg1);
	}

	@Override
	public Teacher showByTname(String msg1) {
		// TODO Auto-generated method stub
		return teacherDao.findByTname(msg1);
	}

	@Override
	public List<TeacherCourse> selectPosition(String msg1) {
		// TODO Auto-generated method stub
		return teacherDao.selectPosition(msg1);
	}

	@Override
	public List<TeacherCourse> selectPosition1(String msg1) {
		// TODO Auto-generated method stub
		return teacherDao.selectPosition1(msg1);
	}

	@Override
	public int teacherInCharge(String tno, Date jobdate, String classname,
			String classid) {
		// TODO Auto-generated method stub
		return teacherDao.teacherInCharge(tno, jobdate, classname, classid);
	}

	@Override
	public List<TeacherCourse> selectAll() {
		// TODO Auto-generated method stub
		return teacherDao.selectAll();
	}

}
