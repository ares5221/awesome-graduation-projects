package com.bjsxt.entity;
/*
 * 对应着userXML.xml中的课程数据
 */
import java.util.List;

public class Student {
	//对应着学生的id
	private String ID;
	//对应着学生的姓名
	private String name;
	//对应着学生的密码
	private String password;
	//对应着学生的年纪
	private String age;
	//对应着学生的性别
	private String sex;
	//对应着可选的课程
	private List courseUp;
	//对应着已选课的课程
	private List courseDown;
	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public List getCourseUp() {
		return courseUp;
	}
	public void setCourseUp(List courseUp) {
		this.courseUp = courseUp;
	}
	public List getCourseDown() {
		return courseDown;
	}
	public void setCourseDown(List courseDown) {
		this.courseDown = courseDown;
	}
	public Student(String ID, String name, String password, String age, String sex, List courseUp, List courseDown) {
		super();
		this.ID = ID;
		this.name = name;
		this.password = password;
		this.age = age;
		this.sex = sex;
		this.courseUp = courseUp;
		this.courseDown = courseDown;
	}
	public Student(String ID, String name, String password, String age, String sex) {
		super();
		this.ID = ID;
		this.name = name;
		this.password = password;
		this.age = age;
		this.sex = sex;
		
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
