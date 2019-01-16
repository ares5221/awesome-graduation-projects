package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Category;

/**    
 * IDeptService.java Create on 2008-9-16 下午10:38:57   
 *
 * 分类业务层接口
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author 廖瀚卿
 * @version 1.0  
 */
public interface ICategoryService {
	/**
	 * 添加分类
	 * @param category
	 * @return
	 */
	Object saveCategory(Category category);

	/**
	 * 查找所有分类
	 * @return
	 */
	List findAll();

	/**
	 * 分页查找
	 * @param page 分页对象
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * 修改分类信息
	 * @param category
	 * @return
	 * @throws Exception 
	 */
	boolean updateCategory(Category category) throws Exception;

	/**
	 * 删除分类
	 * 
	 * @param categoryId
	 * @return
	 */
	boolean deleteCategory(Integer categoryId);

	/**
	 * 根据科目查找所有分类
	 *
	 * @param page
	 * @return
	 */
	Page findCategoryBySubject(Page page);
}
 