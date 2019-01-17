package com.v246;
public class ArticleNonceLocation
{
	protected StringBuffer re=new StringBuffer(300);
	protected StringBuffer fullClassDir=new StringBuffer(30);
	protected String url=null;
	protected FullClassDir fullDir=new FullClassDir();//用于得到当前栏目的路径(不包括域名等只是栏目的层次)
	protected StringBuffer okString=new StringBuffer(50);//用天保存最后得到的位置
	protected Connections connTmp=new Connections();
	protected AquGetRows getRows=new AquGetRows();//用以得到表class里的所有内容并返回一个二维数组
	protected String[][] rows=null;
	protected java.sql.Connection conn=null;
	protected java.sql.Statement stm=null;
	protected java.sql.ResultSet rs=null;
	ArticleNonceLocation()
	{
		try
		{
			getRows();	
			url=getUrl();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		re.append("您当前的位置 &gt;&gt; <a href='"+url+"index.html'>首页</a> &gt;&gt; ");
	}
	protected String getUrl()throws Exception
	{
		String url=null;
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			throw new Exception("Error in ArticleNonceLocation.class "+e.getMessage());
		}
		try
		{
			rs=stm.executeQuery("select * from config");
			rs.next();
			url=rs.getString("url");
		}
		catch(Exception e)
		{
			throw new Exception("Error in ArticleNonceLocation.class "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return url;
		
	}
	protected void getRows()
	{
		try
		{
			rows=getRows.getRows(connTmp.getConnection(),"class");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	protected void locationSort(String id)
	{
		for(int i=0;i<rows[0].length;i++)
		{
			if(rows[0][i].equals(id))
			{
				try
				{
					okString.append("<a href='"+url+"/Article"+fullDir.getClassDir(Integer.parseInt(rows[0][i]))+"\\index.html'>"+rows[2][i]+"</a> &gt;&gt; ##");//将相应栏目的标题存到okString中
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				if(!rows[1][i].equals("0"))
				{
					locationSort(rows[1][i]);
				}
				else
				{
					break;
				}
			}
		}
		
	}
	public String getLocation(String id)
	{
		StringAnalysis ana=new StringAnalysis();
		locationSort(id);
		String tmp[]=ana.startAnalysis(okString.toString(),"##");
		for(int i=tmp.length-1;i>=0;i--)
		{
				re.append(tmp[i]);
			
		}
		re.append("文章正文");
		return re.toString();
	}
	public static void main(String []args)
	{
		ArticleNonceLocation location=new ArticleNonceLocation();
		String tmp=null;
		tmp=location.getLocation("9");
		System.out.println(tmp);
	}
}