package com.v246;
import org.apache.struts.action.*;
import javax.servlet.http.*;
//Action 类
public class UserAction extends Action
{
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		UserForm f=(UserForm)form;
		try
		{
			UserBean bean=new UserBean();//UserBean连接数据库执行具体的业务逻辑
			bean.addUser(f.getUser());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		request.setAttribute("User",f.getUser());
		return (mapping.findForward("userCreated"));
	}
}