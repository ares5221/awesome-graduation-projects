package com.bjsxt.work.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author 李军伟
 * @function: 班级实体
 * @date: 2017年8月31日
 */
public class Clazz implements Serializable, Comparable<Clazz> {

	private static final long serialVersionUID = -2994655247179872811L;
	
	private Integer cid; // 班级编号
	private String cname;//班级名字
	
	
	// 注入属性teacher的set集合
	private Set<Teacher> teacher = new HashSet<Teacher>();
	public Set<Teacher> getTeacher() {
		
		return teacher;
	}
	public void setTeacher(Set<Teacher> teacher) {
		this.teacher = teacher;
	}
	
	// 用于clazzList中的内循环遍历
	private List<Teacher> tlist = new ArrayList<Teacher>();
	public List<Teacher> getTlist() {
		return tlist;
	}
	public void setTlist(List<Teacher> tlist) {
		this.tlist = tlist;
	}

	public Clazz() {
		super();
	}
	
	public Clazz(int cid) {
		this.cid = cid;
	}

	public Clazz(String cname) {
		
		this.cname = cname;
	}
	
	public Clazz(int cid, String cname) {
		this.cid = cid;
		this.cname = cname;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Override
	public String toString() {
		return "Clazz [cid=" + cid + ", cname=" + cname + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cid == null) ? 0 : cid.hashCode());
		result = prime * result + ((cname == null) ? 0 : cname.hashCode());
		result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
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
		Clazz other = (Clazz) obj;
		if (cid == null) {
			if (other.cid != null)
				return false;
		} else if (!cid.equals(other.cid))
			return false;
		if (cname == null) {
			if (other.cname != null)
				return false;
		} else if (!cname.equals(other.cname))
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		return true;
	}

	@Override
	public int compareTo(Clazz o) {
		return this.cid - o.cid;
	}

	
}
