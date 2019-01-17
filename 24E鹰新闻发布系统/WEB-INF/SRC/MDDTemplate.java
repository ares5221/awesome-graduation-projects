package com.v246;
public class MDDTemplate
{
	/*
	 *本类应用于MDDTemplate.jsp
	 **/

	protected static Connections connTmp=new Connections();
	public static void deleteData(String column)throws Exception
	{
		/*
		 *本方法用于删除模板，是个自定义EL表达式
		 *
		 **/
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;

		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			stm.executeUpdate("delete from "+column);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
	}
	public static void setDefault(String id) throws Exception 
	{
		/*
		 *本类是个自定义EL表达式，用于把指定ID的模板设为默认
		 **/
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		java.sql.Statement stm1=null;
		java.sql.ResultSet rs1=null;
		java.sql.Statement stm2=null;
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			stm1=conn.createStatement();
			stm2=conn.createStatement();
			rs=stm.executeQuery("select * from template where TemplateId="+id);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if(rs.next()) //如果查询到了记录则
			{
				rs1=stm1.executeQuery("select * from template where WithType="+rs.getInt("WithType")+" and IsDefault=1");
				while(rs1.next())
				{
					if(rs1.getBoolean("IsDefault"))//如果当前模板是默认模板则取消默认
					{
						stm2.executeUpdate("update template set IsDefault=0 where TemplateId="+rs1.getInt("TemplateId"));
					}
				}
				
			}
			stm2.executeUpdate("update template set IsDefault=1 where TemplateId="+rs.getInt("TemplateId"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			rs1.close();
			stm1.close();
			rs.close();
			stm.close();
			conn.close();
		}
	}
	public static String[] modifyTemplate(String id)throws Exception
	{
		/*
		 *本方法是EL的自定义表大式，用于修改模板，返回一个数组
		 **/
		String[] re=new String[5];
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.Statement stm1=null;
		java.sql.ResultSet rs=null;
		java.sql.ResultSet rs1=null;
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
			stm1=conn.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			rs=stm.executeQuery("select * from template where TemplateId="+id);
			if(rs.next())
			{
				rs1=stm1.executeQuery("select * from templateType where Id="+rs.getInt("WithType"));
				if(rs1.next())
				{
					re[0]=rs1.getString("Type");
					re[1]=String.valueOf(rs1.getInt("id"));
				}
				else
				{
					re[0]="error";
					re[1]="0";
				}
				re[2]=rs.getString("TemplateName");
				re[3]=rs.getString("Content");
				re[4]=String.valueOf(rs.getBoolean("IsDefault"));
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs1!=null)rs1.close();
			if(stm1!=null)stm1.close();
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
			
		}
		return re;
	}
	public static void main(String[] args)
	{
		String[] a=null;
		try
		{
			a=modifyTemplate("38");
			System.out.println(a[3]);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}