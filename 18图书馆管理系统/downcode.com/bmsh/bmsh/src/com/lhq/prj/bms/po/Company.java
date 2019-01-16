package com.lhq.prj.bms.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Company implements Serializable {
	/** 公司id */
	private Integer companyId;

	/** 公司名称 */
	private String companyName;

	/** 公司地址 */
	private String address;

	/** 公司电话 */
	private String tellPhone;

	/** 公司负责人 */
	private String leader;

	/** 公司负责人电话 */
	private String mobilePhone;

	/** 备注 */
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
