package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.GYSDao;
import com.kb.eis.dao.impl.GYSDaoImpl;
import com.kb.eis.pojo.GYS;
import com.kb.eis.service.GYSService;

public class GYSServiceImpl implements GYSService {

	private GYSDao dao = new GYSDaoImpl();

	@Override
	public List<GYS> query() {
		List<GYS> list = dao.query();
		return list != null ? list : null;
	}

	@Override
	public int add(GYS gys) {
		return this.dao.insert(gys);
	}
	@Override
	public List<GYS> queryByName(String gysname) {
		return dao.queryByName(gysname);
	}

	@Override
	public int update(GYS gys) {
		return dao.update(gys);
	}

	@Override
	public GYS queryByID(String gyid) {
		return dao.queryByID(gyid);
	}

}
