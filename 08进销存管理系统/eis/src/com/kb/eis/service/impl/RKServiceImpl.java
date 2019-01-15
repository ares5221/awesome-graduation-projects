package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.RKDao;
import com.kb.eis.dao.impl.CGDaoImpl;
import com.kb.eis.dao.impl.RKDaoImpl;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.RuKu;
import com.kb.eis.service.RKService;

public class RKServiceImpl implements RKService {
	private RKDao dao = new RKDaoImpl();
	/**
	 * 查询所有入库表
	 */
	@Override

	public List<Pojo> show() {
		return dao.query();
	}
	
	/**
	 * 添加数据至入库表
	 * @param ruKu
	 * @return
	 */
	public int addRuKuInfo(RuKu ruKu) {
		int rs = new CGDaoImpl().set(ruKu.getCgid());
		return dao.saveRuKuInfo(ruKu);
	}
	

	/**
	 * 查询所有已提交记录
	 * @return
	 */
	public List<Pojo> queryRecord() {
		return dao.queryRecord();
	}

	public int delete(String rkid) {
		return dao.delete(rkid);
	}

	
}
