package com.kb.eis.pojo;

import java.io.Serializable;
import java.util.Comparator;

public class GYS implements Serializable{

	private String gyid;	//供应商ID
	private String name;	//名称
	private String jc;		//简称
	private String address;	//地址
	private String bianMa;	//邮编
	private String tel;		//电话
	private String lian;	//联系人
	private String ltel;	//联系人电话
	private String yh;		//银行
	private String mail;	//邮箱
	
	public GYS(String name, String jc, String address, String bianMa,
			String tel, String lian, String ltel, String yh, String mail) {
		super();
		this.name = name;
		this.jc = jc;
		this.address = address;
		this.bianMa = bianMa;
		this.tel = tel;
		this.lian = lian;
		this.ltel = ltel;
		this.yh = yh;
		this.mail = mail;
	}

	public GYS() {
		super();
	}

	public GYS(String gyid, String name, String jc, String address,
			String bianMa, String tel, String lian, String ltel, String yh,
			String mail) {
		super();
		this.gyid = gyid;
		this.name = name;
		this.jc = jc;
		this.address = address;
		this.bianMa = bianMa;
		this.tel = tel;
		this.lian = lian;
		this.ltel = ltel;
		this.yh = yh;
		this.mail = mail;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((bianMa == null) ? 0 : bianMa.hashCode());
		result = prime * result + ((gyid == null) ? 0 : gyid.hashCode());
		result = prime * result + ((jc == null) ? 0 : jc.hashCode());
		result = prime * result + ((lian == null) ? 0 : lian.hashCode());
		result = prime * result + ((ltel == null) ? 0 : ltel.hashCode());
		result = prime * result + ((mail == null) ? 0 : mail.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
		result = prime * result + ((yh == null) ? 0 : yh.hashCode());
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
		GYS other = (GYS) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (bianMa == null) {
			if (other.bianMa != null)
				return false;
		} else if (!bianMa.equals(other.bianMa))
			return false;
		if (gyid == null) {
			if (other.gyid != null)
				return false;
		} else if (!gyid.equals(other.gyid))
			return false;
		if (jc == null) {
			if (other.jc != null)
				return false;
		} else if (!jc.equals(other.jc))
			return false;
		if (lian == null) {
			if (other.lian != null)
				return false;
		} else if (!lian.equals(other.lian))
			return false;
		if (ltel == null) {
			if (other.ltel != null)
				return false;
		} else if (!ltel.equals(other.ltel))
			return false;
		if (mail == null) {
			if (other.mail != null)
				return false;
		} else if (!mail.equals(other.mail))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		if (yh == null) {
			if (other.yh != null)
				return false;
		} else if (!yh.equals(other.yh))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GYS [gyid=" + gyid + ", name=" + name + ", jc=" + jc
				+ ", address=" + address + ", bianMa=" + bianMa + ", tel="
				+ tel + ", lian=" + lian + ", ltel=" + ltel + ", yh=" + yh
				+ ", mail=" + mail + "]";
	}

	public String getGyid() {
		return gyid;
	}

	public void setGyid(String gyid) {
		this.gyid = gyid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJc() {
		return jc;
	}

	public void setJc(String jc) {
		this.jc = jc;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBianMa() {
		return bianMa;
	}

	public void setBianMa(String bianMa) {
		this.bianMa = bianMa;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLian() {
		return lian;
	}

	public void setLian(String lian) {
		this.lian = lian;
	}

	public String getLtel() {
		return ltel;
	}

	public void setLtel(String ltel) {
		this.ltel = ltel;
	}

	public String getYh() {
		return yh;
	}

	public void setYh(String yh) {
		this.yh = yh;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	
}


class BiJiaoQi implements Comparator{

	@Override
	public int compare(Object o1, Object o2) {
		GYS gys1=(GYS)o1;
		GYS gys2=(GYS)o2;
		return gys1.getGyid().compareTo(gys2.getGyid());
	}
}