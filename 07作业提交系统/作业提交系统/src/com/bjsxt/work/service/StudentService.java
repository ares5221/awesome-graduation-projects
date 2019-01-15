/**
 * 
 */
package com.bjsxt.work.service;

import java.util.Date;
import java.util.List;

import com.bjsxt.work.entity.Clazz;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;

/**
 * @author 李军伟
 * @function: 学生业务层
 * @date: 2017年8月31日
 */
public interface StudentService {

	// 查询班级
	List<Clazz> findAllClazz();

	// 查询小组
	List<Group> findALLGroup();

	// 通过班级小组和学生信息进行查询
	Student findStuByCGAccount(Student user);

	// 更新密码
	boolean update(Student student);

	// 查询老师发布的作业
	List<Work> findAllWorkType();

	// 上传完作业向数据库中添加一条记录
	boolean update(Integer sid, int hid, Date date, String fileName);

	// 查询所有的关于此学生的作业提交记录
	List<Record> findRecordsBySid(int sid);

	// 通过记录的id和作业的id查询作业提交记录
	String findRecordByRIDWID(int rid, int hid);

	// 查询所有的学生信息
	List<Student> findAllStudent();

}
