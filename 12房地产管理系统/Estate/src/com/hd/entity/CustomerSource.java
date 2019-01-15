package com.hd.entity;

import java.io.Serializable;

/**
 * 客户来源实体类
 * 
 * @author wmy
 * @day 2017年8月9日
 * @time 下午5:15:16
 * 
 */
public class CustomerSource implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 440534642666038522L;
	/**
	 * 来源id
	 */
	private int source_id;
	/**
	 * 来源名称
	 */
	private String source_name;
	/**
	 * 是否激活
	 */
	private String is_used;

	public CustomerSource() {
		super();
	}

	public CustomerSource(int source_id, String source_name, String is_used) {
		super();
		this.source_id = source_id;
		this.source_name = source_name;
		this.is_used = is_used;
	}

	public int getSource_id() {
		return source_id;
	}

	public void setSource_id(int source_id) {
		this.source_id = source_id;
	}

	public String getSource_name() {
		return source_name;
	}

	public void setSource_name(String source_name) {
		this.source_name = source_name;
	}

	public String getIs_used() {
		return is_used;
	}

	public void setIs_used(String is_used) {
		this.is_used = is_used;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result + source_id;
		result = prime * result
				+ ((source_name == null) ? 0 : source_name.hashCode());
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
		CustomerSource other = (CustomerSource) obj;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (source_id != other.source_id)
			return false;
		if (source_name == null) {
			if (other.source_name != null)
				return false;
		} else if (!source_name.equals(other.source_name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Customer_Source [source_id=" + source_id + ", source_name="
				+ source_name + ", is_used=" + is_used + "]";
	}

}
