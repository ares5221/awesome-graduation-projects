package com.bjsxt.school.entity;

/**
 * 班级的实体类
 * @author Administrator
 *
 */
public class Clazz {

	private String classId;
	private String gradeNo;
	private String mno;
	private String className;
	
	private Grade grade;
	private Major major;
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(String gradeNo) {
		this.gradeNo = gradeNo;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public Clazz(String classId, String gradeNo, String mno, String className,
			Grade grade, Major major) {
		super();
		this.classId = classId;
		this.gradeNo = gradeNo;
		this.mno = mno;
		this.className = className;
		this.grade = grade;
		this.major = major;
	}
	public Clazz() {
		super();
	}
	public Clazz(String classId, String gradeNo, String mno, String className) {
		super();
		this.classId = classId;
		this.gradeNo = gradeNo;
		this.mno = mno;
		this.className = className;
	}
	
	
}
