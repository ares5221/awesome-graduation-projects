/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;

/**
 * @author 李军伟
 * @function: 学生实体
 * @date: 2017年8月31日
 */
public class Student implements Serializable, Comparable<Student> {

	private static final long serialVersionUID = -8019834546096963593L;

	private Integer sid; //编号
	private String sname;//账户名
	private String password;//密码

	// 注入班级和小组
	private Clazz clazz = new Clazz();
	private Group group = new Group();
	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}
	
	// 注入小组 和作业
	private Record record;
	private Work work;
	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

	public Student() {
		super();
	}
	
	public Student(Integer sid) {
		this.sid = sid;
	}

	public Student(String sname, String password) {
		this.sname = sname;
		this.password = password;
	}

	public Student(Integer sid, String sname, String password) {
		this(sname, password);
		this.sid = sid;
	}

	// 添加一条作业提交记录
	public Student(Integer sid, Integer gid, Integer cid, String sname, String password) {
		this(sid, sname, password);
		this.group.setGid(gid);
		this.clazz.setCid(cid);
	}

	public Student(String sname, Record record, Work work, Group group) {
		this.sname = sname;
		this.record = record;
		this.work = work;
		this.group = group;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", password=" + password + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((sid == null) ? 0 : sid.hashCode());
		result = prime * result + ((sname == null) ? 0 : sname.hashCode());
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
		Student other = (Student) obj;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (sid == null) {
			if (other.sid != null)
				return false;
		} else if (!sid.equals(other.sid))
			return false;
		if (sname == null) {
			if (other.sname != null)
				return false;
		} else if (!sname.equals(other.sname))
			return false;
		return true;
	}

	@Override
	public int compareTo(Student o) {
		return this.sid - o.sid;
	}

	

}
