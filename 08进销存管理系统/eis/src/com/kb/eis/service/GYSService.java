package com.kb.eis.service;

import java.util.List;

import com.kb.eis.pojo.GYS;

public interface GYSService {

	List<GYS> query();
	/**
	 * 添加供应商
	 * @param gys
	 * @return
	 */
	int add(GYS gys);
	
	//模糊查询供应商名称
	List<GYS> queryByName(String gysname);
	
	//修改供应商信息
	int update(GYS gys);
	
	//根据ID查供应商信息
	GYS queryByID(String gyid);
}
