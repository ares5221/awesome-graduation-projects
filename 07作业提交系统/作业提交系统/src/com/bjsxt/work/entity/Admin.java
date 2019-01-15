/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;

/**
 * @author 李军伟
 * @function:
 * @date: 2017年8月30日
 */
public class Admin implements Serializable, Comparable<Admin> {

	private static final long serialVersionUID = -1675684801077961497L;
	
	private Integer aid; 		// id值
	private String aname;		// 账号
	private String password;	// 密码

	public Admin() {
		super();
	}

	public Admin(String aname, String password) {
		this.aname = aname;
		this.password = password;
	}

	public Admin(Integer aid, String aname, String password) {
		this(aname, password);
		this.aid = aid;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aid == null) ? 0 : aid.hashCode());
		result = prime * result + ((aname == null) ? 0 : aname.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
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
		Admin other = (Admin) obj;
		if (aid == null) {
			if (other.aid != null)
				return false;
		} else if (!aid.equals(other.aid))
			return false;
		if (aname == null) {
			if (other.aname != null)
				return false;
		} else if (!aname.equals(other.aname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}

	@Override
	public int compareTo(Admin o) {
		return this.aid - o.aid;
	}

}
