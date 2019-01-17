package com.v246;
import javax.servlet.http.*;
public class LoginValidate
{
	public static String loginValidate(String name,String pass)throws Exception
	{
		String re=null;
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
			e.printStackTrace();
		}
		try
		{
			rs=stm.executeQuery("select * from aqu_admin where AdminName="+Aqu.addIC(name)+"and AdminPassword="+Aqu.addIC(pass));
			if(rs.next())
			{
				re="ok";

			}
			else
			{
				re="error";
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
}