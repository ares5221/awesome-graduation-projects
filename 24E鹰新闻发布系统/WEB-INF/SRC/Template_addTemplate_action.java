package com.v246;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
public class Template_addTemplate_action extends org.apache.struts.action.Action
{
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		Template_addTemplate_form template=(Template_addTemplate_form)form;
		try
		{
			Template_addTemplate_bean bean=new Template_addTemplate_bean();
			if(template.getAction().equals("modify"))
			{
				bean.addTemplate(template,"modify");
			}
			else
			{
				bean.addTemplate(template,"newOne");
			}
		//	request.setAttribute("addTemplate",template);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//System.out.println(template.getContent());
		request.setAttribute("addTemplate",template);
		return mapping.findForward("addTemplate");
	}
}