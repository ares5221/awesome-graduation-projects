package com.v246;
import java.sql.*;

public class PageableResultSet
{ 
protected java.sql.ResultSet rs=null; 
protected int rowsCount;
protected int pageSize;
protected int curPage;
protected String command = "";

/*
　　可以看到，在PageableResultSet2中，包含了一个ResultSet的实例（这个实例只是实现了ResultSet接口，事实上它是由各个数据库厂商分别实现的），并且把所有由ResultSet继承来的方法都直接转发给该实例来处理。 
　　PageableResultSet2中继承自ResultSet的主要方法： 
**/ 
public boolean next() throws SQLException 
{ 
	return rs.next(); 
} 

public String getString(String columnName) throws SQLException 
{ 
	try
	{ 
		return rs.getString(columnName); 
	} 
	catch (SQLException e) 
	{//这里是为了增加一些出错信息的内容便于调试 
		throw new SQLException (e.toString()+" columnName="+columnName+" SQL="); 
	} 
}
public String getInt(String columnName) throws SQLException 
{ 
	try
	{ 
		return String.valueOf(rs.getInt(columnName)); 
	} 
	catch (SQLException e) 
	{//这里是为了增加一些出错信息的内容便于调试 
		throw new SQLException (e.toString()+" columnName="+columnName+" SQL="); 
	} 
}
public String getBoolean(String columnName) throws SQLException 
{ 
	try
	{ 
		return String.valueOf(rs.getBoolean(columnName)); 
	} 
	catch (SQLException e) 
	{//这里是为了增加一些出错信息的内容便于调试 
		throw new SQLException (e.toString()+" columnName="+columnName+" SQL="); 
	} 
}
 
//只有在Pageable接口中新增的方法才需要自己的写方法处理。 
/**方法注释可参考Pageable.java 
*/ 
	public int getCurPage() //返回当前页号 
	{
		return curPage;
	}
	public int getPageCount() //返回总页数
	{
		if(rowsCount==0)
			return 0;
		if(pageSize==0)
			return 1;
		//calculate PageCount
		double tmpD=(double)rowsCount/pageSize;
		int tmpI=(int)tmpD;
		if(tmpD>tmpI) tmpI++;
		return tmpI;
	}
	public int getPageRowsCount()//返回当前页的记录条数 
	{
		if(pageSize==0)
			return rowsCount;
		if(getRowsCount()==0)
			return 0;
		if(curPage!=getPageCount()) return pageSize;
			return rowsCount-(getPageCount()-1)*pageSize;
	}
	public int getPageSize() //返回分页大小
	{
		return pageSize;
	}
	public int getRowsCount() //返回总记录行数 
	{
		return rowsCount;
	}
	public void gotoPage(int page) //转到指定页
	{
		if (rs == null)
			return;
		if (page < 1)
			page = 1;
		if (page > getPageCount())
			page = getPageCount();
		int row = (page - 1) * pageSize + 1;
		try
		{
			rs.absolute(row);
			curPage = page;
		}
		catch (java.sql.SQLException e)
		{}
	}
	public void pageFirst() throws java.sql.SQLException //转到当前页的第一条记录
	{
		int row=(curPage-1)*pageSize+1;
		rs.absolute(row);
	}
	public void pageLast() throws java.sql.SQLException //转到当前页的最后一条记录 
	{
		int row=(curPage-1)*pageSize+getPageRowsCount();
		rs.absolute(row);
	}
	public void setPageSize(int pageSize) //设置分页大小 
	{
		if(pageSize>=0)
		{
			this.pageSize=pageSize;
			curPage=1;
		}
	}
	//　　PageableResultSet2的构造方法
	public void pageableResultSet(java.sql.ResultSet rs) throws java.sql.SQLException
	{
		if(rs==null) throw new SQLException("given ResultSet is NULL","user");
		
			rs.last();
			rowsCount=rs.getRow();
			rs.beforeFirst();
		
			this.rs=rs;
	}
}