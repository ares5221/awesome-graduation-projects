package com.bjsxt.work.service;

import java.util.List;

import com.bjsxt.work.entity.Admin;
import com.bjsxt.work.entity.Record;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;

public interface AdminService {
	// 管理员登录
	boolean login(Admin admin);

	// 更新管理员信息
	boolean update(Admin admin);

	// 查询所有已发布的作业
	List<Work> findAllWorkType();

	// 查询所有已发布作业类型
	List<Record> findAllRecords();

	// 查询所有已提交作业学生
	List<Student> findAllCWStudent();

	// 发布作业
	int publish(Work work);

	// 查询作业列表
	List<Work> showAllWork();

	// 删除发布的作业
	int deleteWorkByHid(int hid);
}
