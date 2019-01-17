package com.v246;
/*
 *本类用于迭带显示数据库中所有模板类型及ID
 **/
public class GetTemplateType
{
	protected java.sql.Connection conn=null;
	protected java.sql.Statement stm=null;
	protected java.sql.ResultSet rs=null;
	protected Connections connTmp=new Connections();
	protected java.util.Collection coll=new java.util.ArrayList();
	public GetTemplateType()throws Exception
	{
		String id;
		String type;
		String query="select * from TemplateType";
		try
		{		
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception ex)
		{
			throw new Exception("Initialize conn or stm error in GetTemplateType.class 16-20");
		}
		try
		{
			rs=stm.executeQuery(query);
			while(rs.next())
			{
				id=rs.getString("Id");
				type=rs.getString("Type");
				addCollection(new TemplateType(id,type));
			}
		}
		catch(Exception e)
		{
			throw new Exception("read Template error in GetTemplateType.class 19--27");
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
	}
	public void addCollection(TemplateType type)
	{
		coll.add(type);
	}
	public java.util.Collection getColl()
	{
		return coll;
	}
	
}