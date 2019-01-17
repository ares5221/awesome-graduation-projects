package com.v246;
public class CustomLableFormat
{
	protected String url;//用于存储网站的安装路径
	protected FullClassDir fullDir=new FullClassDir();//用于得到指定栏目ID的路径
	protected String[][] re=null;//用于返回
	protected java.sql.Connection conn=null;
	protected Connections connTmp=new Connections();
	protected java.sql.Statement stm=null;
	protected java.sql.Statement stm1=null;
	protected java.sql.ResultSet rs=null;
	protected java.sql.ResultSet rs1=null;
	protected ReplaceAll replaceAll=new ReplaceAll();
	CustomLableFormat()
	{
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			stm1=conn.createStatement();
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");//得到网站的安装路径
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public String[][] lableFormat() throws Exception
	{
		
		
		int count;//存储查到的数据的个数
		try
		{
			rs=stm.executeQuery("select * from customlable");
			rs.last();//移动到流标的最后
			count=rs.getRow();//得到数据个数
			re=new String[count][2];//初始化数组
			System.out.println(count);
			rs.first();//将流标移动到第一条记录，以便进行操作
			
			for(int i=0;i<count;i++)//遍历所有数据并存储
			{
				
				re[i][0]=rs.getString("LableName");//存储自定义标签的名子
				re[i][1]=formats(rs.getString("sql"),String.valueOf(rs.getInt("BarNumber")),String.valueOf(rs.getInt("LetterNumber")),rs.getBoolean("staticed"));//得到该标签的具体内容
				rs.next();//移动到下一条记录
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
				if(rs1!=null)rs1.close();
				if(rs!=null)rs.close();
				if(stm1!=null)stm1.close();
				if(stm!=null)stm.close();
				if(conn!=null)conn.close();
				
		}
		return re;
		
	}		
	public String formats(String sql,String bar,String letter,boolean SD)
	{
		StringBuffer re=new StringBuffer(500);
		if(SD)
		{
	
			String articleName;
			int j=0;
			try
			{
				rs1=stm1.executeQuery(sql);//查找符合条件的数据，该SQL语句以经存储在数据库内
				
				while(rs1.next())
				{
					
					if(j>Integer.parseInt(bar))
					{
						
						break;
					}
					
					articleName=Aqu.formatDate(rs1.getString("UpdateTime"));
					
				//	System.out.println((rs1.getString("Title")).substring(0,Integer.parseInt(letter)));
					if(letter.equals("0")||(rs1.getString("Title")).length()<=Integer.parseInt(letter))
					{
						re.append("<img src='/images/article_title_pic.gif' alt='普通文章'>&nbsp;<a href='"+url+"/Article"+fullDir.getClassDir(rs1.getInt("ClassId"),"/")+"/"+articleName.substring(0,4)+"/"+articleName.substring(4,6)+"/"+articleName+"'>"+rs1.getString("Title")+"</a><br>");//得到以指定行数，指定字符数数的所有数据，并返回
					}
					else
					{
						re.append("<img src='/images/article_title_pic.gif' alt='普通文章'>&nbsp;<a class='listA' href='"+url+"/Article"+fullDir.getClassDir(rs1.getInt("ClassId"),"/")+"/"+articleName.substring(0,4)+"/"+articleName.substring(4,6)+"/"+articleName+"' title='"+rs1.getString("Title")+"'>"+(rs1.getString("Title")).subSequence(0,Integer.parseInt(letter))+"...</a><br>");//得到以指定行数，指定字符数数的所有数据，并返回
					}
					j++;
					
				//	re.append("oooooooooo");
					
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
		else
		{
			try
			{
				re.append("<script src='"+url+"/showDynamicCustomContent.jsp?id="+rs.getInt("Id")+"'></script>");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return replaceAll.replaceAll(re.toString(),"\"","&quot;");
	}
	public static void main(String args[])
	{
		CustomLableFormat format=new CustomLableFormat();
		String tmp[][]=null;
		try
		{
			tmp=format.lableFormat();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		for(int i=0;i<tmp.length;i++)
		{
			System.out.print(tmp[i][0]+": ");
			System.out.println(tmp[i][1]);
		}
	}

}