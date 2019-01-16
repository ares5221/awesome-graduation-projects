package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Category;
import com.lhq.prj.bms.po.Subject;
import com.lhq.prj.bms.service.ICategoryService;

/**
 * DeptAction.java Create on 2008-9-16 下午10:35:18
 * 
 * 分类处理
 * 
 * Copyright (c) 2008 by MTA.
 * Download by http://www.codefans.net
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class CategoryAction extends BaseAction {
	private ICategoryService categoryService;

	private Category category;

	private boolean success;

	private Page page;

	private Integer categoryId;

	/**
	 * 添加分类
	 * 
	 * @return
	 */
	public String saveCategory() {
		categoryId = (Integer) categoryService.saveCategory(category);
		if (categoryId != null) {
			success = true;
		}
		return SUCCESS;
	}

	/**
	 * 根据分科目查找分类
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCategoryBySubject() {
		String strSubjectId = getRequest().getParameter("subjectId");
		Subject subject = new Subject();
		if (strSubjectId != null && !"".equals(strSubjectId)) {
			subject.setSubjectId(Integer.valueOf(strSubjectId));
		}
		List conditions = new ArrayList();
		conditions.add(subject);
		page = new Page();
		page.setConditions(conditions);
		page = categoryService.findCategoryBySubject(page);
		return SUCCESS;
	}
	
	/**
	 * 查找所有分类
	 * 
	 * @return
	 */
	public String findAll() {
		page = new Page();
		page.setRoot(categoryService.findAll());
		return SUCCESS;
	}

	/**
	 * 查找分类信息
	 * 
	 * @return
	 */
	public String findAllCategory() {
		String strCondition = getRequest().getParameter("conditions");
		List conditions = new ArrayList();
		MyUtils.addToCollection(conditions, MyUtils.split(strCondition, " ,"));
		page = new Page();
		page.setConditions(conditions);
		int start = Integer.valueOf(getRequest().getParameter("start"));
		int limit = Integer.valueOf(getRequest().getParameter("limit"));
		page.setStart(++start);
		page.setLimit(limit = limit == 0 ? 20 : limit);
		page = categoryService.findByPage(page);
		return SUCCESS;
	}

	/**
	 * 删除分类
	 * 
	 * @return
	 */
	public String deleteCategory() {
		String strCategoryId = getRequest().getParameter("categoryId");
		if (strCategoryId != null && !"".equals(strCategoryId)) {
			success = categoryService.deleteCategory(Integer.valueOf(strCategoryId));
		}
		return SUCCESS;
	}

	/**
	 * 修改分类信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateCategory() throws Exception {
		String fieldName = getRequest().getParameter("fieldName");
		String strSubjectId = getRequest().getParameter("subjectId");
		String fieldValue = getRequest().getParameter("fieldValue");
		String strCategoryId = getRequest().getParameter("categoryId");
		if (strCategoryId != null && !"".equals(strCategoryId)) {
			Category category = new Category();
			if ("subjectName".equals(fieldName) && !"".equals(strSubjectId)) {
				category.setSubjectId(Integer.valueOf(strSubjectId));
			}
			category.setCategoryId(Integer.valueOf(strCategoryId));
			MyUtils.invokeSetMethod(fieldName, category, new Object[] { fieldValue });
			success = categoryService.updateCategory(category);
		}
		return SUCCESS;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}

}
