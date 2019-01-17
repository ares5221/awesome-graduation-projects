package com.v246;
import java.sql.*;
import javax.sql.*;
import java.io.*;
public class Article_addArticle_bean
{
	// protected ReplaceAll RPA=new ReplaceAll();
	 protected CheckBox checkBox=new CheckBox();
	 protected Connection conn;
	 protected Connections tmpConn=new Connections();
	 protected InvertedComma ic=new InvertedComma();
	 protected String classID;
	 protected String specialID;
	 protected String includePic;
	 protected String title;
	 protected String titleFontColor;
	 protected String titleFontType;
	 protected String titleIntact;
	 protected String subheading;
	 protected String showCommentLink;
	 protected String keyword;
	 protected String copyFrom;
	 protected String linkUrl;
	 protected String intro;
	 protected String content;
	 protected String defaultPicUrl;
	 protected String defaultPicList;
	 protected String paginationType;
	 protected String maxCharPerPage;
	 protected String readPoint;
	 protected String onTop;
	 protected String hot;
	 protected String elite;
	 protected String stars;
	 protected String hits;
	 protected String updateTime;
	 protected String skinID;
	 protected String templateID;
	 protected String passed;
	public Article_addArticle_bean() throws Exception
	{
		this.conn=tmpConn.getConnection();
	}
	public void addArticleForm(Article_addArticle article)
	{
		/*
		 *把字符串两羰加上单引号、判断复选框的状态（选中的设为1没选中的设为0),形成SQL语句并写入数据库
		 **/
		classID=article.getClassID();
		specialID=article.getSpecialID();
 		includePic=article.getIncludePic();
 		title=ic.getIC(article.getTitle());
 		titleFontColor=ic.getIC(article.getTitleFontColor());
 		titleFontType=article.getTitleFontType();
 		titleIntact=ic.getIC(article.getTitleIntact());
		subheading=ic.getIC(article.getSubheading());
 		showCommentLink=ic.getIC(article.getShowCommentLink());
		keyword=ic.getIC(article.getKeyword());
 		copyFrom=ic.getIC(article.getCopyFrom());
 		linkUrl=ic.getIC(article.getLinkUrl());
 		intro=ic.getIC(article.getIntro());
 		content=ic.getIC(article.getContent());
 		defaultPicUrl=ic.getIC(article.getDefaultPicUrl());
 		defaultPicList=ic.getIC(article.getDefaultPicList());
 		paginationType=article.getPaginationType();
 		maxCharPerPage=article.getMaxCharPerPage();
 		readPoint=article.getReadPoint();
 		onTop=checkBox.getValue(article.getOnTop());
 		hot=checkBox.getValue(article.getHot());
 		elite=checkBox.getValue(article.getElite());
		stars=ic.getIC(article.getStars());
 		hits=ic.getIC(article.getHits());
 		updateTime=ic.getIC(article.getUpdateTime());
 		skinID=article.getSkinID();
 		templateID=article.getTemplateID();
 		passed=checkBox.getValue(article.getPassed());
 		String insert=new String("insert into article(ClassID,SpecialID,IncludePic,Title,TitleFontColor,TitleFontType,TitleIntact,Subheading,ShowCommentLink,Keyword,CopyFrom,LinkUrl,Intro,Content,DefaultPicUrl,PaginationType,MaxCharPerPage,ReadPoint,OnTop,Hot,Elite,Stars,Hits,UpdateTime,SkinID,TemplateID,Passed) values("+classID+","+specialID+","+includePic+","+title+","+titleFontColor+","+titleFontType+","+titleIntact+","+subheading+","+showCommentLink+","+keyword+","+copyFrom+","+linkUrl+","+intro+","+content+","+defaultPicUrl+","+paginationType+","+maxCharPerPage+","+readPoint+","+onTop+","+hot+","+elite+","+stars+","+hits+","+updateTime+","+skinID+","+templateID+","+passed+")");
 		System.out.println(insert);
 		try
 		{
 			Statement stm=conn.createStatement();
 			stm.executeUpdate(insert);
			if(stm!=null)stm.close();
			if(conn!=null)conn.close();
 		}
 		catch(Exception e)
 		{
 			e.printStackTrace();
 		}
 		
	}
}