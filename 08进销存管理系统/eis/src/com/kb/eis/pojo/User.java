package com.kb.eis.pojo;

public class User {
   private int id;              //id
   private String name;         //登录名
   private String userName;     //实际姓名
   private String pass;         //登录密码
   private String phone;        //手机号码
   private int quan;            //权限   0系统管理员
   private int status;          //状态   1普通操作员
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}

public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public int getQuan() {
	return quan;
}
public void setQuan(int quan) {
	this.quan = quan;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public User(int id, String name, String userName, String pass, String phone,
		int quan, int status) {
	super();
	this.id = id;
	this.name = name;
	this.userName = userName;
	this.pass = pass;
	this.phone = phone;
	this.quan = quan;
	this.status = status;
}
public User(String name, String userName, String pass, String phone, int quan,
		int status) {
	super();
	this.name = name;
	this.userName = userName;
	this.pass = pass;
	this.phone = phone;
	this.quan = quan;
	this.status = status;
}
public User() {
	super();
}
@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", userName=" + userName
			+ ", pass=" + pass + ", phone=" + phone + ", quan=" + quan
			+ ", status=" + status + "]";
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + id;
	result = prime * result + ((name == null) ? 0 : name.hashCode());
	result = prime * result + ((pass == null) ? 0 : pass.hashCode());
	result = prime * result + ((phone == null) ? 0 : phone.hashCode());
	result = prime * result + quan;
	result = prime * result + status;
	result = prime * result + ((userName == null) ? 0 : userName.hashCode());
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
	User other = (User) obj;
	if (id != other.id)
		return false;
	if (name == null) {
		if (other.name != null)
			return false;
	} else if (!name.equals(other.name))
		return false;
	if (pass == null) {
		if (other.pass != null)
			return false;
	} else if (!pass.equals(other.pass))
		return false;
	if (phone == null) {
		if (other.phone != null)
			return false;
	} else if (!phone.equals(other.phone))
		return false;
	if (quan != other.quan)
		return false;
	if (status != other.status)
		return false;
	if (userName == null) {
		if (other.userName != null)
			return false;
	} else if (!userName.equals(other.userName))
		return false;
	return true;
}

}