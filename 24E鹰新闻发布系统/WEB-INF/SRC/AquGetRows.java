package com.v246;
/*
 *该类将得到所有以指定JDBC联接,指定数据表的所有的记录的值,以二维数级返回xxx[字段代号][字段所有值]
 **/
public class AquGetRows
{

	private java.sql.Statement stm=null;
	private java.sql.ResultSet rs=null;
	private java.sql.ResultSetMetaData rsm=null;
	private int columnCount;
	private int rowCount;
	private String rows[][];
	public String[][] getRows(java.sql.Connection conn,String table)throws java.sql.SQLException
	{
		try
		{
			stm=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
			rs=stm.executeQuery("select * from "+table);
			rsm=rs.getMetaData();
		}
		catch(java.sql.SQLException e)
		{
			throw new java.sql.SQLException("Initialize Statement or ResultSet or ResultSetMeta error in AquGetRows.class"+e.getMessage());
		}
		try
		{
			rs.last();//到记录最后
			rowCount=rs.getRow();//得到记录数(行数)
			rs.first();//移动到记录最头前
			columnCount=rsm.getColumnCount();//和到该表所有有效字段的数目总和
			rows=new String[columnCount][rowCount];//以列数和行数初始化二维数组
		}
		catch(java.sql.SQLException e1)
		{
			throw new java.sql.SQLException("Initialize planar arrray error or rs.last or rs.first error in AquGetRows.class"+e1.getMessage());
		}
		try
		{

				for(int i=0;i<rowCount;i++)//遍历所有行
				{
					for(int j=0;j<columnCount;j++)//遍历所有例
					{
							if(rsm.getColumnClassName(j+1).equals("java.lang.Integer"))//如果该例的当前字段为Integer的话(INT型)
							{
								
								rows[j][i]=String.valueOf(rs.getInt(j+1));//存储该字段当前行数的值
							}
							else if(rsm.getColumnClassName(j+1).equals("java.lang.String"))//如果该例字段为String型的话
							{

									rows[j][i]=rs.getString(j+1);

							}
							else if(rsm.getColumnClassName(j+1).equals("java.lang.Boolean"))
							{
								rows[j][i]=String.valueOf(rs.getBoolean(j+1));
							}
					}
					rs.next();//移动到下一条记录,然后再分别存储各字段的值
			}
		}
		catch(java.sql.SQLException e2)
		{
				throw new java.sql.SQLException("Can't achieve planar Array initialize in AquGetRows.class"+e2.getMessage());
		}
		finally //关闭数据库相关联接
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		this.rows=rows;
		return rows;
	}
	public int getRowsCount()
	{
		return this.rowCount;//返回记录数(行数)
	}
	
	public static void main(String args[])
	{
		
		AquGetRows r=new AquGetRows();
		String [][] rows=null;
		java.sql.Connection conn=null;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			rows=r.getRows(conn,"class");
		}
		catch(Exception e)
		{
			
		}
		for(int i=0;i<rows.length;i++)
		{
			for(int j=0;j<rows[0].length;j++)
			{
				System.out.println(rows[i][j]);
			}
		}

			
  	}
}