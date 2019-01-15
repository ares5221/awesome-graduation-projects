package com.zhatian.Tinner.entity;

import java.io.Serializable;

public class SignDate implements Serializable{
	private String Name;
	private String inTime;
	private String outTime;
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	
	public SignDate(String name, String inTime, String outTime) {
		Name = name;
		this.inTime = inTime;
		this.outTime = outTime;
	}
	
	public SignDate() {
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Name == null) ? 0 : Name.hashCode());
		result = prime * result + ((inTime == null) ? 0 : inTime.hashCode());
		result = prime * result + ((outTime == null) ? 0 : outTime.hashCode());
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
		SignDate other = (SignDate) obj;
		if (Name == null) {
			if (other.Name != null)
				return false;
		} else if (!Name.equals(other.Name))
			return false;
		if (inTime == null) {
			if (other.inTime != null)
				return false;
		} else if (!inTime.equals(other.inTime))
			return false;
		if (outTime == null) {
			if (other.outTime != null)
				return false;
		} else if (!outTime.equals(other.outTime))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "SignDate [Name=" + Name + ", inTime=" + inTime + ", outTime=" + outTime + "]";
	}
	
	
}
