package com.bjsxt.entity;
/**
 * 书架
 * @author Administrator
 *
 */
public class BookCase {
	private int bcid;
	private String bcname;
	public BookCase(int bcid, String bcname) {
		super();
		this.bcid = bcid;
		this.bcname = bcname;
	}
	public BookCase() {
		super();
	}
	public int getBcid() {
		return bcid;
	}
	public void setBcid(int bcid) {
		this.bcid = bcid;
	}
	public String getBcname() {
		return bcname;
	}
	public void setBcname(String bcname) {
		this.bcname = bcname;
	}
	@Override
	public String toString() {
		return "BookCase [bcid=" + bcid + ", bcname=" + bcname + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bcid;
		result = prime * result + ((bcname == null) ? 0 : bcname.hashCode());
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
		BookCase other = (BookCase) obj;
		if (bcid != other.bcid)
			return false;
		if (bcname == null) {
			if (other.bcname != null)
				return false;
		} else if (!bcname.equals(other.bcname))
			return false;
		return true;
	}
}
