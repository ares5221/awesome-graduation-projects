package com.hd.entity;

import java.io.Serializable;
import java.util.Date;

public class CustomerCare implements Serializable{
	int  careId;
	int customerId;
	String careTheme;
	String careWay;
	Date careTime;
	String careRemark;
	Date careNexttime;
	String carePeople;
	String isUsed;
	String customerName;
	
	public CustomerCare(int customerId, String careTheme, String careWay,
			Date careTime, String careRemark, Date careNexttime,
			String carePeople, String isUsed) {
		super();
		this.customerId = customerId;
		this.careTheme = careTheme;
		this.careWay = careWay;
		this.careTime = careTime;
		this.careRemark = careRemark;
		this.careNexttime = careNexttime;
		this.carePeople = carePeople;
		this.isUsed = isUsed;
	}


	public CustomerCare(int careId, int customerId, String careTheme,
			String careWay, Date careTime, String careRemark,
			Date careNexttime, String carePeople, String isUsed) {
		super();
		this.careId = careId;
		this.customerId = customerId;
		this.careTheme = careTheme;
		this.careWay = careWay;
		this.careTime = careTime;
		this.careRemark = careRemark;
		this.careNexttime = careNexttime;
		this.carePeople = carePeople;
		this.isUsed = isUsed;
	}
	
	
	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


	public CustomerCare() {
		super();
	}
	public int getCareId() {
		return careId;
	}
	public void setCareId(int careId) {
		this.careId = careId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCareTheme() {
		return careTheme;
	}
	public void setCareTheme(String careTheme) {
		this.careTheme = careTheme;
	}
	public String getCareWay() {
		return careWay;
	}
	public void setCareWay(String careWay) {
		this.careWay = careWay;
	}
	public Date getCareTime() {
		return careTime;
	}
	public void setCareTime(Date careTime) {
		this.careTime = careTime;
	}
	public String getCareRemark() {
		return careRemark;
	}
	public void setCareRemark(String careRemark) {
		this.careRemark = careRemark;
	}
	public Date getCareNexttime() {
		return careNexttime;
	}
	public void setCareNexttime(Date careNexttime) {
		this.careNexttime = careNexttime;
	}
	public String getCarePeople() {
		return carePeople;
	}
	public void setCarePeople(String carePeople) {
		this.carePeople = carePeople;
	}
	public String getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + careId;
		result = prime * result
				+ ((careNexttime == null) ? 0 : careNexttime.hashCode());
		result = prime * result
				+ ((carePeople == null) ? 0 : carePeople.hashCode());
		result = prime * result
				+ ((careRemark == null) ? 0 : careRemark.hashCode());
		result = prime * result
				+ ((careTheme == null) ? 0 : careTheme.hashCode());
		result = prime * result
				+ ((careTime == null) ? 0 : careTime.hashCode());
		result = prime * result + ((careWay == null) ? 0 : careWay.hashCode());
		result = prime * result + customerId;
		result = prime * result + ((isUsed == null) ? 0 : isUsed.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustomerCare other = (CustomerCare) obj;
		if (careId != other.careId)
			return false;
		if (careNexttime == null) {
			if (other.careNexttime != null)
				return false;
		} else if (!careNexttime.equals(other.careNexttime))
			return false;
		if (carePeople == null) {
			if (other.carePeople != null)
				return false;
		} else if (!carePeople.equals(other.carePeople))
			return false;
		if (careRemark == null) {
			if (other.careRemark != null)
				return false;
		} else if (!careRemark.equals(other.careRemark))
			return false;
		if (careTheme == null) {
			if (other.careTheme != null)
				return false;
		} else if (!careTheme.equals(other.careTheme))
			return false;
		if (careTime == null) {
			if (other.careTime != null)
				return false;
		} else if (!careTime.equals(other.careTime))
			return false;
		if (careWay == null) {
			if (other.careWay != null)
				return false;
		} else if (!careWay.equals(other.careWay))
			return false;
		if (customerId != other.customerId)
			return false;
		if (isUsed == null) {
			if (other.isUsed != null)
				return false;
		} else if (!isUsed.equals(other.isUsed))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "CustomerCare [careId=" + careId + ", customerId=" + customerId
				+ ", careTheme=" + careTheme + ", careWay=" + careWay
				+ ", careTime=" + careTime + ", careRemark=" + careRemark
				+ ", careNexttime=" + careNexttime + ", carePeople="
				+ carePeople + ", isUsed=" + isUsed + "]";
	}
	
	
	
}
