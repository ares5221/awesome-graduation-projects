package com.v246;
public class ArticleManage
{
	protected static PageableResultSet page=new PageableResultSet();
	public static String getParentName(String column)throws Exception
	{
		String re=null;
		java.sql.ResultSet rs=null;
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
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
			rs=stm.executeQuery("select * from "+column);
			if(rs.next())
			{
				re=rs.getString("Title");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return re;		
	}
	public static void initArticleManage(String column) throws Exception
	{
		java.sql.ResultSet rs=null;
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_SENSITIVE,java.sql.ResultSet.CONCUR_UPDATABLE);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			rs=stm.executeQuery("select * from "+column);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			//if(this.rs!=null) this.rs.close();
			page.pageableResultSet(rs);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			//if(rs!=null) rs.close();
			//if(stm!=null) stm.close();
			//if(conn!=null) conn.close();
		}
	}
	public static String next() throws Exception 
	{
		return String.valueOf(page.next());
	}
	public static String getCurPage() //返回当前页号 
	{
		return String.valueOf(page.getCurPage());
	}
	public static String getPageCount() //返回总页数
	{
		return String.valueOf(page.getPageCount());
	}
	public static String getPageSize() //返回分页大小
	{
		return String.valueOf(page.getPageSize());
	}
	public static String getRowsCount() //返回总记录行数 
	{
		return String.valueOf(page.getRowsCount());
	}
	public static void gotoPage(String pages) //转到指定页
	{
		page.gotoPage(Integer.parseInt(pages));
	}
	public static void setPageSize(int pageSize) //设置分页大小
	{
		page.setPageSize(pageSize);
	}
	public static String getString(String column)throws Exception
	{
		return page.getString(column);
	}
	public static String getInt(String column)throws Exception
	{
		return page.getInt(column);
	}
	public static String getBoolean(String column)throws Exception
	{
		return page.getBoolean(column);
	}
	public static void pageFirst() throws java.sql.SQLException //转到当前页的第一条记录
	{
		page.pageFirst();
	}
	public static void pageLast() throws java.sql.SQLException //转到当前页的最后一条记录 
	{
		page.pageLast();
	}
	
}