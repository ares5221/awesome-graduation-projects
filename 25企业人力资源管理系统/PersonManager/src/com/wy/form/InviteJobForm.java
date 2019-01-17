package com.wy.form;

import org.apache.struts.action.ActionForm;

public class InviteJobForm extends ActionForm {
	private String id = null; // 编号
	
	private String name = null; // 姓名

	private String sex = "男"; // 性别

	private String age = null; // 年龄

	private String born = null; // 出生日期

	private String job = null; // 应聘职务

	private String specialty = null; // 专业

	private String experience = "无"; // 工作经验

	private String teachSchool = null; // 学历

	private String afterSchool = null; // 毕业学校

	private String tel = null; // 联系电话

	private String createtime = null; // 登记时间

	private String content = "应届毕业生，无工作经验"; // 工作简历

	private String isstock = null; // 是否被录用

	private String address = null; // 家庭住址
	


	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAfterSchool() {
		return afterSchool;
	}

	public void setAfterSchool(String afterSchool) {
		this.afterSchool = afterSchool;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getBorn() {
		return born;
	}

	public void setBorn(String born) {
		this.born = born;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}


	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIsstock() {
		return isstock;
	}

	public void setIsstock(String isstock) {
		this.isstock = isstock;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getTeachSchool() {
		return teachSchool;
	}

	public void setTeachSchool(String teachSchool) {
		this.teachSchool = teachSchool;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
