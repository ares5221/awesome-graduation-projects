package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.Student;

public interface StudentDao {
	/**
	 * 根据id查找学生
	 * 
	 * @param sid
	 * @return
	 */
	Student findById(String sid);

	/**
	 * 添加学生
	 * 
	 * @param stu
	 * @return
	 */
	int save(Student stu);

	/**
	 * 按条件查询学生数量
	 * 
	 * @param sname
	 * @param sid
	 * @return
	 */
	int findCount(String sname, String sid);

	/**
	 * 分页查询出符合条件的学生信息
	 * 
	 * @param startRow
	 * @param endRow
	 * @param sname
	 * @param sid
	 * @return
	 */
	List<Student> findStudent(int startRow, int endRow, String sname, String sid);

	/**
	 * 根据id更新学生
	 * 
	 * @param student
	 * @return
	 */
	int update(Student student);

	/**
	 * 根据id删除学生
	 * 
	 * @param sid
	 * @return
	 */
	int delete(String sid);

	/**
	 * 学生入学信息录入
	 * 
	 * @param stu
	 * @return
	 */
	int saveCheckIn(Student stu);

	/**
	 * 按条件查询已登记的学生数量
	 * 
	 * @param sname
	 * @param operator
	 * @param enterScore
	 * @return
	 */
	int findCheckedCount(String sname, int oper, double enterScore);

	/**
	 * 按条件查询已登记的学生
	 * 
	 * @param startRow
	 * @param endRow
	 * @param sname
	 * @param operator
	 * @param enterScore
	 * @return
	 */
	List<Student> findCheckedStudent(int startRow, int endRow, String sname,
			int oper, double enterScore);

	/**
	 * 根据学生ID查询学生是否已进行入学登记
	 * @param sid
	 * @return
	 */
	Student findCheckedById(String sid);
	
	/**
	 * 根据学生ID删除已进行入学登记的学生信息
	 * @param sid
	 * @return
	 */
	int deleteCheckedIn(String sid);

}
