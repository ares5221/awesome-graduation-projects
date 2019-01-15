package com.hd.entity;

import java.util.Date;

/**
 * 客户联系实体类
 * 
 * @author wmy
 * @day 2017年8月17日
 * @time 下午6:09:21
 * 
 */
public class CustomerLinkReord {

	private int record_id;
	private int customer_id;
	private Date link_time;
	private String who_link;
	private String link_type;
	private String link_theme;
	private Date link_nexttime;
	private String link_remark;
	private String is_used;
	
	private String customer_name;
	
	public CustomerLinkReord(int record_id, int customer_id, Date link_time,
			String who_link, String link_type, String link_theme,
			Date link_nexttime, String link_remark, String is_used) {
		super();
		this.record_id = record_id;
		this.customer_id = customer_id;
		this.link_time = link_time;
		this.who_link = who_link;
		this.link_type = link_type;
		this.link_theme = link_theme;
		this.link_nexttime = link_nexttime;
		this.link_remark = link_remark;
		this.is_used = is_used;
	}

	public CustomerLinkReord() {
		super();
	}
	
	
	
	
	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public int getRecord_id() {
		return record_id;
	}

	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public Date getLink_time() {
		return link_time;
	}

	public void setLink_time(Date link_time) {
		this.link_time = link_time;
	}

	public String getWho_link() {
		return who_link;
	}

	public void setWho_link(String who_link) {
		this.who_link = who_link;
	}

	public String getLink_type() {
		return link_type;
	}

	public void setLink_type(String link_type) {
		this.link_type = link_type;
	}

	public String getLink_theme() {
		return link_theme;
	}

	public void setLink_theme(String link_theme) {
		this.link_theme = link_theme;
	}

	public Date getLink_nexttime() {
		return link_nexttime;
	}

	public void setLink_nexttime(Date link_nexttime) {
		this.link_nexttime = link_nexttime;
	}

	public String getLink_remark() {
		return link_remark;
	}

	public void setLink_remark(String link_remark) {
		this.link_remark = link_remark;
	}

	public String getIs_used() {
		return is_used;
	}

	public void setIs_used(String is_used) {
		this.is_used = is_used;
	}

	@Override
	public String toString() {
		return "CustomerLinkReord [record_id=" + record_id + ", customer_id="
				+ customer_id + ", link_time=" + link_time + ", who_link="
				+ who_link + ", link_type=" + link_type + ", link_theme="
				+ link_theme + ", link_nexttime=" + link_nexttime
				+ ", link_remark=" + link_remark + ", is_used=" + is_used + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + customer_id;
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result
				+ ((link_nexttime == null) ? 0 : link_nexttime.hashCode());
		result = prime * result
				+ ((link_remark == null) ? 0 : link_remark.hashCode());
		result = prime * result
				+ ((link_theme == null) ? 0 : link_theme.hashCode());
		result = prime * result
				+ ((link_time == null) ? 0 : link_time.hashCode());
		result = prime * result
				+ ((link_type == null) ? 0 : link_type.hashCode());
		result = prime * result + record_id;
		result = prime * result
				+ ((who_link == null) ? 0 : who_link.hashCode());
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
		CustomerLinkReord other = (CustomerLinkReord) obj;
		if (customer_id != other.customer_id)
			return false;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (link_nexttime == null) {
			if (other.link_nexttime != null)
				return false;
		} else if (!link_nexttime.equals(other.link_nexttime))
			return false;
		if (link_remark == null) {
			if (other.link_remark != null)
				return false;
		} else if (!link_remark.equals(other.link_remark))
			return false;
		if (link_theme == null) {
			if (other.link_theme != null)
				return false;
		} else if (!link_theme.equals(other.link_theme))
			return false;
		if (link_time == null) {
			if (other.link_time != null)
				return false;
		} else if (!link_time.equals(other.link_time))
			return false;
		if (link_type == null) {
			if (other.link_type != null)
				return false;
		} else if (!link_type.equals(other.link_type))
			return false;
		if (record_id != other.record_id)
			return false;
		if (who_link == null) {
			if (other.who_link != null)
				return false;
		} else if (!who_link.equals(other.who_link))
			return false;
		return true;
	}

}
