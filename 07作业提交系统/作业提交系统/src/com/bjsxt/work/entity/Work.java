/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 李军伟
 * @function: 作业实体
 * @date: 2017年8月31日
 */
public class Work implements Serializable, Comparable<Work>{

	private static final long serialVersionUID = -2716022389690129305L;
	
	private Integer hid;  //作业编号
	private String hname; //名称
	private String content; // 详细内容
	private Date releaseTime;//发布时间
	
	public Work() {
		super();
	}
	
	public Work(String hname, Date releaseTime) {
		this.hname = hname;
		this.releaseTime = releaseTime;
	}
	
	public Work(Integer hid, String hname, Date releaseTime) {
		this(hname, releaseTime);
		this.hid = hid;
	}

	public Work(Integer hid, String hname) {
		this.hid = hid;
		this.hname = hname;
	}

	public Work(int hid) {
		this.hid = hid;
	}

	public Work(String hname, String cont) {
		this.hname = hname;
		this.content = cont;
	}

	public Work(int hid, String hname, String content, Date releaseTime) {
		this(hid, hname, releaseTime);
		this.content = content;
	}

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}

	@Override
	public String toString() {
		return "Work [hid=" + hid + ", hname=" + hname + ", content=" + content + ", releaseTime=" + releaseTime + "]";
	}

	@Override
	public int compareTo(Work o) {
		return this.hid - o.hid;
	}
	
	
}
