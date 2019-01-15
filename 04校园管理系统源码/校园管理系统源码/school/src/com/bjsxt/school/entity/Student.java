package com.bjsxt.school.entity;

import java.util.Date;

public class Student {

	private String sid;     
	private String sname;   
	private String sex;  
	private int age;
	private String idCard;
	private Date birth;
	private String address;
	private String phone;
	private String politics;  //政治面貌
	private String health;    //健康状况
	
	private String classId;
	private Date checkDate;
	private double enterScore;
	private String majorName;
	private String operator;
	
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public double getEnterScore() {
		return enterScore;
	}
	public void setEnterScore(double enterScore) {
		this.enterScore = enterScore;
	}
	public String getmajorName() {
		return majorName;
	}
	public void setmajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
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
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPolitics() {
		return politics;
	}
	public void setPolitics(String politics) {
		this.politics = politics;
	}
	public String getHealth() {
		return health;
	}
	public void setHealth(String health) {
		this.health = health;
	}
	public Student(String sid, String sname, String sex, int age,
			String idCard, Date birth, String address, String phone,
			String politics, String health) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sex = sex;
		this.age = age;
		this.idCard = idCard;
		this.birth = birth;
		this.address = address;
		this.phone = phone;
		this.politics = politics;
		this.health = health;
	}
	
	
	public Student(String sid, String sname, String classId, Date checkDate,
			double enterScore, String majorName, String operator) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.classId = classId;
		this.checkDate = checkDate;
		this.enterScore = enterScore;
		this.majorName = majorName;
		this.operator = operator;
	}
	public Student() {
		super();
	}
	
	
	
	
}
