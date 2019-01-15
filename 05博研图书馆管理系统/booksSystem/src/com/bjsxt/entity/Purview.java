package com.bjsxt.entity;

/**
 * 权限
 */
public class Purview {
	private int pid;
	private int sysset;
	private int readerset;
	private int bookset;
	private int borrowback;
	private int sysquery;

	public Purview(int pid, int sysset, int readerset, int bookset,
			int borrowback, int sysquery) {
		super();
		this.pid = pid;
		this.sysset = sysset;
		this.readerset = readerset;
		this.bookset = bookset;
		this.borrowback = borrowback;
		this.sysquery = sysquery;
	}

	public Purview() {
		super();
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getSysset() {
		return sysset;
	}

	public void setSysset(int sysset) {
		this.sysset = sysset;
	}

	public int getReaderset() {
		return readerset;
	}

	public void setReaderset(int readerset) {
		this.readerset = readerset;
	}

	public int getBookset() {
		return bookset;
	}

	public void setBookset(int bookset) {
		this.bookset = bookset;
	}

	public int getBorrowback() {
		return borrowback;
	}

	public void setBorrowback(int borrowback) {
		this.borrowback = borrowback;
	}

	public int getSysquery() {
		return sysquery;
	}

	public void setSysquery(int sysquery) {
		this.sysquery = sysquery;
	}

	@Override
	public String toString() {
		return "Purview [pid=" + pid + ", sysset=" + sysset + ", readerset="
				+ readerset + ", bookset=" + bookset + ", borrowback="
				+ borrowback + ", sysquery=" + sysquery + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bookset;
		result = prime * result + borrowback;
		result = prime * result + pid;
		result = prime * result + readerset;
		result = prime * result + sysquery;
		result = prime * result + sysset;
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
		Purview other = (Purview) obj;
		if (bookset != other.bookset)
			return false;
		if (borrowback != other.borrowback)
			return false;
		if (pid != other.pid)
			return false;
		if (readerset != other.readerset)
			return false;
		if (sysquery != other.sysquery)
			return false;
		if (sysset != other.sysset)
			return false;
		return true;
	}

}