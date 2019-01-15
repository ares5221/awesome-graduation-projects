/**
 * 
 */
package com.bjsxt.work.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 李军伟
 * @function: 作业提交记录表
 * @date: 2017年8月31日
 */
public class Record implements Serializable, Comparable<Record> {

	private static final long serialVersionUID = 6181018176944119210L;

	private Integer rid;
	private Date submitTime;
	private String fileName;
	
	// 注入学生id和作业id
	private Integer sid;
	private Integer hid;
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public Record() {
		super();
	}
	
	public Record(Date submitTime) {
		super();
		this.submitTime = submitTime;
	}

	public Record(Date submitTime, String fileName) {
		this.submitTime = submitTime;
		this.fileName = fileName;
	}

	public Record(Integer rid, Date submitTime, String fileName) {
		this(submitTime, fileName);
		this.rid = rid;
	}

	// 向记录表中添加数据
	public Record(int rid, int sid, int hid, java.sql.Date submitTime, String fileName) {
		this(rid, submitTime, fileName);
		this.sid = sid;
		this.hid = hid;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Date getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Record [rid=" + rid + ", submitTime=" + submitTime + ", fileName=" + fileName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((rid == null) ? 0 : rid.hashCode());
		result = prime * result + ((submitTime == null) ? 0 : submitTime.hashCode());
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
		Record other = (Record) obj;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (rid == null) {
			if (other.rid != null)
				return false;
		} else if (!rid.equals(other.rid))
			return false;
		if (submitTime == null) {
			if (other.submitTime != null)
				return false;
		} else if (!submitTime.equals(other.submitTime))
			return false;
		return true;
	}

	@Override
	public int compareTo(Record o) {
		return this.rid - o.rid;
	}

}
