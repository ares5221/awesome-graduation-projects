package com.v246;
public class TemplateManage
{
	/*
	 *本类是自定义EL，用于templateManage.jsp
	 **/
	public static String getManage(String id)throws Exception
	{
		String withTypeName=null;
		String url=null;
		StringBuffer re=new StringBuffer(3000);
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
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
			if(id.equals("0"))//如果id等于0那么就代表要输出所有栏目
			{
				rs=stm.executeQuery("select * from template");
				while(rs.next())
				{
					if(rs.getBoolean("IsDefault"))
					{
						re.append("<TR class=tdbg onmouseover=\"this.style.backgroundColor='#BFDFFF'\"onmouseout=&#034;this.style.backgroundColor=''\"> <TD align=middle width=30>"+rs.getInt("TemplateId")+"</TD><TD align=middle width=150>"+getWithTypeName(rs.getInt("WithType"))+"</TD><TD align=middle><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid=0'>"+rs.getString("TemplateName")+"</A></TD><TD align=middle width=100><B>√</B></TD><TD align=middle width=200><FONT color=#39867b>设为默认&nbsp;</FONT><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid=0'>修改模板</A>&nbsp;<FONT color=#39867b>删除模板</FONT> </TD></TR>");				
					}
					else
					{
						re.append("<TR class=tdbg onmouseover=\"this.style.backgroundColor='#BFDFFF'\" onmouseout=&#034;this.style.backgroundColor=''\"> <TD align=middle width=30>"+rs.getInt("TemplateId")+"</TD> <TD align=middle width=150>"+getWithTypeName(rs.getInt("WithType"))+"</TD> <TD align=middle><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid=0'>"+rs.getString("TemplateName")+"</A></TD> <TD align=middle width=100><B>×</B></TD><TD align=middle width=200><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=set&amp;pid=0'>设为默认</A>&nbsp;<A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid=0'>修改模板</A>&nbsp;<A onclick=\"return confirm('确定要删除此版面设计模板吗？删除此版面设计模板后原使用此版面设计模板的文章将改为使用系统默认版面设计模板。');\" href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=del&amp;pid=0'>删除模板</A> </TD> </TR>");
					}
				}
			}
			else
			{
				rs=stm.executeQuery("select * from template where WithType="+id);
				while(rs.next())
				{
					if(rs.getBoolean("IsDefault"))
					{
						re.append("<TR class=tdbg onmouseover=\"this.style.backgroundColor='#BFDFFF'\"onmouseout=&#034;this.style.backgroundColor=''\"> <TD align=middle width=30>"+rs.getInt("TemplateId")+"</TD><TD align=middle width=150>"+getWithTypeName(rs.getInt("WithType"))+"</TD><TD align=middle><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify'>"+rs.getString("TemplateName")+"</A></TD><TD align=middle width=100><B>√</B></TD><TD align=middle width=200><FONT color=#39867b>设为默认&nbsp;</FONT><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid="+rs.getInt("WithType")+"'>修改模板</A>&nbsp;<FONT color=#39867b>删除模板</FONT> </TD></TR>");				
					}
					else
					{
						re.append("<TR class=tdbg onmouseover=\"this.style.backgroundColor='#BFDFFF'\" onmouseout=&#034;this.style.backgroundColor=''\"> <TD align=middle width=30>"+rs.getInt("TemplateId")+"</TD> <TD align=middle width=150>"+getWithTypeName(rs.getInt("WithType"))+"</TD> <TD align=middle><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid="+rs.getInt("WithType")+"'>"+rs.getString("TemplateName")+"</A></TD> <TD align=middle width=100><B>×</B></TD><TD align=middle width=200><A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=set&amp;pid="+rs.getInt("WithType")+"'>设为默认</A>&nbsp;<A href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=modify&amp;pid="+rs.getInt("WithType")+"'>修改模板</A>&nbsp;<A onclick=\"return confirm('确定要删除此版面设计模板吗？删除此版面设计模板后原使用此版面设计模板的文章将改为使用系统默认版面设计模板。');\" href='"+url+"/admin/MMDTemplate.jsp?id="+rs.getInt("TemplateId")+"&amp;action=del&amp;pid="+rs.getInt("WithType")+"'>删除模板</A> </TD> </TR>");
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs!=null) rs.close();
			if(stm!=null) stm.close();
			if(conn!=null) conn.close();
		}
		return re.toString();
	}
	private static String getWithTypeName(int id)throws Exception
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
			rs=stm.executeQuery("select * from templateType where id="+id);
			if(rs.next())
			{
				re=rs.getString("Type");
			}
			else
			{
				re="数据错误";
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
	public static String getAllTemplateType() throws Exception
	{
		String url=null;
		StringBuffer re=new StringBuffer(500);
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
			url=Aqu.getUrl(connTmp.getConnection(),"config","url");
			rs=stm.executeQuery("select * from templatetype");
			re.append(" | ");
			while(rs.next())
			{
				re.append("<a href='"+url+"/admin/templateManage.jsp?id="+rs.getInt("Id")+"'>"+rs.getString("Type")+"</A> | ");
			}
			re.append("<a href='"+url+"/admin/templateManage.jsp?id=0'>所有模板</A> | ");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs!=null) rs.close();
			if(stm!=null) stm.close();
			if(conn!=null) conn.close();
			
		}
		return re.toString();
	}
	public static void main(String[] args)
	{
		try
		{
			System.out.println(getManage("0"));
		}
		catch(Exception e)
		{
		}
		
	}
}