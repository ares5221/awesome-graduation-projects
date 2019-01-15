package com.kb.eis.service;

import java.util.List;

import com.kb.eis.pojo.Pojo;

public interface RKService {

	/**
	 * 显示所有没有提交的记录
	 * @return
	 */
	List<Pojo>show();
	/**
	 * 查询所有已提交记录
	 * @return
	 */
	public List<Pojo> queryRecord();
	public int delete(String rkid);

}
