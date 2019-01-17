package com.v246;
public class WriteIndex
{
	public static String writeIndex()throws Exception
	{
		String navigation="{$navigation$}";
		StringBuffer navigationScript=new StringBuffer(200); //用于存储网站导航的javaScript代码
		WriteHtml writeHtml=new WriteHtml();
		CustomLableFormat customFormat=new CustomLableFormat();
		String custom[][]=null;
		ReplaceAll replaceAll=new ReplaceAll();
		String re=null;
		String template=null;
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			throw new Exception("Error in WriteHtml.java NO.1"+e.getMessage());
		}
		try
		{
			rs=stm.executeQuery("select * from template where WithType=1 and IsDefault=1");
			if(rs.next())
			{
				template=rs.getString("Content");
				re="ok";
			}
			else
			{
				template="error";
				re="error";
			}
			
		}
		catch(Exception e)
		{
			throw new Exception("Error in WriteIndex.java N0.2 "+e.getMessage());
		}
		try
		{
			custom=customFormat.lableFormat();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		for(int i=0;i<custom.length;i++)
		{
			System.out.println(custom[i][0]+custom[i][1]);
			template=replaceAll.replaceAll(template,custom[i][0],custom[i][1]);
		}
		navigationScript=initNavigationScript();//得到用于显示网站导航的javaScript脚本
		template=replaceAll.replaceAll(template,navigation,navigationScript.toString());
		writeHtml.save(template,"/","index.html");
		try
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		catch(Exception e)
		{
			throw new Exception("Error in WriteIndex.java NO.4 "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return re;
	}
	protected static StringBuffer initNavigationScript()
	{
		Connections connTmp=new Connections();
		String url=null;
		StringBuffer navigationScript=new StringBuffer(300);
		try
		{
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		navigationScript.append("<script language='JavaScript' type='text/JavaScript' src='"+url+"/Article/js/menu.js'></script> <script type='text/javascript' language='JavaScript1.2' src='"+url+"/Article/js/stm31.js'></script> <script language='JavaScript1.2' type='text/JavaScript' src='"+url+"/Article/js/ShowClass_Menu.js'></script>");
		
		return navigationScript;
	}
}