package com.v246;
public class ArticleManage_form extends org.apache.struts.action.ActionForm
{
	protected String[] articleId=null;
	public void setArticleId(String[] articleId)
	{
		this.articleId=articleId;
		for(int i=0;i<articleId.length;i++)
		{
			System.out.println(articleId[i]);
		}
	}
	public String[] getArticleId()
	{
		return articleId;
	}
}