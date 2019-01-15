package com.kb.eis.pojo;


public class Pojo {
	private CG cg = null;
	private GYS gys = null;
	private KhInfo khInfo = null;
	private RuKu ruku = null;
	private SPInfo spInfo = null;
	private Stock stock = null;
	private Sell sell = null;
	private KuCun kuCun = null;
	
	
	public CG getCg() {
		return cg;
	}
	@Override
	public String toString() {
		return "Pojo [cg=" + cg + ", gys=" + gys + ", khInfo=" + khInfo
				+ ", ruku=" + ruku + ", spInfo=" + spInfo + ", stock=" + stock
				+ "]";
	}
	public void setCg(CG cg) {
		this.cg = cg;
	}
	public GYS getGys() {
		return gys;
	}
	public void setGys(GYS gys) {
		this.gys = gys;
	}
	public KhInfo getKhInfo() {
		return khInfo;
	}
	public void setKhInfo(KhInfo khInfo) {
		this.khInfo = khInfo;
	}
	public RuKu getRuku() {
		return ruku;
	}
	public void setRuku(RuKu ruku) {
		this.ruku = ruku;
	}
	public SPInfo getSpInfo() {
		return spInfo;
	}
	public void setSpInfo(SPInfo spInfo) {
		this.spInfo = spInfo;
	}
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}
	public Sell getSell() {
		return sell;
	}
	public void setSell(Sell sell) {
		this.sell = sell;
	}
	public KuCun getKuCun() {
		return kuCun;
	}
	public void setKuCun(KuCun kuCun) {
		this.kuCun = kuCun;
	}
	
}
