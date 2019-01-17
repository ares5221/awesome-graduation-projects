package com.v246;
public class Aqu
{
	public static String getUrl(java.sql.Connection conn,String table,String columns)throws java.sql.SQLException
	{
		/*
		 *返回指定数据库联接、指定表、指定字段的第一条记录（如果有多条记录的话它只返回第一条记录）
		 **/
		String re=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		try
		{
			stm=conn.createStatement();
			rs=stm.executeQuery("select * from "+table);
		}
		catch(java.sql.SQLException e)
		{
			throw new java.sql.SQLException("Error in Aqu.class 11--12 "+e.getMessage());
		}
		try
		{
			if(rs.next())
			{
				re=rs.getString(columns);
			}
			else
			{
				re="";
			}
			
		}
		catch(java.sql.SQLException e)
		{
			throw new java.sql.SQLException("Error in Aqu.class 20--21 "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return re;
	}

	public static String getCheckState(String checkBox)
	{
	/*
	 *返回check复选框的选中状态，如果选中则返回1否则返回0
	 **/
		String tmp;
		if(checkBox!=null&&checkBox.equals("Yes"))
		{
			tmp="1";
		}
		else
		{
			tmp="0";
		}
			return tmp;
	}
	public static String getRadioState(String radio,String s)
	{
		/*
		 *返回radio单选框的选中状态，如果选中则返回1否则返回0
		 **/
		String tmp;
		if(radio!=null&&radio.equals(s))
		{
			tmp="1";
		}
		else
		{
			tmp="0";
		}
		return tmp;
	}
	public static String getGB(String str)
	{
	/*
	 *重新对字符进行编码
	 **/
		try
		{
			byte array[]=str.getBytes("ISO-8859-1");
			str=new String(array);
		}
		catch(Exception e)
		{
		}
		return str;
	}
	public static String[] stringAnalysis(String str,String s)
	{
	/*
	 *字符串分析，把指定的字符串str以指定的字符s分割，然后存储在一个数组中并返回
	 **/
		int i=0;
		java.util.StringTokenizer analysis=new java.util.StringTokenizer(str,s);
		String[] re=new String[analysis.countTokens()];
		while(analysis.hasMoreTokens())
		{
			re[i]=analysis.nextToken();
			i++;
		}
		return re;
	}
	public static String addIC(String str)//addIC是add Inverted Comma的简写
	{
	/*
	 *在指定的字符串前后加上单引号''
	 **/
	 	StringBuffer re=new StringBuffer(50);
	 	re.append("'");
		re.append(str);
		re.append("'");
		return re.toString();
	}
	public static String formatDate(String s) //格式化时间将2005-07-15 23:22:09格式化成20050715232209这种型式
	{
		StringBuffer re=new StringBuffer();
		java.util.StringTokenizer analysis=new java.util.StringTokenizer(s,"- :");
		while(analysis.hasMoreTokens()) //循环输出格式完后返回的数组的内容
		{
			re.append(analysis.nextToken());
		}
		re.append(".html");//将格式化完民后的字符串作化文件名
		return re.toString();//返回格式化完成后的字符串
	}
	public static void main(String []args)
	{
		String url=null;
		Connections connTmp=new Connections();
		try
		{
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
		}
		catch(Exception e)
		{
			
		}
	}
}