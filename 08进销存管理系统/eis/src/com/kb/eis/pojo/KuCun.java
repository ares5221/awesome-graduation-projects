package com.kb.eis.pojo;

public class KuCun {
	private String id;
	private String spName; //商品名称
	private String jc; //简称
	private String cd;	//产地
	private String gg;	//规格
	private String dw;	//单位
	private double dj;	//单价
	private double xsjg;//售价
	private String spId;//用于判断是否是一个商品		
	private int kcsl;

	public double getXsjg() {
		return xsjg;
	}
	public void setXsjg(double xsjg) {
		this.xsjg = xsjg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}
	public double getDj() {
		return dj;
	}
	public void setDj(double dj) {
		this.dj = dj;
	}
	public String getGg() {
		return gg;
	}
	public void setGg(String gg) {
		this.gg = gg;
	}
	public String getSpId() {
		return spId;
	}
	public void setSpId(String spId) {
		this.spId = spId;
	}
	public int getKcsl() {
		return kcsl;
	}
	public void setKcsl(int kcsl) {
		this.kcsl = kcsl;
	}
	
	public KuCun(String id, String spName, String jc, String cd, String gg,
			String dw, double dj, double xsjg, String spId, int kcsl) {
		super();
		this.id = id;
		this.spName = spName;
		this.jc = jc;
		this.cd = cd;
		this.gg = gg;
		this.dw = dw;
		this.dj = dj;
		this.xsjg = xsjg;
		this.spId = spId;
		this.kcsl = kcsl;
	}
	public KuCun(String spName, String jc, String cd, String dw, double dj,
			String gg, String spId, int kcsl) {
		super();
		this.spName = spName;
		this.jc = jc;
		this.cd = cd;
		this.dw = dw;
		this.dj = dj;
		this.gg = gg;
		this.spId = spId;
		this.kcsl = kcsl;
	}
	@Override
	public String toString() {
		return "KuCun [id=" + id + ", spName=" + spName + ", jc=" + jc
				+ ", cd=" + cd + ", dw=" + dw + ", dj=" + dj + ", gg=" + gg
				+ ", spId=" + spId + ", kcsl=" + kcsl + "]";
	}
	public KuCun() {
		super();
	}
	
}
