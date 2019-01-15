package com.bjsxt.school.entity;

import java.util.Date;

public class TeacherCourse {
    private String tname;
    private String classid;
    private String tid;//ΩÃ ¶id
    private String majorname;
    private String classname;
    private Date leavedate;
    private Date jobdate;
    private Teacher teacher;
    
    
	public Teacher getTeacher() {
		return teacher;
	}



	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}



	public TeacherCourse(String tname, String classid, String tid,
			String majorname, String classname, Date leavedate, Date jobdate,
			Teacher teacher) {
		super();
		this.tname = tname;
		this.classid = classid;
		this.tid = tid;
		this.majorname = majorname;
		this.classname = classname;
		this.leavedate = leavedate;
		this.jobdate = jobdate;
		this.teacher = teacher;
	}



	public TeacherCourse() {
		super();
	}



	public TeacherCourse(String tname, String classid, String tid,
			String majorname, String classname, Date leavedate, Date jobdate) {
		super();
		this.tname = tname;
		this.classid = classid;
		this.tid = tid;
		this.majorname = majorname;
		this.classname = classname;
		this.leavedate = leavedate;
		this.jobdate = jobdate;
	}



	public String getTname() {
		return tname;
	}



	public void setTname(String tname) {
		this.tname = tname;
	}



	public String getClassid() {
		return classid;
	}



	public void setClassid(String classid) {
		this.classid = classid;
	}



	public String getTid() {
		return tid;
	}



	public void setTid(String tid) {
		this.tid = tid;
	}



	public String getMajorname() {
		return majorname;
	}



	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}



	public String getClassname() {
		return classname;
	}



	public void setClassname(String classname) {
		this.classname = classname;
	}



	public Date getLeavedate() {
		return leavedate;
	}



	public void setLeavedate(Date leavedate) {
		this.leavedate = leavedate;
	}



	public Date getJobdate() {
		return jobdate;
	}



	public void setJobdate(Date jobdate) {
		this.jobdate = jobdate;
	}



	@Override
	public String toString() {
		return "TeacherCourse [tname=" + tname + ", classid=" + classid
				+ ", tid=" + tid + ", majorname=" + majorname + ", classname="
				+ classname + ", leavedate=" + leavedate + ", jobdate="
				+ jobdate + "]";
	}
    
    
    
}
