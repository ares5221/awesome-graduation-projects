package com.bjsxt.work.service;

import java.util.List;

import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;

public interface GroupService {
    public int addGroup(Group group,Student stu1,Student stu2);
    
    public List<Student> ShowStudent();
    
    public List<Group> ShowAllGroup();

	List<Group> findByid(int gid);

	int updateGroup(Group group, Student stu1, Student stu2);

	int deleteG(int gid);
}
