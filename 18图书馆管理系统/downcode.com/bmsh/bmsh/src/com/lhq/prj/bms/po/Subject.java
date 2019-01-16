package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * Subject.java Create on 2008-9-21 下午03:42:14
 * 
 * 科目类
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Subject implements Serializable {

	/** 科目id */
	private Integer subjectId;

	/** 科目名称 */
	private String subjectName;

	/** 备注 */
	private String remark;

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

}
