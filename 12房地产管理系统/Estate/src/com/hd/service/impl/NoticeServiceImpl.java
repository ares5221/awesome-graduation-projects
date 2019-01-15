package com.hd.service.impl;

import java.util.List;

import com.hd.dao.NoticeDao;
import com.hd.dao.impl.NoticeDaoImpl;
import com.hd.entity.NoticeInfo;
import com.hd.service.NoticeService;
import com.hd.util.PageBean;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDao noticeDao = new NoticeDaoImpl();
	@Override
	public void delete(int notice_id) {
		this.noticeDao.delete(notice_id);
		
	}
	@Override
	public List<NoticeInfo> findAll() {
		
		return this.noticeDao.findAll();
	}
	@Override
	public int add(NoticeInfo noticeInfo) {
		
		return this.noticeDao.save(noticeInfo);
	}
	/* 
	 * 
	 */
	@Override
	public void show(PageBean<NoticeInfo> pageBean, String selectContent,
			String selectType) {
		//获取符合条件的所有数据条目
		int count = noticeDao.findRequiredCount(selectContent,selectType);
		pageBean.setTotalCount(count);
		// 获取分页查询的开始及结束
		int start = pageBean.getStartRow();
		int size = pageBean.getSize();
		
		List<NoticeInfo> list = noticeDao.findRequiredItems(start,size,selectContent, selectType);
		pageBean.setList(list);
	}
	/* (non-Javadoc)
	 * @see com.hd.service.NoticeService#findDateNotice(int)
	 */
	@Override
	public List<NoticeInfo> findDateNotice(int days) {
		return noticeDao.findDateNotice(days);
	}

}
