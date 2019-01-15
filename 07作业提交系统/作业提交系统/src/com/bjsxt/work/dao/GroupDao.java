package com.bjsxt.work.dao;

import java.util.List;

import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;

public interface GroupDao {
    /**
     * 添加小组
     * @param group
     * @param stu1
     * @param stu2
     * @return
     */
	public int addGroup(Group group, Student stu1, Student stu2);
	/**
	 * 获取所有学生
	 * @return
	 */
	public List<Student> findStudent();
	/**
	 * 查看已经添加的小组信息
	 */
	public List<Group> showAllGroup();
	
	int updateGroupInfo(Group group, Student stu1, Student stu2);
	
	List<Group> findById(int gid);
	
	int deleteG(int gid);
	
}
