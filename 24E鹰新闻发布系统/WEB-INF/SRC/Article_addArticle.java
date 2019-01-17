package com.v246;
/*
 *用于收集文章相关信息
 **/
public class Article_addArticle
{
	 protected CheckBox checkBox=new CheckBox();
	 protected InvertedComma ic=new InvertedComma();
	 protected String classID;   //所属栏目
	 protected String specialID;//所属专题
	 protected String includePic;//图文，组图，推荐，注意
	 protected String title;//简短标题：
	 protected String titleFontColor;//颜色
	 protected String titleFontType;//字形（黑体，加精，等)
	 protected String titleIntact;//完整标题：
	 protected String subheading;//副 标 题
	 protected String showCommentLink;//显示文章列表时在标题旁显示评论链接
	 protected String keyword;//关键字
	 protected String author;//文章作者
	 protected String copyFrom;//文章来源
	 protected String linkUrl;//转向链接
	 protected String intro;//文章简介
	 protected String content;//文章内容
	 protected String defaultPicUrl;//首页图片
	 protected String defaultPicList;//在以上次上传的图片中选定图片
	 protected String paginationType;//内容分页方式
	 protected String maxCharPerPage;//自动分页时的每页大约字符数（包含HTML标记）
	 protected String readPoint;//文章阅读点数
	 protected String onTop;//固顶文章
	 protected String hot;//热门文章
	 protected String elite;//推荐文章
	 protected String stars;//文章评分等级
	 protected String hits;//点击数初始值
	 protected String updateTime;//录入时间
	 protected String skinID;//配色风格
	 protected String templateID;//版面设计模板
	 protected String passed;//是否立即发布
	 public void setClassID(String ClassID)
	 {
	 	this.classID=ClassID;
	 }
     public String getClassID()
     {
     	return classID;
     }
     public void setSpecialID(String SpecialID)
	 {
	 	this.specialID=SpecialID;
	 }
     public String getSpecialID()
     {
     	return specialID;
     }
     public void setIncludePic(String IncludePic)
	 {
	 	this.includePic=IncludePic;
	 }
     public String getIncludePic()
     {
     	return includePic;
     }
     public void setTitle(String Title)
	 {
	 	this.title=Title;
	 }
     public String getTitle()
     {
     	return title;
     }
     public void setTitleFontColor(String TitleFontColor)
	 {
	 	this.titleFontColor=TitleFontColor;
	 }
     public String getTitleFontColor()
     {
     	return titleFontColor;
     }
     public void setTitleFontType(String TitleFontType)
	 {
	 	this.titleFontType=TitleFontType;
	 }
     public String getTitleFontType()
     {
     	return titleFontType;
     }
     public void setTitleIntact(String titleIntact)
     {
     	this.titleIntact=titleIntact;
     }
     public String getTitleIntact()
     {
     	return titleIntact;
     }
     public void setSubheading(String Subheading)
	 {
	 	this.subheading=Subheading;
	 }
     public String getSubheading()
     {
     	return subheading;
     }
     public void setShowCommentLink(String ShowCommentLink)
	 {
	 	this.showCommentLink=ShowCommentLink;
	 }
     public String getShowCommentLink()
     {
     	return showCommentLink;
     }
     public void setKeyword(String Keyword)
	 {
	 	this.keyword=Keyword;
	 }
     public String getKeyword()
     {
     	return keyword;
     }
     public void setAuthor(String author)
     {
     	this.author=author;
     }
     public String getAuthor()
     {
     	return author;
     }
     public void setCopyFrom(String copyFrom)
	 {
	 	this.copyFrom=copyFrom;
	 }
     public String getCopyFrom()
     {
     	return copyFrom;
     }
     public void setLinkUrl(String LinkUrl)
	 {
	 	this.linkUrl=LinkUrl;
	 }
     public String getLinkUrl()
     {
     	return linkUrl;
     }
     public void setIntro(String Intro)
	 {
	 	this.intro=Intro;
	 }
     public String getIntro()
     {
     	return intro;
     }
     public void setContent(String content)
	 {
	 	this.content=content;
	 }
     public String getContent()
     {
     	return content;
     }
     public void setDefaultPicUrl(String DefaultPicUrl)
	 {
	 	this.defaultPicUrl=DefaultPicUrl;
	 }
     public String getDefaultPicUrl()
     {
     	return defaultPicUrl;
     }
     public void setDefaultPicList(String DefaultPicList)
	 {
	 	this.defaultPicList=DefaultPicList;
	 }
     public String getDefaultPicList()
     {
     	return defaultPicList;
     }
     public void setPaginationType(String PaginationType)
	 {
	 	this.paginationType=PaginationType;
	 }
     public String getPaginationType()
     {
     	return paginationType;
     }
     public void setMaxCharPerPage(String MaxCharPerPage)
	 {
	 	this.maxCharPerPage=MaxCharPerPage;
	 }
     public String getMaxCharPerPage()
     {
     	return maxCharPerPage;
     }
     public void setReadPoint(String ReadPoint)
	 {
	 	this.readPoint=ReadPoint;
	 }
     public String getReadPoint()
     {
     	return readPoint;
     }
     public void setOnTop(String OnTop)
	 {
	 	this.onTop=OnTop;
	 }
     public String getOnTop()
     {
     	return onTop;
     }
     public void setHot(String Hot)
	 {
	 	this.hot=Hot;
	 }
     public String getHot()
     {
     	return hot;
     }
     public void setElite(String Elite)
	 {
	 	this.elite=Elite;
	 }
     public String getElite()
     {
     	return elite;
     }
     public void setStars(String Stars)
	 {
	 	this.stars=Stars;
	 }
     public String getStars()
     {
     	return stars;
     }
     public void setHits(String Hits)
	 {
	 	this.hits=Hits;
	 }
     public String getHits()
     {
     	return hits;
     }
     public void setUpdateTime(String UpdateTime)
	 {
	 	this.updateTime=UpdateTime;
	 }
     public String getUpdateTime()
     {
     	return updateTime;
     }
     public void setSkinID(String SkinID)
	 {
	 	this.skinID=SkinID;
	 }
     public String getSkinID()
     {
     	return skinID;
     }public void setTemplateID(String TemplateID)
	 {
	 	this.templateID=TemplateID;
	 }
     public String getTemplateID()
     {
     	return templateID;
     }public void setPassed(String Passed)
	 {
	 	this.passed=Passed;
	 }
     public String getPassed()
     {
     	return passed;
     }	 
     public String getInsert()
     {
     	
 	//	title=ic.getIC(title);
 	//	titleFontColor=ic.getIC(titleFontColor);
 	//	titleIntact=ic.getIC(titleIntact);
	//	subheading=ic.getIC(subheading);
 	//	showCommentLink=ic.getIC(showCommentLink);
	//	keyword=ic.getIC(keyword);
 	//	copyFrom=ic.getIC(copyFrom);
 	//	linkUrl=ic.getIC(linkUrl);
 	//	intro=ic.getIC(intro);
 	//	content=ic.getIC(content);
 	//	defaultPicUrl=ic.getIC(defaultPicUrl);
 	//	defaultPicList=ic.getIC(defaultPicList);
 		onTop=checkBox.getValue(onTop);
 		hot=checkBox.getValue(hot);
 		elite=checkBox.getValue(elite);
	//	stars=ic.getIC(stars);
 	//	hits=ic.getIC(hits);
 	//	updateTime=ic.getIC(updateTime);
 		passed=checkBox.getValue(passed);
 		
 		String in=new String("insert into article(ClassID,SpecialID,IncludePic,Title,TitleFontColor,TitleFontType,TitleIntact,Subheading,ShowCommentLink,Keyword,CopyFrom,LinkUrl,Intro,Content,DefaultPicUrl,PaginationType,MaxCharPerPage,ReadPoint,OnTop,Hot,Elite,Stars,Hits,UpdateTime,SkinID,TemplateID,Passed) values("+classID+","+specialID+","+includePic+","+title+","+titleFontColor+","+titleFontType+","+titleIntact+","+subheading+","+showCommentLink+","+keyword+","+copyFrom+","+linkUrl+","+intro+","+content+","+defaultPicUrl+","+paginationType+","+maxCharPerPage+","+readPoint+","+onTop+","+hot+","+elite+","+stars+","+hits+","+updateTime+","+skinID+","+templateID+","+passed+")");
     	return in;
     }	 
}