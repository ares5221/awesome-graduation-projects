package com.bjsxt.entity;

import java.util.Date;

/**
 * 图书馆
 * 
 * @author Administrator
 */
public class Library {
	private int lid;
	private String name;
	private String liber;
	private String tel;
	private String addr;
	private String email;
	private String url;
	private Date creatdate;
	private String intro;

	public Library(int lid, String name, String liber, String tel, String addr,
			String email, String url, Date creatdate, String intro) {
		super();
		this.lid = lid;
		this.name = name;
		this.liber = liber;
		this.tel = tel;
		this.addr = addr;
		this.email = email;
		this.url = url;
		this.creatdate = creatdate;
		this.intro = intro;
	}

	public Library() {
		super();
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLiber() {
		return liber;
	}

	public void setLiber(String liber) {
		this.liber = liber;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getCreatdate() {
		return creatdate;
	}

	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "Library [lid=" + lid + ", name=" + name + ", liber=" + liber
				+ ", tel=" + tel + ", addr=" + addr + ", email=" + email
				+ ", url=" + url + ", creatdate=" + creatdate + ", intro="
				+ intro + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addr == null) ? 0 : addr.hashCode());
		result = prime * result
				+ ((creatdate == null) ? 0 : creatdate.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((intro == null) ? 0 : intro.hashCode());
		result = prime * result + ((liber == null) ? 0 : liber.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + lid;
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
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
		Library other = (Library) obj;
		if (addr == null) {
			if (other.addr != null)
				return false;
		} else if (!addr.equals(other.addr))
			return false;
		if (creatdate == null) {
			if (other.creatdate != null)
				return false;
		} else if (!creatdate.equals(other.creatdate))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (intro == null) {
			if (other.intro != null)
				return false;
		} else if (!intro.equals(other.intro))
			return false;
		if (liber == null) {
			if (other.liber != null)
				return false;
		} else if (!liber.equals(other.liber))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (lid != other.lid)
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}
}
