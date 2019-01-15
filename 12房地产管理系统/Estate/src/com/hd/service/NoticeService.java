package com.hd.service;

import java.util.List;

import com.hd.entity.NoticeInfo;
import com.hd.util.PageBean;

public interface NoticeService {

	void delete(int notice_id);

	List<NoticeInfo> findAll();

	int add(NoticeInfo noticeInfo);

	/**
	 * @param pageBean
	 * @param selectContent
	 * @param selectType
	 */
	void show(PageBean<NoticeInfo> pageBean, String selectContent,
			String selectType);

	/**
	 * @param days
	 * @return
	 */
	List<NoticeInfo> findDateNotice(int days);

}
