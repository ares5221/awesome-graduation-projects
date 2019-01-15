package com.kb.eis.pojo;

import java.sql.Date;


public class CG implements Comparable<CG>{

	private String id;
	private String spid;
	private String dj;
	private String sl;
	private String je;
	private Date cgDate;
	private String memo;
	

	public CG(String spid, String dj, String sl, String je, Date cgDate,
			String memo) {
		super();
		this.spid = spid;
		this.dj = dj;
		this.sl = sl;
		this.je = je;
		this.cgDate = cgDate;
		this.memo = memo;
	}


	public CG(String id, String spid, String dj, String sl, String je,
			Date cgDate, String memo) {
		super();
		this.id = id;
		this.spid = spid;
		this.dj = dj;
		this.sl = sl;
		this.je = je;
		this.cgDate = cgDate;
		this.memo = memo;
	}


	@Override
	public String toString() {
		return "CG [id=" + id + ", spid=" + spid + ", dj=" + dj + ", sl=" + sl
				+ ", je=" + je + ", cgDate=" + cgDate + ", memo=" + memo + "]";
	}


	public String getid() {
		return id;
	}


	public void setid(String id) {
		this.id = id;
	}


	public String getSpid() {
		return spid;
	}


	public void setSpid(String spid) {
		this.spid = spid;
	}


	public String getDj() {
		return dj;
	}


	public void setDj(String dj) {
		this.dj = dj;
	}


	public String getSl() {
		return sl;
	}


	public void setSl(String sl) {
		this.sl = sl;
	}


	public String getJe() {
		return je;
	}


	public void setJe(String je) {
		this.je = je;
	}


	public Date getCgDate() {
		return cgDate;
	}


	public void setCgDate(Date cgDate) {
		this.cgDate = cgDate;
	}


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public CG() {
		super();
	}


	@Override
	public int compareTo(CG o) {
		// TODO Auto-generated method stub
		return 0;
	}



	
}


