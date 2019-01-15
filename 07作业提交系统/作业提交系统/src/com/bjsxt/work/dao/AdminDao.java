/**
 * 
 */
package com.bjsxt.work.dao;

import java.util.List;

import com.bjsxt.work.entity.Admin;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;

/**
 * @author 李军伟
 * @function: 
 * @date: 2017年8月30日
 */
public interface AdminDao {
	
	// 管理员登录
	boolean login(Admin admin);

	// 更新管理员信息
	boolean update(Admin admin);

	// 查询所有已提交记录
	List<Record> findAllRecords();

	// 查询所有已提交作业学生
	List<Student> findAllCWStudent();

	int publish(Work work);

	List<Work> showAllWork();

	// 删除作业
	int deleteWorkByHid(int hid);

	// 删除作业前要删除关于此作业的上传记录 和对应文件
	int delteRecordsByHid(int hid);

	
}
