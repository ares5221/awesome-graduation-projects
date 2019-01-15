package com.bjsxt.school.service;

import java.sql.Date;
import java.util.List;

import com.bjsxt.school.entity.Teacher;
import com.bjsxt.school.entity.TeacherCourse;
import com.bjsxt.school.util.PageBean;

public interface TeacherService {

	/**
	 * 新增教师
	 * @param teacher
	 * @return
	 */
	boolean register(Teacher teacher);

	/**
	 * 根据条件查询教师，分页展示
	 * @param pageBean
	 * @param tname
	 * @param mno
	 */
	void show(PageBean<Teacher> pageBean, String tname, String mname);

	/**
	 * 根据ID查询老师信息
	 * @param tno
	 * @return
	 */
	Teacher showById(String tno);

	/**
	 * 更新教师信息
	 * @param teacher
	 * @return
	 */
	boolean update(Teacher teacher);

	boolean delete(String tno);

	int arrangeCourse(String tno, String mno, Date workDate);

	Teacher showByMno(String msg1);

	Teacher showByTname(String msg1);

	List<TeacherCourse> selectPosition(String msg1);

	List<TeacherCourse> selectPosition1(String msg1);

	int teacherInCharge(String tno, Date jobdate, String classname,
			String classid);

	List<TeacherCourse> selectAll();

	

}
