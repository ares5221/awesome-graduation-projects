package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.CGDao;
import com.kb.eis.dao.impl.CGDaoImpl;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.service.CGService;

public class CGServiceImpl implements CGService {
	
	private CGDao cgDao = new CGDaoImpl();
	
	/**
	 * 获取所有采购单上商品的信息
	 * @return
	 */
	public List<Pojo> findAllCG() {
		return this.cgDao.queryAllCG();
	}
	
	/**
	 * 查询采购，商品和供应商表信息
	 * @return
	 */
	public List<Pojo> findAll() {
		return this.cgDao.queryAll();
	}
	
	/**
	 * 根据采购编号查询采购表，商品表，供应商表
	 * @param id
	 * @return
	 */
	public List<Pojo> findById(String id) {
		
		return this.cgDao.queryById(id);
	}

	public String findCSById(String sspid) {
		
		return cgDao.findCSById(sspid);
	}

	@Override
	public int add(CG cg) {
		
		return cgDao.add(cg);
	}

	@Override
	public CG queryByID(String id) {
		CG cg = cgDao.queryByCGID(id);
		return cg!=null?cg:null;
	}

	@Override
	public int update(CG cg) {
		return cgDao.update(cg);
	}

	public List<Pojo> findIsCG() {
		return cgDao.queryis();
	}

	
}
