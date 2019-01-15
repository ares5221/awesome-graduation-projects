package com.hd.dao;

import java.util.List;

import com.hd.entity.NoticeInfo;

public interface NoticeDao {

	void delete(int notice_id);

	List<NoticeInfo> findAll();

	int save(NoticeInfo noticeInfo);

	/**
	 * 
	 * @return 返回符合条件的所有条目
	 */
	int findRequiredCount(String selectContent, String selectType);

	/**
	 * @param start
	 * @param size
	 * @param selectContent
	 * @param selectType
	 * @return
	 */
	List<NoticeInfo> findRequiredItems(int start, int size,
			String selectContent, String selectType);

	/**
	 * @param days
	 * @return
	 */
	List<NoticeInfo> findDateNotice(int days);

}
