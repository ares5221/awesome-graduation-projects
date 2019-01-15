package com.bjsxt.work.service.impl;

import java.util.List;








import com.bjsxt.work.dao.RankingDao;
import com.bjsxt.work.dao.impl.RankingDaoImpl;
import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.service.RankingService;
import com.bjsxt.work.util.PageBean;

public class RankingServiceImpl implements RankingService {
	private RankingDao rankingDao = new RankingDaoImpl();
	/**
	 * 查询班级排名
	 */
	@Override
	public void rankingForClazz(PageBean<Student> pageBean,int hid) {
		
		int totalCount = this.rankingDao.findByName(hid);
		//设置totalCount
		pageBean.setTotalCount(totalCount);
		//获取当前页的学生数据
		int start = pageBean.getStartRow();
		int end = pageBean.getEndRow();
		List<Student> list = this.rankingDao.findPage(start,end,hid);
		pageBean.setList(list);
	}
	
	/**
	 * 获得作业类型列表
	 */
	@Override
	public List<Work> findWork() {
		// TODO Auto-generated method stub
		return this.rankingDao.findWork();
	}

	public List<Student> rankingForGroup(int hid) {
		
		
		return this.rankingDao.rankingForGroup(hid);
	}
	@Override
	public List<Group> findName12() {
		
		return rankingDao.findName12();
	}

}
