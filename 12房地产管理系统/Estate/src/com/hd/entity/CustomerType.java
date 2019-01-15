package com.hd.entity;

import java.io.Serializable;

public class CustomerType implements Serializable{
	int typeId;
	String typeName;
	String isUsed;
	public CustomerType() {
		super();
	}
	public CustomerType(int typeId, String typeName, String isUsed) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.isUsed = isUsed;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "CustomerType [typeId=" + typeId + ", typeName=" + typeName
				+ ", isUsed=" + isUsed + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((isUsed == null) ? 0 : isUsed.hashCode());
		result = prime * result + typeId;
		result = prime * result
				+ ((typeName == null) ? 0 : typeName.hashCode());
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
		CustomerType other = (CustomerType) obj;
		if (isUsed == null) {
			if (other.isUsed != null)
				return false;
		} else if (!isUsed.equals(other.isUsed))
			return false;
		if (typeId != other.typeId)
			return false;
		if (typeName == null) {
			if (other.typeName != null)
				return false;
		} else if (!typeName.equals(other.typeName))
			return false;
		return true;
	}
	
	
}
