package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * User.java Create on 2008-9-18 下午09:32:48
 * 
 * 用户类
 * 
 * Copyright (c) 2008 by MTA.
 * Download by http://www.codefans.net
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class User implements Serializable {

	public User() {
	}

	/** 用户id */
	private Integer userId;

	/** 员工姓名 */
	private String emplName;

	/** 员工编码 */
	private String emplNo;

	/** 移动电话 */
	private String mobilePhone;

	/** 性别 */
	private String sex;

	/** 年龄 */
	private Integer age;

	/** 用户名 */
	private String userName;

	/** 密码 */
	private String password;

	/** 所属分公司的id */
	private Integer companyId;

	/** 所属分公司 */
	private String companyName;

	/** 所属部门的id */
	private Integer deptId;

	/** 所属部门 */
	private String deptName;

	/** 职务id */
	private Integer dutyId;

	/** 职务名称 */
	private String dutyName;

	/** 是否管理员 */
	private boolean manager;

	/** 备注 */
	private String remark;

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
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

	public Integer getDutyId() {
		return dutyId;
	}

	public void setDutyId(Integer dutyId) {
		this.dutyId = dutyId;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public String getEmplName() {
		return emplName;
	}

	public void setEmplName(String emplName) {
		this.emplName = emplName;
	}

	public String getEmplNo() {
		return emplNo;
	}

	public void setEmplNo(String emplNo) {
		this.emplNo = emplNo;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public boolean isManager() {
		return manager;
	}

	public void setManager(boolean manager) {
		this.manager = manager;
	}


}
