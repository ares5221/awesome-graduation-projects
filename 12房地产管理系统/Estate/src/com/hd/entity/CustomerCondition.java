package com.hd.entity;

import java.io.Serializable;

/**
 * 客户状态实体类
 * 
 * @author wmy
 * @day 2017年8月9日
 * @time 下午5:10:48
 * 
 */
public class CustomerCondition implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -513330310934732657L;
	/**
	 * 状态id
	 */
	private int condition_id;
	/**
	 * 状态名称
	 */
	private String condition_name;
	/**
	 * 状态描述
	 */
	private String condition_explain;
	/**
	 * 是否激活
	 */
	private String is_used;

	public CustomerCondition() {
		super();
	}

	public CustomerCondition(int condition_id, String condition_name,
			String condition_explain, String is_used) {
		super();
		this.condition_id = condition_id;
		this.condition_name = condition_name;
		this.condition_explain = condition_explain;
		this.is_used = is_used;
	}

	public int getCondition_id() {
		return condition_id;
	}

	public void setCondition_id(int condition_id) {
		this.condition_id = condition_id;
	}

	public String getCondition_name() {
		return condition_name;
	}

	public void setCondition_name(String condition_name) {
		this.condition_name = condition_name;
	}

	public String getCondition_explain() {
		return condition_explain;
	}

	public void setCondition_explain(String condition_explain) {
		this.condition_explain = condition_explain;
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
		result = prime
				* result
				+ ((condition_explain == null) ? 0 : condition_explain
						.hashCode());
		result = prime * result + condition_id;
		result = prime * result
				+ ((condition_name == null) ? 0 : condition_name.hashCode());
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
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
		CustomerCondition other = (CustomerCondition) obj;
		if (condition_explain == null) {
			if (other.condition_explain != null)
				return false;
		} else if (!condition_explain.equals(other.condition_explain))
			return false;
		if (condition_id != other.condition_id)
			return false;
		if (condition_name == null) {
			if (other.condition_name != null)
				return false;
		} else if (!condition_name.equals(other.condition_name))
			return false;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Customer_Condition [condition_id=" + condition_id
				+ ", condition_name=" + condition_name + ", condition_explain="
				+ condition_explain + ", is_used=" + is_used + "]";
	}

}
