/**
 * @author Administrator
 * @date 2017年8月15日
 */
package com.hd.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Administrator
 * 公告的实体类
 */
public class NoticeInfo implements Serializable{
	private int notice_id;
	private int user_id;
	private String notice_item;
	private String notice_content;
	private Date notice_time;
	private Date notice_endtime;
	private String is_used;
	private String user_name;
	private UserInfo ui;
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public UserInfo getUi() {
		return ui;
	}
	public void setUi(UserInfo ui) {
		this.ui = ui;
	}
	public NoticeInfo() {
		super();
	}
	public NoticeInfo(int notice_id, int user_id, String notice_item,
			String notice_content, Date notice_time, Date notice_endtime,
			String is_used) {
		super();
		this.notice_id = notice_id;
		this.user_id = user_id;
		this.notice_item = notice_item;
		this.notice_content = notice_content;
		this.notice_time = notice_time;
		this.notice_endtime = notice_endtime;
		this.is_used = is_used;
	}
	public NoticeInfo(int user_id2, String notice_item2,
			String notice_content2, java.sql.Date notice_time2,
			java.sql.Date notice_endtime2) {
		super();
		this.user_id = user_id2;
		this.notice_item = notice_item2;
		this.notice_content = notice_content2;
		this.notice_time = notice_time2;
		this.notice_endtime = notice_endtime2;
		
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getNotice_item() {
		return notice_item;
	}
	public void setNotice_item(String notice_item) {
		this.notice_item = notice_item;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(Date notice_time) {
		this.notice_time = notice_time;
	}
	public Date getNotice_endtime() {
		return notice_endtime;
	}
	public void setNotice_endtime(Date notice_endtime) {
		this.notice_endtime = notice_endtime;
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
		result = prime * result
				+ ((notice_content == null) ? 0 : notice_content.hashCode());
		result = prime * result
				+ ((notice_endtime == null) ? 0 : notice_endtime.hashCode());
		result = prime * result + notice_id;
		result = prime * result
				+ ((notice_item == null) ? 0 : notice_item.hashCode());
		result = prime * result
				+ ((notice_time == null) ? 0 : notice_time.hashCode());
		result = prime * result + ((ui == null) ? 0 : ui.hashCode());
		result = prime * result + user_id;
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
		NoticeInfo other = (NoticeInfo) obj;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (notice_content == null) {
			if (other.notice_content != null)
				return false;
		} else if (!notice_content.equals(other.notice_content))
			return false;
		if (notice_endtime == null) {
			if (other.notice_endtime != null)
				return false;
		} else if (!notice_endtime.equals(other.notice_endtime))
			return false;
		if (notice_id != other.notice_id)
			return false;
		if (notice_item == null) {
			if (other.notice_item != null)
				return false;
		} else if (!notice_item.equals(other.notice_item))
			return false;
		if (notice_time == null) {
			if (other.notice_time != null)
				return false;
		} else if (!notice_time.equals(other.notice_time))
			return false;
		if (ui == null) {
			if (other.ui != null)
				return false;
		} else if (!ui.equals(other.ui))
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "NoticeInfo [notice_id=" + notice_id + ", user_id=" + user_id
				+ ", notice_item=" + notice_item + ", notice_content="
				+ notice_content + ", notice_time=" + notice_time
				+ ", notice_endtime=" + notice_endtime + ", is_used=" + is_used
				+ ", ui=" + ui + "]";
	}
	
	
	
}
