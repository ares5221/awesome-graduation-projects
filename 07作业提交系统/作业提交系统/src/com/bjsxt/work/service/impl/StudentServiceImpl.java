/**
 * 
 */
package com.bjsxt.work.service.impl;

import java.util.Date;
import java.util.List;

import com.bjsxt.work.dao.StudentDao;
import com.bjsxt.work.dao.impl.StudentDaoImpl;
import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.service.StudentService;

/**
 * @author 李军伟
 * @function: 学生业务层实现
 * @date: 2017年8月31日
 */
public class StudentServiceImpl implements StudentService {

	private StudentDao studentDao = new StudentDaoImpl();
	
	// 查询所有班级
	@Override
	public List<Clazz> findAllClazz() {
		return studentDao.findAllClazz();
	}

	// 查询所有小组
	@Override
	public List<Group> findALLGroup() {
		return studentDao.findALLGroup();
	}

	// 通过班级小组和学生信息进行查询
	@Override
	public Student findStuByCGAccount(Student user) {
		// TODO Auto-generated method stub
		return this.studentDao.findStuByCGAccount(user);
	}

	// 更新学生信息
	@Override
	public boolean update(Student student) {
		return studentDao.update(student);
	}

	// 查询所有已发布作业
	@Override
	public List<Work> findAllWorkType() {
		return studentDao.findAllWorkType();
	}

	// 向数据库中添加一条提交作业的记录
	@Override
	public boolean update(Integer sid, int hid, Date date, String fileName) {
		return studentDao.update(sid, hid, date, fileName);
	}

	// 查询所有的关于此学生的作业提交记录
	@Override
	public List<Record> findRecordsBySid(int sid) {
		return studentDao.findRecordsBySid(sid);
	}

	// 通过记录的id和作业的id查询作业提交记录
	@Override
	public String findRecordByRIDWID(int rid, int hid) {
		return studentDao.findRecordByRIDWID(rid, hid);
	}

	// 查询所有的学生信息
	@Override
	public List<Student> findAllStudent() {
		return studentDao.findAllStudent();
	}

}
