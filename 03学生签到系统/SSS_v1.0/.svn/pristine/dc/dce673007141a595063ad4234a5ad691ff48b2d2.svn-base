package com.zhatian.Tinner.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 签到信息的实体类
 * @author ask-kraken
 * @version 1.0
 * @help 可能需要重写hashcode和equals方法
 */
public class Sign implements Serializable{
	private int sign_Id;
	private int sign_studentId;
	private Date sign_InTime;
	private Date sign_OutTime;
	private String sign_DateLog;
	private Date sign_Date;
	public Sign(int sign_Id, int sign_studentId, Date sign_InTime, Date sign_OutTime, String sign_DateLog,
			Date sign_Date) {
		this.sign_Id = sign_Id;
		this.sign_studentId = sign_studentId;
		this.sign_InTime = sign_InTime;
		this.sign_OutTime = sign_OutTime;
		this.sign_DateLog = sign_DateLog;
		this.sign_Date = sign_Date;
	}
	public Sign() {
	}
	public int getSign_Id() {
		return sign_Id;
	}
	public void setSign_Id(int sign_Id) {
		this.sign_Id = sign_Id;
	}
	public int getSign_studentId() {
		return sign_studentId;
	}
	public void setSign_studentId(int sign_studentId) {
		this.sign_studentId = sign_studentId;
	}
	public Date getSign_InTime() {
		return sign_InTime;
	}
	public void setSign_InTime(Date sign_InTime) {
		this.sign_InTime = sign_InTime;
	}
	public Date getSign_OutTime() {
		return sign_OutTime;
	}
	public void setSign_OutTime(Date sign_OutTime) {
		this.sign_OutTime = sign_OutTime;
	}
	public String getSign_DateLog() {
		return sign_DateLog;
	}
	public void setSign_DateLog(String sign_DateLog) {
		this.sign_DateLog = sign_DateLog;
	}
	public Date getSign_Date() {
		return sign_Date;
	}
	public void setSign_Date(Date sign_Date) {
		this.sign_Date = sign_Date;
	}
	@Override
	public String toString() {
		return "Sign [sign_Id=" + sign_Id + ", sign_studentId=" + sign_studentId + ", sign_InTime=" + sign_InTime
				+ ", sign_OutTime=" + sign_OutTime + ", sign_DateLog=" + sign_DateLog + ", sign_Date=" + sign_Date
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((sign_Date == null) ? 0 : sign_Date.hashCode());
		result = prime * result
				+ ((sign_DateLog == null) ? 0 : sign_DateLog.hashCode());
		result = prime * result + sign_Id;
		result = prime * result
				+ ((sign_InTime == null) ? 0 : sign_InTime.hashCode());
		result = prime * result
				+ ((sign_OutTime == null) ? 0 : sign_OutTime.hashCode());
		result = prime * result + sign_studentId;
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
		Sign other = (Sign) obj;
		if (sign_Date == null) {
			if (other.sign_Date != null)
				return false;
		} else if (!sign_Date.equals(other.sign_Date))
			return false;
		if (sign_DateLog == null) {
			if (other.sign_DateLog != null)
				return false;
		} else if (!sign_DateLog.equals(other.sign_DateLog))
			return false;
		if (sign_Id != other.sign_Id)
			return false;
		if (sign_InTime == null) {
			if (other.sign_InTime != null)
				return false;
		} else if (!sign_InTime.equals(other.sign_InTime))
			return false;
		if (sign_OutTime == null) {
			if (other.sign_OutTime != null)
				return false;
		} else if (!sign_OutTime.equals(other.sign_OutTime))
			return false;
		if (sign_studentId != other.sign_studentId)
			return false;
		return true;
	}
	
	
	
	
}
