package com.v246;
public class Class_addClass_action extends org.apache.struts.action.Action
{
	public org.apache.struts.action.ActionForward execute(org.apache.struts.action.ActionMapping mapping,org.apache.struts.action.ActionForm form,javax.servlet.http.HttpServletRequest request,javax.servlet.http.HttpServletResponse response)
	{
		String re=null;
		Class_addClass_form classesForm=(Class_addClass_form)form;
		try
		{
			Class_addClass_bean bean=new Class_addClass_bean();
			re=bean.addClass(classesForm.getClasses());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		request.setAttribute("classes",classesForm.getClasses());
		return mapping.findForward(re);
	}
}