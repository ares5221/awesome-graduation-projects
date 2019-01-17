package com.wy.form;

import org.apache.struts.action.ActionForm;

public class TrainForm extends ActionForm{
	private String id="";
	private String tn_man="";
	private String tn_title="";
	private String tn_content="";
	private String tn_time="";
	private String tn_address="";
	private String tn_join="";
	private String tn_bz="";
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTn_address() {
		return tn_address;
	}
	public void setTn_address(String tn_address) {
		this.tn_address = tn_address;
	}
	public String getTn_bz() {
		return tn_bz;
	}
	public void setTn_bz(String tn_bz) {
		this.tn_bz = tn_bz;
	}
	public String getTn_content() {
		return tn_content;
	}
	public void setTn_content(String tn_content) {
		this.tn_content = tn_content;
	}
	public String getTn_join() {
		return tn_join;
	}
	public void setTn_join(String tn_join) {
		this.tn_join = tn_join;
	}
	public String getTn_man() {
		return tn_man;
	}
	public void setTn_man(String tn_man) {
		this.tn_man = tn_man;
	}
	public String getTn_time() {
		return tn_time;
	}
	public void setTn_time(String tn_time) {
		this.tn_time = tn_time;
	}
	public String getTn_title() {
		return tn_title;
	}
	public void setTn_title(String tn_title) {
		this.tn_title = tn_title;
	}
	
	
}
