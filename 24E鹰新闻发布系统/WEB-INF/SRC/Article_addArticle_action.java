package com.v246;
import org.apache.struts.action.*;
import javax.servlet.http.*;

public class Article_addArticle_action extends Action
{
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		Article_addArticle_form addForm=(Article_addArticle_form)form;
		try
		{
			Article_articleFormat articleFormat=new Article_articleFormat();
			Article_addArticle_bean articleBean=new Article_addArticle_bean();
			articleBean.addArticleForm(addForm.getArticle());
			articleFormat.addArticle(addForm.getArticle());
			String tmp=WriteIndex.writeIndex();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return (mapping.findForward("addArticle"));
	}
}