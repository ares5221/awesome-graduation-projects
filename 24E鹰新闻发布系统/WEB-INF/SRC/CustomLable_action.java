package com.v246;
import org.apache.struts.action.*;
import javax.servlet.http.*;
public class CustomLable_action extends org.apache.struts.action.Action
{
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		CustomLable_form custom=(CustomLable_form)form;
		CustomLable_bean bean=new CustomLable_bean();
		String re=null;
		String tmp=null;
		try
		{
			tmp=bean.addCustomLable(custom);//执行数据库写入并接收返回信息
			if(tmp.equals("error"))//如果返回error则查找出错页
			{
				re="customError";
			}
			else//否则查找正确页面
			{
				re="custom";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		request.setAttribute("custom",custom);
		return mapping.findForward(re);
	}
}