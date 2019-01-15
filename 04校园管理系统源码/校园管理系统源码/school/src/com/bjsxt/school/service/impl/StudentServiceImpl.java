package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.StudentDao;
import com.bjsxt.school.dao.impl.StudentDaoImpl;
import com.bjsxt.school.entity.Student;
import com.bjsxt.school.service.StudentService;
import com.bjsxt.school.util.PageBean;

public class StudentServiceImpl implements StudentService {

	private StudentDao stuDao = new StudentDaoImpl();

	@Override
	public Student findById(String sid) {
		return stuDao.findById(sid);
	}

	@Override
	public boolean save(Student stu) {
		return stuDao.save(stu) > 0 ? true : false;
	}

	@Override
	public void show(PageBean<Student> pageBean, String sname, String sid) {
		int totalCount = stuDao.findCount(sname, sid);
		pageBean.setTotalCount(totalCount);

		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		List<Student> stuList = stuDao
				.findStudent(startRow, endRow, sname, sid);
		pageBean.setList(stuList);
	}

	@Override
	public boolean update(Student student) {
		return stuDao.update(student) > 0 ? true : false;
	}

	@Override
	public boolean delete(String sid) {
		return stuDao.delete(sid) > 0 ? true : false;
	}

	@Override
	public boolean saveCheckIn(Student stu) {
		return stuDao.saveCheckIn(stu) > 0 ? true : false;
	}

	@Override
	public void showCheckedIn(PageBean<Student> pageBean, String sname,
			int oper, double enterScore) {
		int totalCount = stuDao.findCheckedCount(sname, oper, enterScore);
		pageBean.setTotalCount(totalCount);

		int startRow = pageBean.getStartRow();
		int endRow = pageBean.getEndRow();
		List<Student> stuList = stuDao
				.findCheckedStudent(startRow, endRow, sname, oper, enterScore);
		pageBean.setList(stuList);
		
	}

	@Override
	public Student findCheckedById(String sid) {
		return stuDao.findCheckedById(sid);
	}

	@Override
	public boolean deleteCheckedIn(String sid) {
		return stuDao.deleteCheckedIn(sid) > 0 ? true : false;
	}

}
