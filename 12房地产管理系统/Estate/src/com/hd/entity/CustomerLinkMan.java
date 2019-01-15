package com.hd.entity;

/**
 * 联系人实体类
 * 
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:15:02
 * 
 */
public class CustomerLinkMan {
	private int linkman_id;
	private int customer_id;
	private String linkman_name;
	private String linkman_sex;
	private String linkman_job;
	private String linkman_mobile;
	private int linkman_age;
	private String linkman_relation;
	private String is_used;

	public CustomerLinkMan(int linkman_id, int customer_id,
			String linkman_name, String linkman_sex, String linkman_job,
			String linkman_mobile, int linkman_age, String linkman_relation,
			String is_used) {
		super();
		this.linkman_id = linkman_id;
		this.customer_id = customer_id;
		this.linkman_name = linkman_name;
		this.linkman_sex = linkman_sex;
		this.linkman_job = linkman_job;
		this.linkman_mobile = linkman_mobile;
		this.linkman_age = linkman_age;
		this.linkman_relation = linkman_relation;
		this.is_used = is_used;
	}

	public CustomerLinkMan() {
		super();
	}

	public int getLinkman_id() {
		return linkman_id;
	}

	public void setLinkman_id(int linkman_id) {
		this.linkman_id = linkman_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getLinkman_name() {
		return linkman_name;
	}

	public void setLinkman_name(String linkman_name) {
		this.linkman_name = linkman_name;
	}

	public String getLinkman_sex() {
		return linkman_sex;
	}

	public void setLinkman_sex(String linkman_sex) {
		this.linkman_sex = linkman_sex;
	}

	public String getLinkman_job() {
		return linkman_job;
	}

	public void setLinkman_job(String linkman_job) {
		this.linkman_job = linkman_job;
	}

	public String getLinkman_mobile() {
		return linkman_mobile;
	}

	public void setLinkman_mobile(String linkman_mobile) {
		this.linkman_mobile = linkman_mobile;
	}

	public int getLinkman_age() {
		return linkman_age;
	}

	public void setLinkman_age(int linkman_age) {
		this.linkman_age = linkman_age;
	}

	public String getLinkman_relation() {
		return linkman_relation;
	}

	public void setLinkman_relation(String linkman_relation) {
		this.linkman_relation = linkman_relation;
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
		result = prime * result + customer_id;
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result + linkman_age;
		result = prime * result + linkman_id;
		result = prime * result
				+ ((linkman_job == null) ? 0 : linkman_job.hashCode());
		result = prime * result
				+ ((linkman_mobile == null) ? 0 : linkman_mobile.hashCode());
		result = prime * result
				+ ((linkman_name == null) ? 0 : linkman_name.hashCode());
		result = prime
				* result
				+ ((linkman_relation == null) ? 0 : linkman_relation.hashCode());
		result = prime * result
				+ ((linkman_sex == null) ? 0 : linkman_sex.hashCode());
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
		CustomerLinkMan other = (CustomerLinkMan) obj;
		if (customer_id != other.customer_id)
			return false;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (linkman_age != other.linkman_age)
			return false;
		if (linkman_id != other.linkman_id)
			return false;
		if (linkman_job == null) {
			if (other.linkman_job != null)
				return false;
		} else if (!linkman_job.equals(other.linkman_job))
			return false;
		if (linkman_mobile == null) {
			if (other.linkman_mobile != null)
				return false;
		} else if (!linkman_mobile.equals(other.linkman_mobile))
			return false;
		if (linkman_name == null) {
			if (other.linkman_name != null)
				return false;
		} else if (!linkman_name.equals(other.linkman_name))
			return false;
		if (linkman_relation == null) {
			if (other.linkman_relation != null)
				return false;
		} else if (!linkman_relation.equals(other.linkman_relation))
			return false;
		if (linkman_sex == null) {
			if (other.linkman_sex != null)
				return false;
		} else if (!linkman_sex.equals(other.linkman_sex))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CustomerLinkMan [linkman_id=" + linkman_id + ", customer_id="
				+ customer_id + ", linkman_name=" + linkman_name
				+ ", linkman_sex=" + linkman_sex + ", linkman_job="
				+ linkman_job + ", linkman_mobile=" + linkman_mobile
				+ ", linkman_age=" + linkman_age + ", linkman_relation="
				+ linkman_relation + ", is_used=" + is_used + "]";
	}

}
