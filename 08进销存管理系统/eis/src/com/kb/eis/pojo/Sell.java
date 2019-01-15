package com.kb.eis.pojo;

import java.sql.Date;

public class Sell {
	private String sellId;
	private double xsje;
	private double ysje;
	private String khname;
	private Date xsDate;
	private String czy;
	private String jsr;
	private String jsfs;
	private String spName;
	private double xsdj;
	private int xssl;
	private double wsje;
	
	
	public Sell() {
		super();
	}
	
	public Sell(double xsje, double ysje, String khname,
			String czy, String jsr, String jsfs, String spName,
			double xsdj, int xssl, double wsje) {
		super();
		this.xsje = xsje;
		this.ysje = ysje;
		this.khname = khname;
		this.czy = czy;
		this.jsr = jsr;
		this.jsfs = jsfs;
		this.spName = spName;
		this.xsdj = xsdj;
		this.xssl = xssl;
		this.wsje = wsje;
	}
	public Sell(String sellId, double xsje, double ysje, String khname,
			Date xsDate, String czy, String jsr, String jsfs,
			String spName, double xsdj, int xssl, double wsje) {
		super();
		this.sellId = sellId;
		this.xsje = xsje;
		this.ysje = ysje;
		this.khname = khname;
		this.xsDate = xsDate;
		this.czy = czy;
		this.jsr = jsr;
		this.jsfs = jsfs;
		this.spName = spName;
		this.xsdj = xsdj;
		this.xssl = xssl;
		this.wsje = wsje;
	}
	public String getSellId() {
		return sellId;
	}
	public void setSellId(String sellId) {
		this.sellId = sellId;
	}
	public double getXsje() {
		return xsje;
	}
	public void setXsje(double xsje) {
		this.xsje = xsje;
	}
	public double getYsje() {
		return ysje;
	}
	public void setYsje(double ysje) {
		this.ysje = ysje;
	}
	public String getKhname() {
		return khname;
	}
	public void setKhname(String khname) {
		this.khname = khname;
	}
	public Date getXsDate() {
		return xsDate;
	}
	public void setXsDate(Date xsDate) {
		this.xsDate = xsDate;
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
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public double getXsdj() {
		return xsdj;
	}
	public void setXsdj(double xsdj) {
		this.xsdj = xsdj;
	}
	public int getXssl() {
		return xssl;
	}
	public void setXssl(int xssl) {
		this.xssl = xssl;
	}
	public double getWsje() {
		return wsje;
	}
	public void setWsje(double wsje) {
		this.wsje = wsje;
	}
	@Override
	public String toString() {
		return "Sell [sellId=" + sellId + ", xsje=" + xsje + ", ysje=" + ysje
				+ ", khname=" + khname + ", xsDate=" + xsDate + ", czy=" + czy
				+ ", jsr=" + jsr + ", jsfs=" + jsfs + ", spName=" + spName
				+ ", xsdj=" + xsdj + ", xssl=" + xssl + ", wsje=" + wsje + "]";
	}

	

}
