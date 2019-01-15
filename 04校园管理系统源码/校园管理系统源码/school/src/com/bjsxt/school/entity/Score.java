package com.bjsxt.school.entity;

import java.io.Serializable;
import java.util.Date;

public class Score implements Serializable{

	private String sname;
	private String sno;
	private String courseno;
	private int score;
	private String examType;
	private Date examDate;
	private String operator;
	private Course course;
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getCourseno() {
		return courseno;
	}
	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Score(String sname, String sno, String courseno, int score,
			String examType, Date examDate, String operator) {
		super();
		this.sname = sname;
		this.sno = sno;
		this.courseno = courseno;
		this.score = score;
		this.examType = examType;
		this.examDate = examDate;
		this.operator = operator;
	}
	public Score() {
		super();
	}
	@Override
	public String toString() {
		return "Score [sname=" + sname + ", sno=" + sno + ", courseno="
				+ courseno + ", score=" + score + ", examType=" + examType
				+ ", examDate=" + examDate + ", operator=" + operator
				+ ", course=" + course + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((course == null) ? 0 : course.hashCode());
		result = prime * result
				+ ((courseno == null) ? 0 : courseno.hashCode());
		result = prime * result
				+ ((examDate == null) ? 0 : examDate.hashCode());
		result = prime * result
				+ ((examType == null) ? 0 : examType.hashCode());
		result = prime * result
				+ ((operator == null) ? 0 : operator.hashCode());
		result = prime * result + score;
		result = prime * result + ((sname == null) ? 0 : sname.hashCode());
		result = prime * result + ((sno == null) ? 0 : sno.hashCode());
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
		Score other = (Score) obj;
		if (course == null) {
			if (other.course != null)
				return false;
		} else if (!course.equals(other.course))
			return false;
		if (courseno == null) {
			if (other.courseno != null)
				return false;
		} else if (!courseno.equals(other.courseno))
			return false;
		if (examDate == null) {
			if (other.examDate != null)
				return false;
		} else if (!examDate.equals(other.examDate))
			return false;
		if (examType == null) {
			if (other.examType != null)
				return false;
		} else if (!examType.equals(other.examType))
			return false;
		if (operator == null) {
			if (other.operator != null)
				return false;
		} else if (!operator.equals(other.operator))
			return false;
		if (score != other.score)
			return false;
		if (sname == null) {
			if (other.sname != null)
				return false;
		} else if (!sname.equals(other.sname))
			return false;
		if (sno == null) {
			if (other.sno != null)
				return false;
		} else if (!sno.equals(other.sno))
			return false;
		return true;
	}
	
	
	
	
}
