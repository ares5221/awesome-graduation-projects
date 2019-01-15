package com.bjsxt.entity;

/*
 * 对应着userXML.xml
 */
public class Teacher {
	//对应着老师的id
	private String id;
	//对应着老师的姓名
	private String name;
	//对应着老师的密码
	private String password;
	//对应着老师的密码
	private String age;
	//对应着老师的性别
	private String sex;
	//对应着老师的课程
	private String course;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Teacher(String id, String name, String password, String age, String sex, String course) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.age = age;
		this.sex = sex;
		this.course = course;
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", name=" + name + ", password=" + password + ", age=" + age + ", sex=" + sex
				+ ", course=" + course + "]";
	}
	
	
	
	

}
