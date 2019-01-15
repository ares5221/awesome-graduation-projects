package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.MajorDao;
import com.bjsxt.school.dao.impl.MajorDaoImpl;
import com.bjsxt.school.entity.Major;
import com.bjsxt.school.service.MajorService;

public class MajorServiceImpl implements MajorService {

	private MajorDao majorDao = new MajorDaoImpl();
	@Override
	public List<Major> show() {
		return majorDao.findAll();
	}
	@Override
	public int addMajor(Major major) {
		return  this.majorDao.save(major);
	}
	@Override
	public List<Major> findAll() {
		return this.majorDao.findAll();
	}
	@Override
	public void delete(String mno) {
		this.majorDao.deleteMno(mno);
	}
	@Override
	public int updateMno(Major major) {
		return this.majorDao.updateMno(major);
	}
	@Override
	public Major findMajor(String mNo) {
		return this.majorDao.findMajor(mNo);
	}

}
