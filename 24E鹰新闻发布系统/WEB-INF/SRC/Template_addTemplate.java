package com.v246;
public class Template_addTemplate
{
	protected String modifyId;//修改模板的时候用到的变量，用于接收所修改模板的id
	protected String action;
	protected String templateType;
	protected String templateName;
	protected String content;
	protected String isDefault;
	public void setModifyId(String modifyId)
	{
		this.modifyId=modifyId;
	}
	public String getModifyId()
	{
		return this.modifyId;
	}
	public void setAction(String action)
	{
		this.action=action;
	}
	public String getAction()
	{
		return this.action;
	}
	public void setTemplateType(String templateType)
	{
		this.templateType=templateType;
	}
	public String getTemplateType()
	{
		return templateType;
	}
	public void setTemplateName(String templateName)
	{
		this.templateName=templateName;
	}
	public String getTemplateName()
	{
		return templateName;
	}
	public void setContent(String content)
	{
		this.content=content;
	}
	public String getContent()
	{
		return content;
	}
	public void setIsDefault(String isDefault)
	{
		this.isDefault=isDefault;
	}
	public String getIsDefault()
	{
		return isDefault;
	}
}