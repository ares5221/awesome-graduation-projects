/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 李军伟
 * @function: 通知实体
 * @date: 2017年8月31日
 */
public class Inform implements Serializable, Comparable<Inform> {

	private static final long serialVersionUID = -6989399992369086366L;

	private Integer iid;
	private String title; // 通知标题
	private String content;// 通知内容
	private Date date; // 发布日期

	public Inform(Integer iid, String content, Date date) {
		super();
		this.iid = iid;
		this.content = content;
		this.date = date;
	}

	public Inform() {
		super();
	}

	// 发布用的
	public Inform(String title, String content, Date date) {
		this.title = title;
		this.content = content;
		this.date = date;
	}

	public Inform(String title, Date date) {
		this.title = title;
		this.date = date;
	}

	public Inform(Integer iid, String title, String content, Date date) {
		this(title, content, date);
		this.iid = iid;
	}

	public Inform(String title, String content) {
		this.title = title;
		this.content = content;
	}

	public Integer getIid() {
		return iid;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Inform [iid=" + iid + ", title=" + title + ", content=" + content + ", date=" + date + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((iid == null) ? 0 : iid.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Inform other = (Inform) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (iid == null) {
			if (other.iid != null)
				return false;
		} else if (!iid.equals(other.iid))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public int compareTo(Inform o) {
		return this.iid - o.iid;
	}

}
