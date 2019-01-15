package com.bjsxt.dao;

import java.util.List;

import com.bjsxt.entity.Library;

/**
 * 图书管信息
 * @author Administrator
 *
 */
public interface LibraryDao {
	//查询图书管信息
	Library findLibrary();

	int modifyLibrary(Library library);
	
}
