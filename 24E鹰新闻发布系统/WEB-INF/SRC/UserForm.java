package com.v246;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.*;
public class UserForm extends ActionForm
{
	protected User user=new User();
	public void setUserName(String name)
	{
		user.setUserName(name);
	}
	public void setPasswords(String pass)
	{
		user.setPasswords(pass);
	}
	public String getUserName()
	{
		return user.getUserName();
	}
	public String getPasswords()
	{
		return user.getPasswords();
	}
	public User getUser()
	{
		return user;
	}
	//重新设置Form
	public void reset(ActionMapping mapping,HttpServletRequest request)
	{
		this.user=new User();
	}
	//Form有效性判断,这是城做了简化处理
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request)
	{
		ActionErrors errors=new ActionErrors();
		if(user.getUserName()==null || user.getPasswords().length()<3)
		{
			errors.add("passwords",new ActionError("error.user.passwords"));
		}
		return errors;
	}
}	