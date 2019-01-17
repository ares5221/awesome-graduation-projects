package com.v246;
public class MDDCustom
{
	private static java.sql.Connection conn=null;
	private static java.sql.Statement stm=null;
	private static java.sql.ResultSet rs=null;
	private static Connections connTmp=new Connections();
	public static void initMDDCustom()
	{
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
			rs=stm.executeQuery("select * from customLable");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static boolean next()throws Exception
	{
		try
		{
			return rs.next();
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.1 "+e.getMessage());
		}
	}
	public static String getString(String s)throws Exception
	{
		try
		{
			return rs.getString(s);
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.2 "+e.getMessage());
		}
	}
	public static int getInt(String s)throws Exception
	{
		try
		{
			return rs.getInt(s);
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.3 "+e.getMessage());
		}
	}
	public static boolean getBoolean(String s)throws Exception
	{
		try
		{
			return rs.getBoolean(s);
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.4 "+e.getMessage());
		}
	}
	public static int getCount()throws Exception
	{
		int re;
		try
		{
			rs.last();
			re=rs.getRow();
			rs.beforeFirst();
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.5 "+e.getMessage());
		}
		return re;
	}
	public static void deleteCustom(String id)throws Exception
	{
		try
		{
			stm.executeUpdate("delete from customlable where id="+id);
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.6 "+e.getMessage());
		}
		
	}
	public static void customModify(String id)
	{
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
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void close()throws Exception
	{
		try
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDCustom.java NO.7 "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
	}
	public static String subLable(String s)
	{
		return s.substring(2,s.length()-2);
	}
}