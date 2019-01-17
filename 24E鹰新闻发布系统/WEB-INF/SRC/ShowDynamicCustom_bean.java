package com.v246;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspException;
import java.io.IOException;
public class ShowDynamicCustom_bean 
{

	public static String getContent(String id)throws Exception
	{
		CustomLableFormat CF=new CustomLableFormat();
		String content=null;
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		boolean v246=true;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			rs=stm.executeQuery("select * from customLable where id="+id);
			if(rs.next())
			{
				System.out.println(v246);
				content=CF.formats(rs.getString("sql"),String.valueOf(rs.getInt("BarNumber")),String.valueOf(rs.getInt("LetterNumber")),v246);
			}
			else
			{
				content="还没有记录";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return content;
	}
	public static void main(String[] args)
	{
		try
		{
			System.out.println(getContent("23"));
		}
		catch(Exception e)
		{
			
		}
	}
}