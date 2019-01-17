package com.v246;
public class ArticleManage_bean
{
	protected java.sql.Connection conn=null;
	protected java.sql.Statement stm=null;
	protected Connections connTmp=new Connections();
	public void addArticleManage(ArticleManage_form articleManage)throws Exception
	{
		String[] articleId=articleManage.getArticleId();
		if(articleId!=null)
		{
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
				for(int i=0;i<articleId.length;i++)
				{
						stm.executeUpdate("delete from article where articleId="+articleId[i]);
				}
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

	}
}