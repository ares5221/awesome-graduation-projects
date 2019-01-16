/*
 * @(#)Dept.java 2008-9-16 
 *
 * Copyright 2008 MTA, Inc. All rights reserved.
 */

package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * 部门类
 * Download by http://www.codefans.net
 * @author lhq
 * @version 1.0 下午04:49:30
 */
@SuppressWarnings("serial")
public class Dept implements Serializable {
	public Dept() {
		super();
	}

	/** 部门ID（自动增值） */
	private Integer deptId;

	/** 部门名称 not null 50 */
	private String deptName;

	/** 所属分公司id not null */
	private Integer companyId;

	/** 所属分公司名称（冗余字段）not null 50 */
	private String companyName;

	/** (部门)地址 200 */
	private String address;

	/** (部门)电话 20 */
	private String tellPhone;

	/** (部门)负责人姓名 20 */
	private String leader;

	/** (部门)负责人电话 20 */
	private String mobilePhone;

	/** 备注 200 */
	private String remark;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTellPhone() {
		return tellPhone;
	}

	public void setTellPhone(String tellPhone) {
		this.tellPhone = tellPhone;
	}
}
