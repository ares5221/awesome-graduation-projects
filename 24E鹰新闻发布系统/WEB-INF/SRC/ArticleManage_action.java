package com.v246;
import org.apache.struts.action.*;
import javax.servlet.http.*;
public class ArticleManage_action extends org.apache.struts.action.Action
{
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		ArticleManage_form articleManage=(ArticleManage_form)form;
		ArticleManage_bean articleBean=new ArticleManage_bean();
		try
		{
			articleBean.addArticleManage(articleManage);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return mapping.findForward("articleManage");
	}
}