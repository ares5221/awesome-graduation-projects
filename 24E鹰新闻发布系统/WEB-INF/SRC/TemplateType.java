package com.v246;
/*
 *本类用于存传及显示模板类型ID，及类型，用于addTemplate.jsp中的"所属类型"的下拉框
 **/
public class TemplateType
{
	protected String id;
	protected String type;
	public TemplateType(String id,String type)
	{
		this.id=id;
		this.type=type;
	}
	public void setId(String id)
	{
		this.id=id;
	}
	public String getId()
	{
		return id;
	}
	public void setType(String type)
	{
		this.type=type;
	}
	public String getType()
	{
		return type;
	}
}