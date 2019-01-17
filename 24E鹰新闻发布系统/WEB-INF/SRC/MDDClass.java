package com.v246;
public class MDDClass
{
	protected static java.sql.Statement stm=null;
	public static void deleteClass(String id)throws Exception
	{
		java.sql.Connection conn=null;
		String rows[][]=null;
		AquGetRows getRows=new AquGetRows();
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDClass.java NO.1 "+e.getStackTrace());
		}
		try
		{
			rows=getRows.getRows(connTmp.getConnection(),"class");
			startDelete(rows,id);
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDClass.java NO.2 "+e.getMessage());
		}
		finally
		{
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
	}
	public static void startDelete(String rows[][],String id)throws Exception
	{
		StringBuffer okPath=null;
		Path path=new Path();
		FileManage fileManage=new FileManage();
		FullClassDir fullClass=new FullClassDir();
		try
		{
			String tmpPath=path.getPathFromClass(Path.class);//得么Path.class的绝对路径
			okPath=new StringBuffer(tmpPath);
			okPath.replace(tmpPath.indexOf("\\WEB-INF\\classes"),tmpPath.length(),"");//得到虚拟空间上的网站路径
			fileManage.deleteFile(okPath.toString()+"\\Article"+fullClass.getClassDir(Integer.parseInt(id)));
			stm.executeUpdate("delete from class where Id="+id);//删除栏目
			stm.executeUpdate("delete from article where ClassId="+id);//删除该栏目下面的所有文章
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDClass.java NO.3 "+e.getMessage());
		}
		for(int i=0;i<rows[0].length;i++) //以数据总数为循环条件
		{
			if(rows[0][i].equals(id))//如果该ID与传进来的ID稳和，那么
			{
				if(rows[4][i].equals("true"))//如果该栏目还有子栏目的话
				{
					for(int j=0;j<rows[0].length;j++)//以数据总数为循还条件，该栏目的所有子栏目
					{
						if(rows[1][j].equals(rows[0][i]))//如果当前栏目正好是该栏目的子栏目的话
						{
							startDelete(rows,rows[0][j]);//调用自己进行递归
						}
					}
				}
			}
		}
	}
}