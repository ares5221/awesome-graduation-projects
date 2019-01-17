package com.v246;
public class Class_addClass
{
	protected String parentID; //所属栏目
	protected String className; //框目名称
	protected String classDir;  //栏目目录
	protected String maxPerPage;//每页显示的文章数
	public void setParentID(String parentID)
	{
		this.parentID=parentID;
	}
	public String getParentID()
	{
		return this.parentID;
	}
	public void setClassName(String className)
	{
		this.className=className;
	}
	public String getClassName()
	{
		return this.className;
	}
	public void setClassDir(String classDir)
	{
		this.classDir=classDir;
	}
	public String getClassDir()
	{
		return this.classDir;
	}
	public void setMaxPerPage(String maxPerPage)
	{
		this.maxPerPage=maxPerPage;
	}
	public String getMaxPerPage()
	{
		return this.maxPerPage;
	}
}