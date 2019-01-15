package com.kb.eis.dao;

import java.util.List;

import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.Pojo;

public interface CGDao {
	
	/**
	 * 查询所有采购单上商品的信息
	 * @return
	 */
	List<Pojo> queryAllCG();

	CG queryByCGID(String cgid);
	
	/**
	 * 查询采购，商品，供应商信息
	 * @return
	 */
	List<Pojo> queryAll();
	
	/**
	 * 根据采购编号查询采购表，商品表，供应商表
	 * @param id
	 * @return
	 */

	List<Pojo> queryById(String id);
	
	

	String findCSById(String sspid);

	int add(CG cg);

	int update(CG cg);

	List<Pojo> queryis();



}
