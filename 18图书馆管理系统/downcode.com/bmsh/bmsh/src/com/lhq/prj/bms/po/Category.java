package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * Category.java Create on 2008-9-21 下午04:21:51
 * 
 * 分类
 * Download by http://www.codefans.net
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Category implements Serializable {

	/** 分类id */
	private Integer categoryId;

	/** 分类名称 */
	private String categoryName;

	/** 所属科目id */
	private Integer subjectId;

	/** 所属科目名称 */
	private String subjectName;
	
	/** 备注 */
	private String remark;

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
