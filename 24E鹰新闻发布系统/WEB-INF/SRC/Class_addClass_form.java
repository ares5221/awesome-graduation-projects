package com.v246;
public class Class_addClass_form extends org.apache.struts.action.ActionForm
{
	protected GB gb=new GB();
	protected Class_addClass classes=new Class_addClass();
	public void setParentID(String parentID)
	{
		classes.setParentID(parentID);
	}
	public String getParentID()
	{
		return classes.getParentID();
	}
	public void setClassName(String className)
	{
		classes.setClassName(gb.getGB(className));
	}
	public String getClassName()
	{
		return classes.getClassName();
	}
	public void setClassDir(String classDir)
	{
		classes.setClassDir(classDir);
	}
	public String getClassDir()
	{
		return classes.getClassDir();
	}
	public void setMaxPerPage(String maxPerPage)
	{
		classes.setMaxPerPage(maxPerPage);
	}
	public String getMaxPerPage()
	{
		return classes.getMaxPerPage();
	}
	public Class_addClass getClasses()
	{
		return this.classes;
	}
}