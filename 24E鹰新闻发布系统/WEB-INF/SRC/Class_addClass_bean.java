package com.v246;
public class Class_addClass_bean
{
	protected String re=null;
	protected InvertedComma ic=new InvertedComma();
	protected String parentID; //所属栏目
	protected String className; //框目名称
	protected String classDir;  //栏目目录
	protected String maxPerPage;//每页显示的文章数
	protected boolean flag;
	protected java.sql.Connection conn=null;
	protected Connections connTmp=new Connections();
	protected java.sql.Statement stm=null;
	protected java.sql.Statement stm1=null;
	protected java.sql.ResultSet rs=null;
	protected java.sql.ResultSet rs1=null;
	public Class_addClass_bean()throws Exception
	{
		this.conn=connTmp.getConnection();
	}
	public String addClass(Class_addClass classes)throws Exception
	{
		parentID=classes.getParentID();
		className=ic.getIC(classes.getClassName());
		classDir=ic.getIC(classes.getClassDir());
		maxPerPage=classes.getMaxPerPage();
		String updateChildNum="update class set ChildNum=ChildNum+1 where Id="+parentID;
		String updateFlag="update class set Flag=1 where Id="+parentID;
		String insert="insert into class(Title,ClassDir,MaxPerPage,ParentID) values("+className+","+classDir+","+maxPerPage+","+parentID+")";
		conn=connTmp.getConnection();
		stm=conn.createStatement();
		stm1=conn.createStatement();
		rs=stm.executeQuery("select * from class where Title="+className);
		rs1=stm1.executeQuery("select * from class where ClassDir="+classDir);
		if(rs.next())
		{
			re="alreadyHaveClassName";
		}
		else if(rs1.next())
		{
			
			re="alreadyHaveClassDir";
		}
		else
		{
	
			try
			{
				
				if(parentID.equals("0")) //如果为一级分类，则什么也不做
				{
				}
				else
				{
					rs=stm.executeQuery("select * from class where Id="+parentID);//如果不是一级分类，则查找他的父类
					if(rs.next())
					{
						flag=rs.getBoolean("Flag");//得到其父类是否有下级目录true or false
					}	
				}
			}
			catch(java.sql.SQLException e2)
			{
				throw new java.sql.SQLException("Error in Class_addClass_bean 30-33"+e2.getMessage());
			}
			try
			{
				stm.executeUpdate(insert);//写入数据
				stm.executeUpdate(updateChildNum);//升级其父类的孩子数
				if(!flag)//如果该标志为否，也就是说原先在该分类下面没有下级分类，则
				{
					stm.executeUpdate(updateFlag);//升级该标志，使其为true
				}
				re="addClass";
			}
			catch(Exception e)
			{
				throw new Exception("insert data error in Class_addClass_bean 41-46"+e.getMessage());
			}
		}
		try
		{
			if(rs1!=null)rs.close();
			if(rs!=null)rs.close();
			if(stm1!=null)stm.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(rs1!=null)rs.close();
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(stm1!=null)stm.close();
			if(conn!=null)conn.close();
		}
		return re;
	}

}