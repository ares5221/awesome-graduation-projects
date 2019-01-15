package com.kb.eis.pojo;


public class SPInfo{  //商品信息
	private String spId; //商品编号
	private String spName; //商品名称
	private String jc; //简称
	private String cd;	//产地
	private String dw;	//单位
	private String gg;	//规格
	private String ph;	//批号
	private String memo;	//备注
	private String gysId;	//供应商		
	private String bz;	//包装		
	private String cs;	//厂商	
	
	
	
	public SPInfo() {
		super();
	}
	public SPInfo(String spName, String jc, String cd, String dw, String gg, String ph, String memo, String gysId, String bz, String cs) {
		super();
		this.spName = spName;
		this.jc = jc;
		this.cd = cd;
		this.dw = dw;
		this.gg = gg;
		this.ph = ph;
		this.memo = memo;
		this.gysId = gysId;
		this.bz = bz;
		this.cs = cs;
	}
	public SPInfo(String spId, String spName, String jc, String cd, String dw, String gg, String ph, String memo, String gysId, String bz, String cs) {
		super();
		this.spId = spId;
		this.spName = spName;
		this.jc = jc;
		this.cd = cd;
		this.dw = dw;
		this.gg = gg;
		this.ph = ph;
		this.memo = memo;
		this.gysId = gysId;
		this.bz = bz;
		this.cs = cs;
	}
	public String getSpId() {
		return spId;
	}
	public void setSpId(String spId) {
		this.spId = spId;
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
	public String getGg() {
		return gg;
	}
	public void setGg(String gg) {
		this.gg = gg;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getGysId() {
		return gysId;
	}
	public void setGysId(String gysId) {
		this.gysId = gysId;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getCs() {
		return cs;
	}
	public void setCs(String cs) {
		this.cs = cs;
	}
	@Override
	public String toString() {
		return "SPInfo [spId=" + spId + ", spName=" + spName + ", jc=" + jc + ", cd=" + cd + ", dw=" + dw + ", gg=" + gg + ", ph=" + ph + ", memo=" + memo + ", gysId=" + gysId + ", bz=" + bz + ", cs=" + cs + "]";
	}

	
	
	
}
