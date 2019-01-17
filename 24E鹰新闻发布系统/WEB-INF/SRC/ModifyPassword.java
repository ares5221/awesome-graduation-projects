package com.v246;
public class ModifyPassword
{
	/*
	 *本类用于修改超级管理员密码
	 **/
	public static String modifyPassword(String formerPassword,String newPassword)throws Exception
	{
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		String re=null;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			throw new Exception("Error in ModifyPassword.java "+e.getMessage());
		}
		try
		{
			rs=stm.executeQuery("select * from aqu_admin where AdminPassword="+Aqu.addIC(formerPassword));
			if(rs.next())
			{
				stm.executeUpdate("update aqu_admin set AdminPassword="+Aqu.addIC(newPassword));
				re="ok";
			}
			else
			{
				re="error";
			}
			
		}
		catch(Exception e)
		{
			throw new Exception("Error in ModifyPassword.java "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return re;
	}
}