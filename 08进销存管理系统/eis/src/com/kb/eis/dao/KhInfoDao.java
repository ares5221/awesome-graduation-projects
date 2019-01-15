package com.kb.eis.dao;

import java.util.List;

import com.kb.eis.pojo.KhInfo;
import com.kb.eis.util.PageBean;

public interface KhInfoDao {
	//写入到khinfo表
	int add(KhInfo kh);

	KhInfo toupdate(int khid);

	int delete(int khid);

	int count(String khname, String khid);

	List<KhInfo> query();

	int update(KhInfo kh);

	int deletes(String[] idarr);
	
	/**
	 * 查询客户信息
	 * @return
	 */
	List<KhInfo> queryAllClient();

}
