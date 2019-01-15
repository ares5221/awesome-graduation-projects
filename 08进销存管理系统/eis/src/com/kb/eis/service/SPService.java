package com.kb.eis.service;

import java.util.List;

import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.SPInfo;

public interface SPService {
	public int qs(String id);
	/**
	 * 根据ID查询商品
	 * @param spId
	 * @return
	 */
	SPInfo queryById(String spId);
	/**
	 * 查询所有
	 * @return
	 */
	List<Pojo> showAll();
	/**
	 * 添加商品
	 * @param spInfo
	 * @return
	 */
	int add(SPInfo spInfo);
	/**
	 * 修改商品信息
	 * @param spInfo
	 * @return
	 */
	int update(SPInfo spInfo);
	/**
	 * 删除商品
	 * @param spId
	 * @return 
	 * @return
	 */
	void delete(String spId);
	
}
