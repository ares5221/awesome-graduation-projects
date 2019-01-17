package com.wy.form;

import org.apache.struts.action.ActionForm;

public class PayForm extends ActionForm {
	private String id = "";

	private String pay_emNumber = "";

	private String pay_emName = "";

	private String pay_month = "";

	private int pay_baseMoney = 0;

	private Integer pay_overtime = 0;

	private Integer pay_age = 0;

	private Integer pay_check = 100;

	private Integer pay_absent = 0;

	private Integer pay_safety = 128;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getPay_absent() {
		return pay_absent;
	}

	public void setPay_absent(Integer pay_absent) {
		this.pay_absent = pay_absent;
	}

	public Integer getPay_age() {
		return pay_age;
	}

	public void setPay_age(Integer pay_age) {
		this.pay_age = pay_age;
	}

	public int getPay_baseMoney() {
		return pay_baseMoney;
	}

	public void setPay_baseMoney(int pay_baseMoney) {
		this.pay_baseMoney = pay_baseMoney;
	}

	public Integer getPay_check() {
		return pay_check;
	}

	public void setPay_check(Integer pay_check) {
		this.pay_check = pay_check;
	}

	public String getPay_emName() {
		return pay_emName;
	}

	public void setPay_emName(String pay_emName) {
		this.pay_emName = pay_emName;
	}

	public String getPay_emNumber() {
		return pay_emNumber;
	}

	public void setPay_emNumber(String pay_emNumber) {
		this.pay_emNumber = pay_emNumber;
	}

	public String getPay_month() {
		return pay_month;
	}

	public void setPay_month(String pay_month) {
		this.pay_month = pay_month;
	}

	public Integer getPay_overtime() {
		return pay_overtime;
	}

	public void setPay_overtime(Integer pay_overtime) {
		this.pay_overtime = pay_overtime;
	}

	public Integer getPay_safety() {
		return pay_safety;
	}

	public void setPay_safety(Integer pay_safety) {
		this.pay_safety = pay_safety;
	}



}
