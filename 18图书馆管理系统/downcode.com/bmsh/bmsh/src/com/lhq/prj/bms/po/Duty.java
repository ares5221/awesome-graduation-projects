package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * Duty.java Create on 2008-9-18 下午08:02:11
 * Download by http://www.codefans.net
 * 职务
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Duty implements Serializable {

	public Duty() {
	}

	public Duty(Integer dutyId, String dutyName, String remark) {
		this.dutyId = dutyId;
		this.dutyName = dutyName;
		this.remark = remark;
	}

	/** 职务id */
	private Integer dutyId;

	/** 职务名称 */
	private String dutyName;

	/** 备注 */
	private String remark;

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
