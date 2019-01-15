package com.zhatian.Tinner.entity;

import java.io.Serializable;

/**
 * 学生的实体类
 * @author ask-kraken
 * @version 1.0
 * @help 可能需要重写hashcode和equals方法
 * 
 */
public class Student implements Serializable{
	private int student_Id;
	private String student_Username;
	private String student_Password;
	private String student_Name;
	private String student_Sex;
	private String student_Age;
	private String student_Classroom;
	public Student(int student_Id, String student_Username, String student_Password, String student_Name,
			String student_Sex, String student_Age, String student_Classroom) {
		this.student_Id = student_Id;
		this.student_Username = student_Username;
		this.student_Password = student_Password;
		this.student_Name = student_Name;
		this.student_Sex = student_Sex;
		this.student_Age = student_Age;
		this.student_Classroom = student_Classroom;
	}
	public Student() {
	}
	public int getStudent_Id() {
		return student_Id;
	}
	public void setStudent_Id(int student_Id) {
		this.student_Id = student_Id;
	}
	public String getStudent_Username() {
		return student_Username;
	}
	public void setStudent_Username(String student_Username) {
		this.student_Username = student_Username;
	}
	public String getStudent_Password() {
		return student_Password;
	}
	public void setStudent_Password(String student_Password) {
		this.student_Password = student_Password;
	}
	public String getStudent_Name() {
		return student_Name;
	}
	public void setStudent_Name(String student_Name) {
		this.student_Name = student_Name;
	}
	public String getStudent_Sex() {
		return student_Sex;
	}
	public void setStudent_Sex(String student_Sex) {
		this.student_Sex = student_Sex;
	}
	public String getStudent_Age() {
		return student_Age;
	}
	public void setStudent_Age(String student_Age) {
		this.student_Age = student_Age;
	}
	public String getStudent_Classroom() {
		return student_Classroom;
	}
	public void setStudent_Classroom(String student_Classroom) {
		this.student_Classroom = student_Classroom;
	}
	@Override
	public String toString() {
		return "Student [student_Id=" + student_Id + ", student_Username=" + student_Username + ", student_Password="
				+ student_Password + ", student_Name=" + student_Name + ", student_Sex=" + student_Sex
				+ ", student_Age=" + student_Age + ", student_Classroom=" + student_Classroom + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((student_Age == null) ? 0 : student_Age.hashCode());
		result = prime
				* result
				+ ((student_Classroom == null) ? 0 : student_Classroom
						.hashCode());
		result = prime * result + student_Id;
		result = prime * result
				+ ((student_Name == null) ? 0 : student_Name.hashCode());
		result = prime
				* result
				+ ((student_Password == null) ? 0 : student_Password.hashCode());
		result = prime * result
				+ ((student_Sex == null) ? 0 : student_Sex.hashCode());
		result = prime
				* result
				+ ((student_Username == null) ? 0 : student_Username.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (student_Age == null) {
			if (other.student_Age != null)
				return false;
		} else if (!student_Age.equals(other.student_Age))
			return false;
		if (student_Classroom == null) {
			if (other.student_Classroom != null)
				return false;
		} else if (!student_Classroom.equals(other.student_Classroom))
			return false;
		if (student_Id != other.student_Id)
			return false;
		if (student_Name == null) {
			if (other.student_Name != null)
				return false;
		} else if (!student_Name.equals(other.student_Name))
			return false;
		if (student_Password == null) {
			if (other.student_Password != null)
				return false;
		} else if (!student_Password.equals(other.student_Password))
			return false;
		if (student_Sex == null) {
			if (other.student_Sex != null)
				return false;
		} else if (!student_Sex.equals(other.student_Sex))
			return false;
		if (student_Username == null) {
			if (other.student_Username != null)
				return false;
		} else if (!student_Username.equals(other.student_Username))
			return false;
		return true;
	}
	
	
	
	
}
