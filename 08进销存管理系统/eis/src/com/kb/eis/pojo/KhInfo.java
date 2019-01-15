package com.kb.eis.pojo;

public class KhInfo  {
									//	TAB_KHINFO  客户信息      对应2.4
	private int khid;				//	KHID	VARCHAR2(50)	N		客户ID
	private String khname;			//	KHNAME	VARCHAR2(50)	Y		客户全称	
	private String jian;			//	JIAN	VARCHAR2(50)	Y		简称	
	private String address;			//	ADDRESS	VARCHAR2(100)	Y		客户地址	
	private String bianma;			//	BIANMA	VARCHAR2(50)	Y		邮政编码	
	private String tel;				//	TEL	VARCHAR2(50)	Y			电话
	private String fax;				//	FAX	VARCHAR2(50)	Y			传真
	private String lian;			//	LIAN	VARCHAR2(50)	Y		联系人	
	private String ltel;			//	LTEL	VARCHAR2(50)	Y		联系电话	
	private String mail;			//	MAIL	VARCHAR2(50)	Y		E-Mail	
	private String yinhang;			//	XINHANG	VARCHAR2(60)	Y		银行	
	private String hao;				//	HAO	VARCHAR2(60)	Y			银行账号
	
	public KhInfo() {
		super();
	}
	public KhInfo(int khid, String khname, String jian, String address,
			String bianma, String tel, String fax, String lian, String ltel,
			String mail, String yinhang, String hao) {
		super();
		this.khid = khid;
		this.khname = khname;
		this.jian = jian;
		this.address = address;
		this.bianma = bianma;
		this.tel = tel;
		this.fax = fax;
		this.lian = lian;
		this.ltel = ltel;
		this.mail = mail;
		this.yinhang = yinhang;
		this.hao = hao;
	}
	@Override
	public String toString() {
		return "KhInfo [khid=" + khid + ", khname=" + khname + ", jian=" + jian
				+ ", address=" + address + ", bianma=" + bianma + ", tel="
				+ tel + ", fax=" + fax + ", lian=" + lian + ", ltel=" + ltel
				+ ", mail=" + mail + ", yinhang=" + yinhang + ", hao=" + hao
				+ "]";
	}
	public int getKhid() {
		return khid;
	}
	public void setKhid(int khid) {
		this.khid = khid;
	}
	public String getKhname() {
		return khname;
	}
	public void setKhname(String khname) {
		this.khname = khname;
	}
	public String getJian() {
		return jian;
	}
	public void setJian(String jian) {
		this.jian = jian;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBianma() {
		return bianma;
	}
	public void setBianma(String bianma) {
		this.bianma = bianma;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
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
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getYinhang() {
		return yinhang;
	}
	public void setYinhang(String yinhang) {
		this.yinhang = yinhang;
	}
	public String getHao() {
		return hao;
	}
	public void setHao(String hao) {
		this.hao = hao;
	}
	public KhInfo(String khname, String jian, String address, String bianma,
			String tel, String fax, String lian, String ltel, String mail,
			String yinhang, String hao) {
		super();
		this.khname = khname;
		this.jian = jian;
		this.address = address;
		this.bianma = bianma;
		this.tel = tel;
		this.fax = fax;
		this.lian = lian;
		this.ltel = ltel;
		this.mail = mail;
		this.yinhang = yinhang;
		this.hao = hao;
	}



}
