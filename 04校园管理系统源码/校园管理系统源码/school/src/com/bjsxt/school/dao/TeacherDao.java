package com.bjsxt.school.dao;

import java.sql.Date;
import java.util.List;

import com.bjsxt.school.entity.Teacher;
import com.bjsxt.school.entity.TeacherCourse;

public interface TeacherDao {

	/**
	 * 新增教师
	 * @param teacher
	 * @return
	 */
	int save(Teacher teacher);

	/**
	 * 根据条件查询符合条件的教师数量
	 * @param tname
	 * @param mno
	 * @return
	 */
	int findCount(String tname, String mname);

	/**
	 * 分页
	 * @param startRow
	 * @param endRow
	 * @param tname
	 * @param mno
	 * @return
	 */
	List<Teacher> findTeacher(int startRow, int endRow, String tname, String mname);

	/**
	 * 根据ID查询教师信息
	 * @param tno
	 * @return
	 */
	Teacher findById(String tno);

	/**
	 * 更新教师信息
	 * @param teacher
	 * @return
	 */
	int update(Teacher teacher);

	/**
	 * 删除教师信息
	 * @param tno
	 * @return
	 */
	int delete(String tno);

	int arrangeCourse(String tno, String mno, Date workDate);

	Teacher findByMno(String msg1);

	Teacher findByTname(String msg1);

	List<TeacherCourse> selectPosition(String msg1);

	List<TeacherCourse> selectPosition1(String msg1);

	int teacherInCharge(String tno, Date jobdate, String classname,
			String classid);

	List<TeacherCourse> selectAll();

}
