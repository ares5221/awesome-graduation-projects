package com.bjsxt.school.entity;

import java.io.Serializable;





public class User implements Serializable{

	private String userId;//”√ªß√˚
	private String userName;//Í«≥∆
	private String password;//√‹¬Î
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(String userId, String userName, String password) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "Admin [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + "]";
	}
	

	
	

	
	
	
}
