package com.wy.form;

import org.apache.struts.action.ActionForm;

public class CjForm extends ActionForm{
	private String id="";
	private String cj_title="";
	private String cj_type="";
	private String cj_content="";
	private String cj_money="0";
	private String cj_time="";
	public String getCj_content() {
		return cj_content;
	}
	public void setCj_content(String cj_content) {
		this.cj_content = cj_content;
	}
	public String getCj_money() {
		return cj_money;
	}
	public void setCj_money(String cj_money) {
		this.cj_money = cj_money;
	}
	public String getCj_time() {
		return cj_time;
	}
	public void setCj_time(String cj_time) {
		this.cj_time = cj_time;
	}
	public String getCj_title() {
		return cj_title;
	}
	public void setCj_title(String cj_title) {
		this.cj_title = cj_title;
	}
	public String getCj_type() {
		return cj_type;
	}
	public void setCj_type(String cj_type) {
		this.cj_type = cj_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
