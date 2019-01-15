package com.bjsxt.school.service;

import com.bjsxt.school.entity.Student;
import com.bjsxt.school.util.PageBean;

public interface StudentService {

	/**
	 * 根据id查找学生
	 * @param sid
	 * @return
	 */
	Student findById(String sid);

	/**
	 * 添加学生
	 * @param stu
	 * @return
	 */
	boolean save(Student stu);

	/**
	 * 分页查询所有学生
	 * @param pageBean
	 * @param sname
	 * @param sid
	 */
	void show(PageBean<Student> pageBean, String sname, String sid);

	/**
	 * 根据id更新学生信息
	 * @param student
	 * @return
	 */
	boolean update(Student student);

	/**
	 * 根据id删除学生信息
	 * @param sid
	 * @return
	 */
	boolean delete(String sid);

	/**
	 * 学生入学信息录入
	 * @param student
	 * @return
	 */
	boolean saveCheckIn(Student student);

	/**
	 * 按条件查询已登记的学生信息
	 * @param pageBean
	 * @param sname
	 * @param operator
	 * @param enterScore
	 */
	void showCheckedIn(PageBean<Student> pageBean, String sname, int oper,
			double enterScore);

	/**
	 * 根据学生ID查询学生是否已进行入学登记
	 * @param sid
	 * @return
	 */
	Student findCheckedById(String sid);
	
	/**
	 * 根据学生ID删除已进行入学登记的学生
	 * @param sid
	 * @return
	 */
	boolean deleteCheckedIn(String sid);

	
}
