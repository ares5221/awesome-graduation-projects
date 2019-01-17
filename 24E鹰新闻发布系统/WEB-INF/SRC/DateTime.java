package com.v246.tag;
import javax.servlet.*;
import javax.servlet.jsp.*;
import java.io.IOException;
import java.io.Writer;
import java.util.Hashtable;
import javax.servlet.jsp.tagext.*;
public class DateTime extends javax.servlet.jsp.tagext.TagSupport
{
	public int doStartTag()throws JspTagException
	{
		return EVAL_BODY_INCLUDE;
	}
	public int doEndTag()throws JspTagException
	{
		String now;
		java.util.Date myDate=new java.util.Date();
		java.text.SimpleDateFormat dateFormat=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try
		{
			pageContext.getOut().write(dateFormat.format(myDate));
		}
		catch(IOException e)
		{
			throw new JspTagException("Thie get dateTime error in DateTime 23");
		}
		return EVAL_PAGE;
	}
}