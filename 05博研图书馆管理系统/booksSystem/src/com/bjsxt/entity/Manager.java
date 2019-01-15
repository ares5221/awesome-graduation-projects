package com.bjsxt.entity;

public class Manager {
	private int sid;
	private int pid;
	private String name;
	private String pwd;
	private Purview purview;

	public Manager() {
	}

	public Manager(int sid, int pid, String name, String pwd) {
		this.sid = sid;
		this.pid = pid;
		this.name = name;
		this.pwd = pwd;
	}

	public Manager(String name, String pwd) {
		super();
		this.name = name;
		this.pwd = pwd;
	}

	public Manager(int sid, int pid, String name, String pwd, Purview purview) {
		super();
		this.sid = sid;
		this.pid = pid;
		this.name = name;
		this.pwd = pwd;
		this.purview = purview;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Purview getPurview() {
		return purview;
	}

	public void setPurview(Purview purview) {
		this.purview = purview;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + pid;
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + sid;
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
		Manager other = (Manager) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pid != other.pid)
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (sid != other.sid)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Manager [sid=" + sid + ", pid=" + pid + ", name=" + name
				+ ", pwd=" + pwd + "]";
	}
}