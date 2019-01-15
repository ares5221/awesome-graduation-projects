package com.kb.eis.pojo;

import java.sql.Date;

public class RuKu {
	private String rkid;//入库票号
	private String cgid;//采购单号
	private String spid;//商品编号
	private double wf;//未付
	private double sf;//实付
	private String jsfs;//结算方式
	private Date rkdate;//入库日期
	private String czy;//操作员
	private String jsr;//经手人
	private String gysname;//供应商名字
	
	
	
	public RuKu(String cgid, String spid, double wf, double sf, String jsfs,
			String czy, String jsr, String gysname) {
		super();
		this.cgid = cgid;
		this.spid = spid;
		this.wf = wf;
		this.sf = sf;
		this.jsfs = jsfs;
		this.czy = czy;
		this.jsr = jsr;
		this.gysname = gysname;
	}
	public RuKu(String cgid, String spid, double wf, double sf,
			String jsfs, Date rkdate, String czy, String jsr, String gysname) {
		super();
		this.cgid = cgid;
		this.spid = spid;
		this.wf = wf;
		this.sf = sf;
		this.jsfs = jsfs;
		this.rkdate = rkdate;
		this.czy = czy;
		this.jsr = jsr;
		this.gysname = gysname;
	}
	public RuKu(String rkid, String cgid, String spid, double wf, double sf,
			String jsfs, Date rkdate, String czy, String jsr) {
		super();
		this.rkid = rkid;
		this.cgid = cgid;
		this.spid = spid;
		this.wf = wf;
		this.sf = sf;
		this.jsfs = jsfs;
		this.rkdate = rkdate;
		this.czy = czy;
		this.jsr = jsr;
	}
	public RuKu() {
		super();
	}
	public String getRkid() {
		return rkid;
	}
	public void setRkid(String rkid) {
		this.rkid = rkid;
	}
	public String getCgid() {
		return cgid;
	}
	public void setCgid(String cgid) {
		this.cgid = cgid;
	}
	public String getSpid() {
		return spid;
	}
	public void setSpid(String spid) {
		this.spid = spid;
	}
	public double getWf() {
		return wf;
	}
	public void setWf(double wf) {
		this.wf = wf;
	}
	public double getSf() {
		return sf;
	}
	public void setSf(double sf) {
		this.sf = sf;
	}
	public String getjsfs() {
		return jsfs;
	}
	public void setjsfs(String jsfs) {
		this.jsfs = jsfs;
	}
	public Date getRkdate() {
		return rkdate;
	}
	public void setRkdate(Date rkdate) {
		this.rkdate = rkdate;
	}
	public String getCzy() {
		return czy;
	}
	public void setCzy(String czy) {
		this.czy = czy;
	}
	public String getJsr() {
		return jsr;
	}
	public void setJsr(String jsr) {
		this.jsr = jsr;
	}
	
	
	public String getJsfs() {
		return jsfs;
	}
	public void setJsfs(String jsfs) {
		this.jsfs = jsfs;
	}
	public String getGysname() {
		return gysname;
	}
	public void setGysname(String gysname) {
		this.gysname = gysname;
	}
	public RuKu(String cgid, String spid, double wf, double sf, String jsfs,
			Date rkdate, String czy, String jsr) {
		super();
		this.cgid = cgid;
		this.spid = spid;
		this.wf = wf;
		this.sf = sf;
		this.jsfs = jsfs;
		this.rkdate = rkdate;
		this.czy = czy;
		this.jsr = jsr;
	}
	
}
