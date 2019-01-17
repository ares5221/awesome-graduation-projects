package com.v246;
/*
 *接收由视图发过来的各项属性的值，并写入用于表示数据的类Article_addArticle中
 **/
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.*;
public class Article_addArticle_form extends ActionForm
{
	 protected ReplaceAll replace=new ReplaceAll();
	 protected GB gb=new GB();
	 protected Article_addArticle article=new Article_addArticle();

	public void setClassID(String ClassID)
	 {
	 	article.setClassID(ClassID);
	 }
     public String getClassID()
     {
     	return article.getClassID();
     }
     public void setSpecialID(String SpecialID)
	 {
	 	article.setSpecialID(SpecialID);
	 }
     public String getSpecialID()
     {
     	return article.getSpecialID();
     }
     public void setIncludePic(String IncludePic)
	 {
	 	article.setIncludePic(IncludePic);
	 }
     public String getIncludePic()
     {
     	return article.getIncludePic();
     }
     public void setTitle(String Title)
	 {
	 	Title=gb.getGB(Title);
	 	Title=replace.replaceAll(Title,"'","&#039;");
	 	Title=replace.replaceAll(Title,"\"","&#034;");
	 	article.setTitle(Title);
	 }
     public String getTitle()
     {
     	return article.getTitle();
     }
     public void setTitleFontColor(String TitleFontColor)
	 {
	 	article.setTitleFontColor(TitleFontColor);
	 }
     public String getTitleFontColor()
     {
     	return article.getTitleFontColor();
     }
     public void setTitleFontType(String TitleFontType)
	 {
	 	article.setTitleFontType(TitleFontType);
	 }
     public String getTitleFontType()
     {
     	return article.getTitleFontType();
     }
     public void setTitleIntact(String titleIntact)
     {
     	titleIntact=gb.getGB(titleIntact);
	 	titleIntact=replace.replaceAll(titleIntact,"'","&#039;");
	 	titleIntact=replace.replaceAll(titleIntact,"\"","&#034;");
     	article.setTitleIntact(titleIntact);
     }
     public String getTitleIntact()
     {
     	return article.getTitleIntact();
     }
     public void setSubheading(String Subheading)
	 {
	 	Subheading=gb.getGB(Subheading);
	 	Subheading=replace.replaceAll(Subheading,"'","&#039;");
	 	Subheading=replace.replaceAll(Subheading,"\"","&#034;");
	 	article.setSubheading(Subheading);
	 }
     public String getSubheading()
     {
     	return article.getSubheading();
     }
     public void setShowCommentLink(String ShowCommentLink)
	 {
	 	article.setShowCommentLink(ShowCommentLink);
	 }
     public String getShowCommentLink()
     {
     	return article.getShowCommentLink();
     }
     public void setKeyword(String Keyword)
	 {
	 	Keyword=gb.getGB(Keyword);
	 	Keyword=replace.replaceAll(Keyword,"'","&#039;");
	 	Keyword=replace.replaceAll(Keyword,"\"","&#034;");
	 	article.setKeyword(Keyword);
	 }
     public String getKeyword()
     {
     	return article.getKeyword();
     }
     public void setAuthor(String author)
     {
     	author=gb.getGB(author);
	 	author=replace.replaceAll(author,"'","&#039;");
	 	author=replace.replaceAll(author,"\"","&#034;");
     	article.setAuthor(author);
     }
     public String getAuthor()
     {
     	return article.getAuthor();
     }
     public void setCopyFrom(String copyFrom)
	 {
	 	copyFrom=gb.getGB(copyFrom);
	 	copyFrom=replace.replaceAll(copyFrom,"'","&#039;");
	 	copyFrom=replace.replaceAll(copyFrom,"\"","&#034;");
	 	article.setCopyFrom(copyFrom);
	 }
     public String getCopyFrom()
     {
     	return article.getCopyFrom();
     }
     public void setLinkUrl(String LinkUrl)
	 {
	 	article.setLinkUrl(LinkUrl);
	 }
     public String getLinkUrl()
     {
     	return article.getLinkUrl();
     }
     public void setIntro(String Intro)
	 {
	 	Intro=gb.getGB(Intro);
	 	Intro=replace.replaceAll(Intro,"'","&#039;");
	 	Intro=replace.replaceAll(Intro,"\"","&#034;");
	 	article.setIntro(Intro);
	 }
     public String getIntro()
     {
     	return article.getIntro();
     }
     public void setContent(String content)
	 {
	 	content=gb.getGB(content);
	 //	content=replace.replaceAll(content,"'","&#039;");
	 //	content=replace.replaceAll(content,"\"","&#034;");
	 	article.setContent(content);
	 }
     public String getContent()
     {
     	return article.getContent();
     }
     public void setDefaultPicUrl(String DefaultPicUrl)
	 {
	 	DefaultPicUrl=gb.getGB(DefaultPicUrl);
	 	DefaultPicUrl=replace.replaceAll(DefaultPicUrl,"'","&#039;");
	 	DefaultPicUrl=replace.replaceAll(DefaultPicUrl,"\"","&#034;");
	 	article.setDefaultPicUrl(DefaultPicUrl);
	 }
     public String getDefaultPicUrl()
     {
     	return article.getDefaultPicUrl();
     }
     public void setDefaultPicList(String DefaultPicList)
	 {
	 	article.setDefaultPicList(DefaultPicList);
	 }
     public String getDefaultPicList()
     {
     	return article.getDefaultPicList();
     }
     public void setPaginationType(String PaginationType)
	 {
	 	article.setPaginationType(PaginationType);
	 }
     public String getPaginationType()
     {
     	return article.getPaginationType();
     }
     public void setMaxCharPerPage(String MaxCharPerPage)
	 {
	 	article.setMaxCharPerPage(MaxCharPerPage);
	 }
     public String getMaxCharPerPage()
     {
     	return article.getMaxCharPerPage();
     }
     public void setReadPoint(String ReadPoint)
	 {
	 	article.setReadPoint(ReadPoint);
	 }
     public String getReadPoint()
     {
     	return article.getReadPoint();
     }
     public void setOnTop(String OnTop)
	 {
	 	article.setOnTop(OnTop);
	 }
     public String getOnTop()
     {
     	return article.getOnTop();
     }
     public void setHot(String Hot)
	 {
	 	article.setHot(Hot);
	 }
     public String getHot()
     {
     	return article.getHot();
     }
     public void setElite(String Elite)
	 {
	 	article.setElite(Elite);
	 }
     public String getElite()
     {
     	return article.getElite();
     }
     public void setStars(String Stars)
	 {
	 	article.setStars(Stars);
	 }
     public String getStars()
     {
     	return article.getStars();
     }
     public void setHits(String Hits)
	 {
	 	article.setHits(Hits);
	 }
     public String getHits()
     {
     	return article.getHits();
     }
     public void setUpdateTime(String UpdateTime)
	 {
	 	article.setUpdateTime(UpdateTime);
	 }
     public String getUpdateTime()
     {
     	return article.getUpdateTime();
     }
     public void setSkinID(String SkinID)
	 {
	 	article.setSkinID(SkinID);
	 }
     public String getSkinID()
     {
     	return article.getSkinID();
     }public void setTemplateID(String TemplateID)
	 {
	 	article.setTemplateID(TemplateID);
	 }
     public String getTemplateID()
     {
     	return article.getTemplateID();
     }public void setPassed(String Passed)
	 {
	 	article.setPassed(Passed);
	 }
     public String getPassed()
     {
     	return article.getPassed();
     }
     public Article_addArticle getArticle()
     {
     	return this.article;
     }
     public String getInsert()
     {
     	return article.getInsert();
     }
}