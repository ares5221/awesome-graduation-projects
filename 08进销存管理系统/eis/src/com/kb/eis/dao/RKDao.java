package com.kb.eis.dao;

import java.util.List;

import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.RuKu;

public interface RKDao {
	/**
	 * 查询所有没有提交的入库单
	 * @return
	 */
	List<Pojo>query();

	
	/**
	 * 保存数据至入库表
	 * @param ruKu
	 * @return
	 */
	public int saveRuKuInfo(RuKu ruKu);


	/**
	 * 通过rkid查询入库表
	 * @param rkid
	 * @return
	 */
	RuKu queryByID(String rkid);
	/**
	 * 查询所有提交过的入库单
	 */
	public List<Pojo> queryRecord();
	/**
	 * 提交过以后更改判断字段
	 * 
	 * @param rkid
	 * @return
	 */
	public int updateByID(String rkid);


	int delete(String rkid);

}
