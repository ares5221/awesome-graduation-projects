package com.v246;
public class CustomLable_form extends org.apache.struts.action.ActionForm
{
	protected String id;
	protected String modify;
	protected String withClass;//所属栏目
	protected String lableName;//标签名称
	protected String remark;//标签描述
	protected String hotOrNews;//热门文章还是最新文章
	protected String barNumber;//显示行数
	protected String letterNumber;//每行显示的字数
	protected String isUpdate;//是否显示时间
	protected String isClick;//是否显示点击数
	protected String staticOrDynamic;//是静态显示还是动态显示
	public void setId(String id)
	{
		this.id=id;
	}
	public String getId()
	{
		return this.id;
	}
	public void setModify(String modify)
	{
		this.modify=modify;
	}
	public String getModify()
	{
		return this.modify;
	}
	public void setWithClass(String withClass)
	{
		this.withClass=withClass;
	}
	public String getWithClass()
	{
		return withClass;
	}
	public void setLableName(String lableName)
	{
		this.lableName=Aqu.getGB(lableName);
	}
	public String getLableName()
	{
		return this.lableName;
	}
	public void setRemark(String remark)
	{
		this.remark=Aqu.getGB(remark);
	}
	public String getRemark()
	{
		return remark;
	}
	public void setHotOrNews(String hotOrNews)
	{
		this.hotOrNews=hotOrNews;
	}
	public String getHotOrNews()
	{
		return hotOrNews;
	}
	public void setBarNumber(String barNumber)
	{
		this.barNumber=barNumber;
	}
	public String getBarNumber()
	{
		return this.barNumber;
	}
	public void setLetterNumber(String letterNumber)
	{
		this.letterNumber=letterNumber;
	}
	public String getLetterNumber()
	{
		return this.letterNumber;
	}
	public void setIsUpdate(String isUpdate)
	{
		this.isUpdate=isUpdate;
	}
	public String getIsUpdate()
	{
		return this.isUpdate;
	}
	public void setIsClick(String isClick)
	{
		this.isClick=isClick;
	}
	public String getIsClick()
	{
		return this.isClick;
	}
	public void setStaticOrDynamic(String staticOrDynamic)
	{
		this.staticOrDynamic=staticOrDynamic;
	}
	public String getStaticOrDynamic()
	{
		return this.staticOrDynamic;
	}
}