package com.bjsxt.entity;
/**
 * 出版
 * @author Administrator
 *
 */
public class Publishing {
	private String ISBN;       //国际标准图书编号         
	private String   publish ;//刊印
	public Publishing(String ISBN, String publish) {
		super();
		this.ISBN = ISBN;
		this.publish = publish;
	}
	public Publishing() {
		super();
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		this.ISBN = iSBN;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	@Override
	public String toString() {
		return "Publishing [ISBN=" + ISBN + ", publish=" + publish + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ISBN == null) ? 0 : ISBN.hashCode());
		result = prime * result + ((publish == null) ? 0 : publish.hashCode());
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
		Publishing other = (Publishing) obj;
		if (ISBN == null) {
			if (other.ISBN != null)
				return false;
		} else if (!ISBN.equals(other.ISBN))
			return false;
		if (publish == null) {
			if (other.publish != null)
				return false;
		} else if (!publish.equals(other.publish))
			return false;
		return true;
	} 
	
}
