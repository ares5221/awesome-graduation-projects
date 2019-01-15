package com.bjsxt.school.entity;
/**
 * 
 * 课程的实体类
 * 
 * @author lx
 *
 */
public class Course {
     private  String courseno;//课程编号
     private  String coursename; //课程名
     
     
     
	public Course() {
		super();
	}
	public Course(String courseno, String coursename) {
		super();
		this.courseno = courseno;
		this.coursename = coursename;
	}
	@Override
	public String toString() {
		return "Course [courseno=" + courseno + ", coursename=" + coursename
				+ "]";
	}
	public String getCourseno() {
		return courseno;
	}
	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

}
