package com.kb.eis.dao;

import java.util.List;

import com.kb.eis.pojo.GYS;

public interface GYSDao {

	List<GYS> query();
	
	GYS queryByID(String gyid);
	/**
	 * 添加供应商数据
	 * @param gys
	 * @return
	 */
	int insert(GYS gys);
	
	//模糊查询供应商名称
	List<GYS> queryByName(String gysname);
	
	//修改供应商信息
	int update(GYS gys);
}
