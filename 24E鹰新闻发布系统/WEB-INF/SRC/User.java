package com.v246;
public class User
{
	protected String userName,passwords;
	public void setUserName(String name)
	{
		userName=name;
	}
	public void setPasswords(String pass)
	{
		passwords=pass;
	}
	public String getUserName()
	{
		return userName;
	}
	public String getPasswords()
	{
		return passwords;
	}
}