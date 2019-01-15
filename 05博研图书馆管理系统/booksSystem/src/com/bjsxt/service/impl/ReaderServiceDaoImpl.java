package com.bjsxt.service.impl;

import java.util.List;

import com.bjsxt.dao.ReaderDao;
import com.bjsxt.dao.impl.ReaderDaoImpl;
import com.bjsxt.entity.Reader;
import com.bjsxt.entity.ReaderType;
import com.bjsxt.service.ReaderServiceDao;
import com.bjsxt.util.SxtPageUtil;

public class ReaderServiceDaoImpl implements ReaderServiceDao {
	private ReaderDao reaDao=new ReaderDaoImpl();
	@Override
	public List<ReaderType> findAllRederType() {
		// TODO Auto-generated method stub
		return reaDao.findAllRederType();
	}

	@Override
	public int addRederType(ReaderType readertype) {
		// TODO Auto-generated method stub
		return reaDao.addRederType(readertype);
	}

	@Override
	public ReaderType findRederTypeone(int id) {
		// TODO Auto-generated method stub
		return reaDao.findRederTypeone(id);
	}

	@Override
	public int modifyRederType(ReaderType readertype) {
		// TODO Auto-generated method stub
		return reaDao.modifyRederType(readertype);
	}

	@Override
	public int deleteRederType(int id) {
		// TODO Auto-generated method stub
		return reaDao.deleteRederType(id);
	}

	@Override
	public void findAllManager(SxtPageUtil<Reader> sxtPageUtil) {
		reaDao.findAllManager(sxtPageUtil);
		
	}

	@Override
	public int count() {
		
		return reaDao.count();
	}

	@Override
	public Reader findReder(int id) {
		
		return reaDao.findReder(id);
	}

}
