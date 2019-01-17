package com.v246;
public class MDDArticle
{
	public static void deleteArticle(String id)throws Exception
	{
		FileManage fileManage=new FileManage();
		String filePath=null;
		FormatTimeToArticleName formatName=new FormatTimeToArticleName();
		String fileName=null;
		FullClassDir fullClass=new FullClassDir();
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
			throw new Exception("error in MDDArticle.java NO.1 "+e.getMessage());
		}
		try
		{
			rs=stm.executeQuery("select * from article where ArticleID="+id);
			if(rs.next())
			{
				Path path=new Path();
				String tmpPath=path.getPathFromClass(Path.class);//得么Path.class的绝对路径
				StringBuffer okPath=okPath=new StringBuffer(tmpPath);
				okPath.replace(tmpPath.indexOf("\\WEB-INF\\classes"),tmpPath.length(),"");//得到虚拟空间上的栏目相对路径
				fileName=formatName.format(rs.getString("UpdateTime"));//将时间格式化成文件名
				filePath=fullClass.getClassDir(rs.getInt("ClassId"));//得么该栏目的相对路径
				okPath.append("\\Article");
				okPath.append(filePath);
				okPath.append("\\");
				okPath.append(fileName.substring(0,4));
				okPath.append("\\");
				okPath.append(fileName.substring(4,6));
				okPath.append("\\");
				okPath.append(fileName);
				fileManage.deleteFile(okPath.toString());//最终的完整路径
				System.out.println(okPath);
				stm.execute("delete from article where ArticleID="+id);
			}
		}
		catch(Exception e)
		{
			throw new Exception("Error in MDDArticle.java NO.2 "+e.getMessage());
		}
		finally
		{
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
		}
	}
}