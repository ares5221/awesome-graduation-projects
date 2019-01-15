package com.kb.eis.pojo;

public class Stock {
	/**
	 * 库存类
	 * @author fcc
	 */
	private String id; //库存品id
	private String spName; //商品名称
	private String jc; //简称
	private String cd; //产地
	private String gg; //规格
	private String bz; //包装
	private String dw; //单位
	private double dj; //单价
	private int kcsl; //库存数量
	
	
	public Stock() {
		super();
	}

	public Stock(String id, String spName, String jc, String cd, String gg,
			String bz, String dw, double dj, int kcsl) {
		super();
		this.id = id;
		this.spName = spName;
		this.jc = jc;
		this.cd = cd;
		this.gg = gg;
		this.bz = bz;
		this.dw = dw;
		this.dj = dj;
		this.kcsl = kcsl;
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

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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

	public int getKcsl() {
		return kcsl;
	}

	public void setKcsl(int kcsl) {
		this.kcsl = kcsl;
	}

	@Override
	public String toString() {
		return "Stock [id=" + id + ", spName=" + spName + ", jc=" + jc
				+ ", cd=" + cd + ", gg=" + gg + ", bz=" + bz + ", dw=" + dw
				+ ", dj=" + dj + ", kcsl=" + kcsl + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bz == null) ? 0 : bz.hashCode());
		result = prime * result + ((cd == null) ? 0 : cd.hashCode());
		long temp;
		temp = Double.doubleToLongBits(dj);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((dw == null) ? 0 : dw.hashCode());
		result = prime * result + ((gg == null) ? 0 : gg.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((jc == null) ? 0 : jc.hashCode());
		result = prime * result + kcsl;
		result = prime * result + ((spName == null) ? 0 : spName.hashCode());
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
		Stock other = (Stock) obj;
		if (bz == null) {
			if (other.bz != null)
				return false;
		} else if (!bz.equals(other.bz))
			return false;
		if (cd == null) {
			if (other.cd != null)
				return false;
		} else if (!cd.equals(other.cd))
			return false;
		if (Double.doubleToLongBits(dj) != Double.doubleToLongBits(other.dj))
			return false;
		if (dw == null) {
			if (other.dw != null)
				return false;
		} else if (!dw.equals(other.dw))
			return false;
		if (gg == null) {
			if (other.gg != null)
				return false;
		} else if (!gg.equals(other.gg))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (jc == null) {
			if (other.jc != null)
				return false;
		} else if (!jc.equals(other.jc))
			return false;
		if (kcsl != other.kcsl)
			return false;
		if (spName == null) {
			if (other.spName != null)
				return false;
		} else if (!spName.equals(other.spName))
			return false;
		return true;
	}
	
}
