package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.KuCunDao;
import com.kb.eis.dao.SPDao;
import com.kb.eis.dao.impl.KuCunDaoImpl;
import com.kb.eis.dao.impl.SPDaoImpl;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.pojo.Sell;
import com.kb.eis.service.SPService;

public class SPServiceImpl implements SPService {

	private SPDao spDao = new SPDaoImpl();

	@Override
	public SPInfo queryById(String spId) {
		return this.spDao.selectById(spId);
	}

	@Override
	public List<Pojo> showAll() {
		return this.spDao.selectAll();
	}

	@Override
	public int add(SPInfo spInfo) {
		return this.spDao.insert(spInfo);
	}

	@Override
	public int update(SPInfo spInfo) {
		return this.spDao.update(spInfo);
	}

	@Override
	public void delete(String spId) {
		this.spDao.delete(spId);
	}
	

	
	/**
	 * 商品销售
	 * @param sell
	 * @return
	 */
	public int updateSell(Sell sell) {
		
		return this.spDao.updateSell(sell);
	}
	
	/**
	 * 销售记录查询
	 * @return
	 */
	public List<Sell> querySalesRecord() {
		return this.spDao.findSalesRecord();
	}

	public int qs(String id) {
		return this.spDao.qs(id);
	}
}
