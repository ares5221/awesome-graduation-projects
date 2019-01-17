package com.v246;
public class ShowClickNumber
{
	public static String getClickNumber(String id)throws Exception
	{
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		Connections connTmp=new Connections();
		String re=null;
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			rs=stm.executeQuery("select * from article where ArticleID="+id);
			if(rs.next())
			{
				
				
				
				re=String.valueOf(rs.getInt("Hits"));
				System.out.println("ok");
				stm.executeUpdate("update article set Hits=Hits+1 where ArticleID="+id);
				
			}
			else
			{
				re="Êý¾Ý´íÎó";
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
		return re;
	}
	public static void main(String args[])
	{
		try
		{
			System.out.println(getClickNumber("80"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}