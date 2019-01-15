package com.bjsxt.service;

import java.util.List;

import com.bjsxt.entity.Reader;
import com.bjsxt.entity.ReaderType;
import com.bjsxt.util.SxtPageUtil;

public interface ReaderServiceDao {
	//读者类型
		List<ReaderType> findAllRederType(); 
		//添加类型
		int addRederType(ReaderType readertype);
		//查找单个类型
		ReaderType findRederTypeone(int id);
		//修改类型
		int  modifyRederType(ReaderType readertype);
		//删除读者类型
		int deleteRederType(int id);
		//查询所有读者信息
		void findAllManager(SxtPageUtil<Reader> sxtPageUtil);
		//查询所有读者信息总数
		int count();
		Reader findReder(int id);
}
