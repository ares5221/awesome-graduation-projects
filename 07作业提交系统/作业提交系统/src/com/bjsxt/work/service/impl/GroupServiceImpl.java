package com.bjsxt.work.service.impl;

import java.util.List;

import com.bjsxt.work.dao.GroupDao;
import com.bjsxt.work.dao.impl.GroupDaoImpl;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.service.GroupService;

public class GroupServiceImpl implements GroupService{
	GroupDao groupDao = new GroupDaoImpl();
	/**
	 * 添加小组
	 */
	public int addGroup(Group group,Student stu1, Student stu2) {
	    return this.groupDao.addGroup(group,stu1, stu2);	
	}
	
	/**
	 * 获取所有学生
	 */
	@Override
	public List<Student> ShowStudent() {
		
		return this.groupDao.findStudent();
	}
	/**
	 * 获取小组信息
	 */

	@Override
	public List<Group> ShowAllGroup() {
		return this.groupDao.showAllGroup();
	}
	

	@Override
	public int deleteG(int gid) {
		// TODO Auto-generated method stub
		return this.groupDao.deleteG(gid);
	}

	@Override
	public int updateGroup(Group group, Student stu1, Student stu2) {
		return this.groupDao.updateGroupInfo(group,stu1,stu2);
	}

	@Override
	public List<Group> findByid(int gid) {
		// TODO Auto-generated method stub
		return this.groupDao.findById(gid);
	}


}
