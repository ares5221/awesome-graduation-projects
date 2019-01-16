package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Category;
import com.lhq.prj.bms.po.Subject;

/**
 * IDeptDao.java Create on 2008-9-16 下午10:41:23
 * 
 * 分类管理持久层接口
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
public interface ICategoryDao {
	/**
	 * 保存一个分类实体到数据库
	 * 
	 * @param category
	 *            分类实体
	 * @return 主键id
	 */
	public Object saveCategory(Category category);

	/**
	 * 查找所有分类
	 * 
	 * @return
	 */
	public List findAll();

	/**
	 * 分页查找
	 * 
	 * @param page
	 *            条件
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * 分页查找的总记录
	 * 
	 * @param page
	 *            条件
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * 修改分类信息
	 * 
	 * @param category
	 * @return
	 * @throws Exception
	 */
	public Integer update(Category category) throws Exception;

	/**
	 * 根据id删除分类
	 * 
	 * @param categoryId
	 * @return
	 */
	public Integer deleteById(Integer categoryId);

	/**
	 * 根据分科目找分类
	 *
	 * @param subject
	 * @return
	 */
	public List findCategoryBySubject(Subject subject);
}
