/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;

/**
 * @author 李军伟
 * @function: 教师
 * @date: 2017年8月31日
 */
public class Teacher implements Serializable, Comparable<Teacher> {

	private static final long serialVersionUID = -72118396409052208L;

	private Integer tid;  //编号
	private String tname; //姓名
	private String password;//密码

	public Teacher() {
		super();
	}
	
	public Teacher(Integer tid) {
		this.tid = tid;
	}

	public Teacher(String tname, String password) {
		this.tname = tname;
		this.password = password;
	}

	public Teacher(Integer tid, String tname, String password) {
		this(tname, password);
		this.tid = tid;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Teacher [tid=" + tid + ", tname=" + tname + ", password=" + password + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((tid == null) ? 0 : tid.hashCode());
		result = prime * result + ((tname == null) ? 0 : tname.hashCode());
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
		Teacher other = (Teacher) obj;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (tid == null) {
			if (other.tid != null)
				return false;
		} else if (!tid.equals(other.tid))
			return false;
		if (tname == null) {
			if (other.tname != null)
				return false;
		} else if (!tname.equals(other.tname))
			return false;
		return true;
	}

	@Override
	public int compareTo(Teacher o) {
		return 0;
	}

}
