package com.v246;
/*
 *本类用于得到以指定ID为条件的该栏目的全路径
 **/
public class FullClassDir
{
	protected StringAnalysis ana=new StringAnalysis();//用用分析字符串
	protected Connections connTmp=new Connections();//用于得到数据库连接
	protected String[][] rows; //用于存储指定表中的所有字段的值（行和列）
	protected AquGetRows aquGetRows=new AquGetRows();//该类用于获得指定数据表的所有行和列的值，返回一个二维数组
	protected int parentId;//父亲ID是多少
	protected String classDir="";//存储未格式化之前的栏目路径，是倒续的
	public void getRows() throws Exception //得到rows值
	{
		try
		{
			rows=aquGetRows.getRows(connTmp.getConnection(),"class");
		}
		catch(Exception e)
		{
			throw new Exception("Error in FullClassDir.class 13"+e.getMessage());
		}
	}
	public void getParentId(int id)throws Exception //得到指定ID的父亲ID是多少
	{
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rs=null;
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			throw new Exception("Error in FullClassDir 27,28 "+e.getMessage());
		}
		try
		{
			rs=stm.executeQuery("select * from class where Id="+id);
			
			if(rs.next())
			{
				parentId=rs.getInt("Id");//得到父亲ID
				if(parentId==0)
				{
					classDir=rs.getString("ClassDir");//将当前栏目的目录地址先存起来
				}
				else
				{
					classDir="";
				}
				
			}
		}
		catch(java.sql.SQLException e1)
		{
			throw new java.sql.SQLException("Error in FullClassDir.class 16-39 "+e1.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
	}
	public void getFullClassDir()//核心方法
	{
		
		
			for(int i=0;i<rows[0].length;i++) //以数据总数为查找条件
			{
				if(rows[0][i].equals(String.valueOf(parentId)))//如果当前栏目ID是指定栏目的父亲ID
				{
					classDir=classDir+"\\"+rows[3][i];//那么以存储起来
					parentId=Integer.parseInt(rows[1][i]);//将当前（找到的那个父栏目）栏目的父亲ID存储起来，再寻找该栏目的父亲ID
					break;
					
				}

			}
			if(parentId>0) //如果找到的栏目不是一级分类，那么
			{
				getFullClassDir();//进行递归，继续查找！
			}

		
	}
	public String getClassDir(int id)throws Exception
	{
		StringBuffer re=new StringBuffer(100);
		try
		{
	
			getRows();
			getParentId(id);
			if(parentId>0)
			{
				getFullClassDir();
			}
			
		}
		catch(Exception e)
		{
			throw new Exception("Error in FullClassDir.class 83-86 "+e.getMessage());
		}
		String[] tmp=ana.startAnalysis(classDir,"\\");
		for(int i=tmp.length-1;i>=0;i--)
		{
			re.append("\\"+tmp[i]);
		}
		return re.toString();
	}
	public String getClassDir(int id,String s)throws Exception //s是路径比如\abc\dir 或 /abc/dir等等
	{
		StringBuffer re=new StringBuffer(100);
		try
		{
	
			getRows();
			getParentId(id);
			getFullClassDir();
		}
		catch(Exception e)
		{
			throw new Exception("Error in FullClassDir.class 83-86 "+e.getMessage());
		}
		String[] tmp=ana.startAnalysis(classDir,"\\");
		for(int i=tmp.length-1;i>=0;i--)
		{
			re.append(s+tmp[i]);
		}
		return re.toString();
	}
	public static void main(String []args)
	{
		String tmp=null;
		FullClassDir fullClassDir=new FullClassDir();
		try
		{
			tmp=fullClassDir.getClassDir(21);
		}
		catch(Exception e)
		{
		}
		System.out.println(tmp);
	}
}