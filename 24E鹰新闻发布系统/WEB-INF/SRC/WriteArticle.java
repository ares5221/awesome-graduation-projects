package com.v246;
public class WriteArticle
{
	private static void write(java.sql.ResultSet rsAQU)throws Exception
	{
		int i=0;
		
		
		try
		{
			while(rsAQU.next())
			{
				Article_articleFormat articleFormat=new Article_articleFormat();
				Article_addArticle article=new Article_addArticle();
				article.setAuthor(rsAQU.getString("Author"));
				article.setClassID(String.valueOf(rsAQU.getInt("ClassId")));
				article.setContent(rsAQU.getString("Content"));
				article.setCopyFrom(rsAQU.getString("CopyFrom"));
			//	article.setDefaultPicList(rsAQU.getString("DefaultPicList"));
			//	article.setDefaultPicUrl(rsAQU.getString("DefaultPicUrl"));
			//	article.setElite(String.valueOf(rsAQU.getInt("Elite")));
			//	article.setHits(String.valueOf(rsAQU.getInt("Hits")));
			//	article.setHot(String.valueOf(rsAQU.getInt("Hot")));
			//	article.setIncludePic(String.valueOf(rsAQU.getInt("IncludePic")));
			//	article.setIntro(rsAQU.getString("Intro"));
				article.setKeyword(rsAQU.getString("Keyword"));
			//	article.setLinkUrl(rsAQU.getString("LinkUrl"));
			//	article.setMaxCharPerPage(String.valueOf(rsAQU.getInt("MaxCharPerPage")));
			//	article.setOnTop(String.valueOf(rsAQU.getBoolean("OnTop")));
			//	article.setPaginationType(String.valueOf(rsAQU.getInt("PaginationType")));
			//	article.setPassed(String.valueOf(rsAQU.getBoolean("Passed")));
			//	article.setReadPoint(String.valueOf(rsAQU.getInt("ReadPoint")));
			//	article.setShowCommentLink(String.valueOf(rsAQU.getBoolean("ShowCommentLink")));
			//	article.setSkinID(String.valueOf(rsAQU.getInt("SkinId")));
			//	article.setSpecialID(String.valueOf(rsAQU.getInt("SpecialID")));
			//	article.setStars(String.valueOf(rsAQU.getInt("Stars")));
				article.setSubheading(rsAQU.getString("Subheading"));
			//	article.setTemplateID(String.valueOf(rsAQU.getInt("TemplateID")));
				article.setTitle(rsAQU.getString("Title"));
			//	article.setTitleFontColor(rsAQU.getString("TitleFontColor"));
			//	article.setTitleFontType(rsAQU.getString("TitleFontType"));
				article.setTitleIntact(rsAQU.getString("TitleIntact"));
				article.setUpdateTime(rsAQU.getString("UpdateTime"));
				//articleFormat.start();
				articleFormat.addArticle(article);
			//	new Thread(articleFormat).start();
				
				//Thread.sleep(3000);
			//	articleFormat.start();
				//System.out.println(article.getContent());
			//	System.out.println(i++);
			}

		}
		catch(Exception e)
		{
			//rsAQU.close();
			throw new Exception("Error in WriteArticle.java NO.2 "+e.getMessage()+e.getLocalizedMessage());
			
		}
	}
	public static void writeOne(String id)throws Exception
	{

		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rsAQU=null;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
			
			throw new Exception("Error in WirteArticle.java NO.1 "+e.getMessage());
		}
		try
		{
			rsAQU=stm.executeQuery("select * from article where ArticleId="+id);
			write(rsAQU);
		}
		catch(Exception e)
		{
			
			if(rsAQU!=null)rsAQU.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
			throw new Exception("Error in WriteArticle.java NO.4 "+e.getMessage());
		}
		
		finally
		{
			if(rsAQU!=null)rsAQU.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();			
		}
		
	}
	public static void writeAll()throws Exception
	{
		java.sql.Connection conn=null;
		java.sql.Statement stm=null;
		java.sql.ResultSet rsAQU=null;
		Connections connTmp=new Connections();
		try
		{
			conn=connTmp.getConnection();
			stm=conn.createStatement();
		}
		catch(Exception e)
		{
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
			
			throw new Exception("Error in WirteArticle.java NO.1 "+e.getMessage());
		}
		try
		{
			rsAQU=stm.executeQuery("select * from article");
			//System.out.print("**************");
			write(rsAQU);
		}
		catch(Exception e)
		{
			if(rsAQU!=null)rsAQU.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
			throw new Exception("Error in WriteArticle.java NO.3 "+e.getMessage());
		}

		finally
		{
			if(rsAQU!=null)rsAQU.close();
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();			
		}
	
	}
	public static void main(String s[])
	{
		try
		{
			writeAll();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}