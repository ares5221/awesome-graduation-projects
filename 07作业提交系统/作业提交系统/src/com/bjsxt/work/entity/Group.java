/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author 李军伟
 * @function: 小组
 * @date: 2017年8月31日
 */
public class Group implements Serializable, Comparable<Group> {

	private static final long serialVersionUID = -7440177868143404857L;
	
	private Integer gid;
	private String name1;
	private String name2;
	private String gname;
	
	// 注入组长和技术组长
	private Set<Student> student = new HashSet<Student>(); 
	public Set<Student> getStudent() {
		return student;
	}
	public void setStudent(Set<Student> student) {
		this.student = student;
	}
	
	// 创建小组的时候用
	private List<Student> slist = new ArrayList<Student>();
	public List<Student> getSlist() {
		return slist;
	}
	public void setSlist(List<Student> slist) {
		this.slist = slist;
	}

	public Group() {
		super();
	}

	public Group(int gid) {
		this.gid = gid;
	}
	
	public Group(String gname) {
		super();
		this.gname = gname;
	}

	public Group(Integer gid, String gname) {
		super();
		this.gid = gid;
		this.gname = gname;
	}
	
	public Group(Integer gid, String name1, String name2) {
		super();
		this.gid = gid;
		this.name1 = name1;
		this.name2 = name2;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((gid == null) ? 0 : gid.hashCode());
		result = prime * result + ((gname == null) ? 0 : gname.hashCode());
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
		Group other = (Group) obj;
		if (gid == null) {
			if (other.gid != null)
				return false;
		} else if (!gid.equals(other.gid))
			return false;
		if (gname == null) {
			if (other.gname != null)
				return false;
		} else if (!gname.equals(other.gname))
			return false;
		return true;
	}

	@Override
	public int compareTo(Group o) {
		return this.gid - o.gid;
	}

}
