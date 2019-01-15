package com.bjsxt.work.service.impl;

import java.util.List;

import com.bjsxt.work.dao.impl.InformDaoImpl;
import com.bjsxt.work.entity.Inform;
import com.bjsxt.work.service.InformService;

public class InformServiceImpl implements InformService {

	private InformDaoImpl informDao = new InformDaoImpl();
	public int add(Inform inform) {
		
		return this.informDao.save(inform);
	}
	@Override
    public List<Inform> findAll() {
		
		return this.informDao.findAll();
	}
	@Override
	public Inform findById(int iid, String title) {
		
		return this.informDao.findById(iid, title);
	}
	
	@Override
	public int delete(int iid) {
		return this.informDao.delete(iid);
	}  

}
