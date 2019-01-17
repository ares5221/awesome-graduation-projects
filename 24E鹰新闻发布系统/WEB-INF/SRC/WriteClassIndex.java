package com.v246;
public class WriteClassIndex
{

	public static void writeAll()throws Exception
	{
		String url=null;//用于存放域名
		StringBuffer shortFilePath=new StringBuffer(50);	//用于存类似2005/07这样的目录层次
		StringBuffer fileName=new StringBuffer(50);//用于存放得到的文件名
		WriteHtml writeHtml=new WriteHtml();//用于生成静态HTML
		ReplaceAll replaceAll=new ReplaceAll();//用于替换模板中的标签（替换成数据库中实际内容)
		String allTitle="{$allTitle$}";//标徐(代表当前栏目下所有的文章)
		String templateContent=null;//保存栏目模板内容
		AquGetRows getRows=new AquGetRows();//用于读取栏目表(class)中的所有数据并返回一个二维数组
		FullClassDir fullClassDir=new FullClassDir();//用于得到当前栏目的路径(不包括域名等只是栏目的层次)
		String classPath=null;//当前栏目的绝对路径(不抱括域名但加上了\Article相对于虚拟目录也就是网站的根目录)
		String id=null;
		String[][] rows=null;//接收rows返回的二维数组
		StringBuffer okString=new StringBuffer(5000);//用于保存当前栏目下的所有文章
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
			throw new Exception("Error in WriteClassIndex.class N0.1 "+e.getMessage());
		}
		try
		{
			rows=getRows.getRows(connTmp.getConnection(),"class");//将class表中的所有内容存到一个二维数组内
		}
		catch(java.sql.SQLException e1)
		{
			throw new java.sql.SQLException("Error in WriteClassIndex.class NO.2 "+e1.getMessage());
		}
		try
		{
			rs=stm.executeQuery("select * from template where isDefault=1 and WithType=20");//查询栏目模认模板
		}
		catch(java.sql.SQLException e3)
		{
			throw new java.sql.SQLException("Error in WriteClassIndex.class NO.3 "+e3.getMessage());
		}
		try
		{
				if(rs.next())
				{
					
					templateContent=rs.getString("Content");//得么文章栏目横板的内容
				}
				
		}
		catch(java.sql.SQLException e4)
		{
			throw new java.sql.SQLException("Error in WriteClassIndex.class NO.4"+e4.getMessage());
		}
		try
		{
			url=Aqu.getUrl(connTmp.getConnection(),"config","Url");//得么网站的网址
		}
		catch(java.sql.SQLException e6)
		{
			throw new java.sql.SQLException("Error in WriteClassIndex.class NO.6 "+e6.getMessage());
		}
		for(int i=0;i<rows[0].length;i++)
		{
			try
			{
				rs=stm.executeQuery("select * from article where ClassId="+rows[0][i]);//查谒当前栏目下的所有文章
			}
			catch(java.sql.SQLException e2)
			{
				throw new java.sql.SQLException("Error in WriteClassIndex.class NO.7 "+e2.getMessage());
			}
		//	System.out.println("dddddddddddddddddddd");
			//System.out.println(rows[0][i]);
			classPath="\\Article"+fullClassDir.getClassDir(Integer.parseInt(rows[0][i]));//得到当前栏目的绝对路径
		//	System.out.println("dddd");
			try
			{
				
				while(rs.next())
				{
					fileName.append(FormatTimeToArticleName.format(rs.getString("UpdateTime")));//格式化时间
					shortFilePath.append(url+classPath+"\\"+fileName.subSequence(0,4)+"\\"+fileName.subSequence(4,6));//形成类似2005/07这样的目录层次
					okString.append("<a href="+shortFilePath+"\\"+fileName+" arget=_blank>"+rs.getString("Title")+"</a><br>");//将符合条件的文章连接打包进一个字符串对象内
					fileName.delete(0,fileName.length());//清除StringBuffer里面的内容
					shortFilePath.delete(0,shortFilePath.length());//清除StringBuffer里面的内容
					
				}
			}
			catch(java.sql.SQLException e5)
			{
				throw new java.sql.SQLException("Error in WriteClassIndex.class NO.8"+e5.getMessage());
			}
			String templateContentTmp=new String(templateContent);//将模板内容付值给(要不然使一次模板就被改得乱七八糟了下次没法再用了)
			templateContentTmp=replaceAll.replaceAll(templateContentTmp,allTitle,okString.toString());//将标签内容换成实际数据库中的内容
			writeHtml.save(templateContentTmp,classPath.toString(),"index.html");//生成栏目首页html
			okString.delete(0,okString.length());//清楚内容
		}
		try
		{
				if(rs!=null)rs.close();
				if(stm!=null)stm.close();
				if(conn!=null)conn.close();
		}
		catch(Exception e)
		{
			throw new Exception("Error in WriteClassIndex.java N0.9 "+e.getMessage());
		}
			finally
			{
				if(rs!=null)rs.close();
				if(stm!=null)stm.close();
				if(conn!=null)conn.close();
			}
	}
	public void writeOne(String id)
	{
		
	}
	public static void main(String[] args)
	{
		WriteClassIndex w=new WriteClassIndex();
		try
		{
			w.writeAll();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}