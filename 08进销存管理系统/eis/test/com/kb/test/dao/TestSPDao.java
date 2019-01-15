package com.kb.test.dao;

import org.junit.Test;

import com.kb.eis.dao.SPDao;
import com.kb.eis.dao.impl.SPDaoImpl;
import com.kb.eis.pojo.SPInfo;

public class TestSPDao {
	@Test
	public void selectByIdTest(){
		SPDao spDao = new SPDaoImpl();
		SPInfo selectById = spDao.selectById("i1");
		System.out.println(selectById);
	}
}
