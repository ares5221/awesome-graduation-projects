package com.wy.form;

import org.apache.struts.action.ActionForm;

public class DepartmentForm extends ActionForm{

	private String id="";
	private String dt_name="";
	private String dt_createTime="";
	private String dt_bz="нч";
	public String getDt_bz() {
		return dt_bz;
	}
	public void setDt_bz(String dt_bz) {
		this.dt_bz = dt_bz;
	}
	public String getDt_createTime() {
		return dt_createTime;
	}
	public void setDt_createTime(String dt_createTime) {
		this.dt_createTime = dt_createTime;
	}
	public String getDt_name() {
		return dt_name;
	}
	public void setDt_name(String dt_name) {
		this.dt_name = dt_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
