package com.bjsxt.crm.entity;

import java.io.Serializable;
import java.sql.Date;
/**
 * 公告实体类
 * @author Administrator
 *
 */
public class Notice implements Comparable<Notice>,Serializable{
     private int notice_ID; 			//公告编号  		
     private int user_ID;	  			//公告人   		
     private String notice_item;    	//公告主题
     private String notice_content;		//公告内容			
     private Date notice_time;			//公告时间	
     private Date notice_endtime;		//公告截止时间	
     private String is_used;			//鬼知道是啥		
	@Override
	public String toString() {
		return "Notice [notice_ID=" + notice_ID + ", user_ID=" + user_ID
				+ ", notice_item=" + notice_item + ", notice_content="
				+ notice_content + ", notice_time=" + notice_time
				+ ", notice_endtime=" + notice_endtime + ", is_used=" + is_used
				+ "]";
	}
	public int getNotice_ID() {
		return notice_ID;
	}
	public void setNotice_ID(int notice_ID) {
		this.notice_ID = notice_ID;
	}
	public int getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(int user_ID) {
		this.user_ID = user_ID;
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
	public Notice(int notice_ID, int user_ID, String notice_item,
			String notice_content, Date notice_time, Date notice_endtime,
			String is_used) {
		super();
		this.notice_ID = notice_ID;
		this.user_ID = user_ID;
		this.notice_item = notice_item;
		this.notice_content = notice_content;
		this.notice_time = notice_time;
		this.notice_endtime = notice_endtime;
		this.is_used = is_used;
	}
	public Notice(int user_ID, String notice_item, String notice_content,
			Date notice_time, Date notice_endtime, String is_used) {
		super();
		this.user_ID = user_ID;
		this.notice_item = notice_item;
		this.notice_content = notice_content;
		this.notice_time = notice_time;
		this.notice_endtime = notice_endtime;
		this.is_used = is_used;
	}
	public Notice() {
		super();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((is_used == null) ? 0 : is_used.hashCode());
		result = prime * result + notice_ID;
		result = prime * result
				+ ((notice_content == null) ? 0 : notice_content.hashCode());
		result = prime * result
				+ ((notice_endtime == null) ? 0 : notice_endtime.hashCode());
		result = prime * result
				+ ((notice_item == null) ? 0 : notice_item.hashCode());
		result = prime * result
				+ ((notice_time == null) ? 0 : notice_time.hashCode());
		result = prime * result + user_ID;
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
		Notice other = (Notice) obj;
		if (is_used == null) {
			if (other.is_used != null)
				return false;
		} else if (!is_used.equals(other.is_used))
			return false;
		if (notice_ID != other.notice_ID)
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
		if (user_ID != other.user_ID)
			return false;
		return true;
	}
	@Override
	public int compareTo(Notice o) {
		return this.notice_ID-o.notice_ID;
	}

	
	
	
	
}
