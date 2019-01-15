package com.bjsxt.work.dao;

import java.util.List;

import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;

public interface RankingDao {

	/**
	 * 通过作业名字查询学生数量
	 * @param hid
	 * @return
	 */
	public int findByName(int hid);
	
	/**
	 *查询作业类型列表
	 * @return
	 */
	public List<Work> findWork();
	/**
	 * 查询学生排名
	 */
	public List<Student> findPage(int start, int end, int hid);

	
	/**
	 * 查询小组排名
	 * @param hid
	 * @return
	 */

	public List<Student> rankingForGroup(int hid);

	public List<Group> findName12();

}
