package com.bjsxt.work.service;

import java.util.List;

import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.util.PageBean;


public interface RankingService {

	/**
	 * 查询班级排名
	 */
	public void rankingForClazz(PageBean<Student> pageBean,int hid);

	/**
	 * 获得作业列表
	 * @return
	 */
	List<Work> findWork();
	
	/*
	 * 查询所有的小组
	 */
	public List<Student> rankingForGroup(int hid);

	public List<Group> findName12();

	
}
