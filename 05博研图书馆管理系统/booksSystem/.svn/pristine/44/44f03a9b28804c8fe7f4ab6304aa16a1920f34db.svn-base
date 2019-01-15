package com.bjsxt.entity;

public class BookType {
	private int tid;
	private String typeName;
	private int days;
	
	
	public BookType() {
		super();
	}
	

	public BookType(String typeName, int days) {
		super();
		this.typeName = typeName;
		this.days = days;
	}


	public BookType(int tid, String typeName, int days) {
		super();
		this.tid = tid;
		this.typeName = typeName;
		this.days = days;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		days = days;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + days;
		result = prime * result + tid;
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
		BookType other = (BookType) obj;
		if (days != other.days)
			return false;
		if (tid != other.tid)
			return false;
		if (typeName == null) {
			if (other.typeName != null)
				return false;
		} else if (!typeName.equals(other.typeName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BookType [tid=" + tid + ", typeName=" + typeName + ", Days="
				+ days + "]";
	}
	
	
}
