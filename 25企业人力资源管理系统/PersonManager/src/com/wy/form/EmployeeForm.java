package com.wy.form;

import org.apache.struts.action.ActionForm;

public class EmployeeForm extends ActionForm {
	private String id = null;

	private String em_serialNumber = "";

	private String em_name = "";

	private String em_sex = "男";
	
	private String em_age="";

	private String em_IDCard = "";

	private String em_born = "";

	private String em_nation = "汉";

	private String em_marriage = "未婚";

	private String em_visage = "无";

	private String em_ancestralHome = "";

	private String em_tel = "";

	private String em_address = "";

	private String em_afterschool = "";

	private String em_speciality = "";

	private String em_culture = "本科生";

	private String em_startime = "";

	private String em_departmentId = "";

	private String em_typework = "程序员";

	private String em_creatime = "";
	
	private String em_createName=null;
	
	private String em_bz="无";

	public String getEm_bz() {
		return em_bz.trim();
	}

	public void setEm_bz(String em_bz) {
		this.em_bz = em_bz;
	}

	public String getEm_address() {
		return em_address.trim();
	}

	public void setEm_address(String em_address) {
		this.em_address = em_address;
	}

	public String getEm_afterschool() {
		return em_afterschool.trim();
	}

	public void setEm_afterschool(String em_afterschool) {
		this.em_afterschool = em_afterschool;
	}

	public String getEm_ancestralHome() {
		return em_ancestralHome.trim();
	}

	public void setEm_ancestralHome(String em_ancestralHome) {
		this.em_ancestralHome = em_ancestralHome;
	}

	public String getEm_born() {
		return em_born.trim();
	}

	public void setEm_born(String em_born) {
		this.em_born = em_born;
	}

	public String getEm_creatime() {
		return em_creatime.trim();
	}

	public void setEm_creatime(String em_creatime) {
		this.em_creatime = em_creatime;
	}

	public String getEm_culture() {
		return em_culture.trim();
	}

	public void setEm_culture(String em_culture) {
		this.em_culture = em_culture;
	}

	public String getEm_departmentId() {
		return em_departmentId.trim();
	}

	public void setEm_departmentId(String em_departmentId) {
		this.em_departmentId = em_departmentId;
	}

	public String getEm_IDCard() {
		return em_IDCard.trim();
	}

	public void setEm_IDCard(String em_IDCard) {
		this.em_IDCard = em_IDCard;
	}

	public String getEm_marriage() {
		return em_marriage.trim();
	}

	public void setEm_marriage(String em_marriage) {
		this.em_marriage = em_marriage;
	}

	public String getEm_name() {
		return em_name.trim();
	}

	public void setEm_name(String em_name) {
		this.em_name = em_name;
	}

	public String getEm_nation() {
		return em_nation.trim();
	}

	public void setEm_nation(String em_nation) {
		this.em_nation = em_nation;
	}

	public String getEm_serialNumber() {
		return em_serialNumber.trim();
	}

	public void setEm_serialNumber(String em_serialNumber) {
		this.em_serialNumber = em_serialNumber;
	}

	public String getEm_sex() {
		return em_sex.trim();
	}

	public void setEm_sex(String em_sex) {
		this.em_sex = em_sex;
	}

	public String getEm_speciality() {
		return em_speciality.trim();
	}

	public void setEm_speciality(String em_speciality) {
		this.em_speciality = em_speciality;
	}

	public String getEm_startime() {
		return em_startime.trim();
	}

	public void setEm_startime(String em_startime) {
		this.em_startime = em_startime;
	}

	public String getEm_tel() {
		return em_tel.trim();
	}

	public void setEm_tel(String em_tel) {
		this.em_tel = em_tel;
	}

	public String getEm_typework() {
		return em_typework.trim();
	}

	public void setEm_typework(String em_typework) {
		this.em_typework = em_typework;
	}

	public String getEm_visage() {
		return em_visage.trim();
	}

	public void setEm_visage(String em_visage) {
		this.em_visage = em_visage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEm_createName() {
		return em_createName.trim();
	}

	public void setEm_createName(String em_createName) {
		this.em_createName = em_createName;
	}

	public String getEm_age() {
		return em_age.trim();
	}

	public void setEm_age(String em_age) {
		this.em_age = em_age;
	}

}
