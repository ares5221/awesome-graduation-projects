package com.bjsxt.school.entity;

import java.util.Date;

public class Teacher {

	private String tno;
	private String tname;
	private String mno;
	private String sex;
	private int age;
	private String nation; // 民族
	private String politics; // 政治面貌
	private String education; // 学历
	private String marital; // 婚否
	private Date birth;
	private String idCard;
	private String phone;
	private Date workDate;
	private String jobDesc;

	public Teacher(String tname, String mno, String sex, int age,
			String nation, String politics, String education, String marital,
			Date birth, String idCard, String phone, Date workDate,
			String jobDesc) {
		super();
		this.tname = tname;
		this.mno = mno;
		this.sex = sex;
		this.age = age;
		this.nation = nation;
		this.politics = politics;
		this.education = education;
		this.marital = marital;
		this.birth = birth;
		this.idCard = idCard;
		this.phone = phone;
		this.workDate = workDate;
		this.jobDesc = jobDesc;
	}

	public Teacher(String tno, String tname, String mno, String sex, int age,
			String nation, String politics, String education, String marital,
			Date birth, String idCard, String phone, Date workDate,
			String jobDesc) {
		super();
		this.tno = tno;
		this.tname = tname;
		this.mno = mno;
		this.sex = sex;
		this.age = age;
		this.nation = nation;
		this.politics = politics;
		this.education = education;
		this.marital = marital;
		this.birth = birth;
		this.idCard = idCard;
		this.phone = phone;
		this.workDate = workDate;
		this.jobDesc = jobDesc;
	}

	public Teacher() {
		super();
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPolitics() {
		return politics;
	}

	public void setPolitics(String politics) {
		this.politics = politics;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getMarital() {
		return marital;
	}

	public void setMarital(String marital) {
		this.marital = marital;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	@Override
	public String toString() {
		return "Teacher [tno=" + tno + ", tname=" + tname + ", mno=" + mno
				+ ", sex=" + sex + ", age=" + age + ", nation=" + nation
				+ ", politics=" + politics + ", education=" + education
				+ ", marital=" + marital + ", birth=" + birth + ", idCard="
				+ idCard + ", phone=" + phone + ", workDate=" + workDate
				+ ", jobDesc=" + jobDesc + "]";
	}

	
}
