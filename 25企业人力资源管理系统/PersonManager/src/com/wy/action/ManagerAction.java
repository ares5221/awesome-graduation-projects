package com.wy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wy.dao.ObjectDao;
import com.wy.form.ManagerForm;

public class ManagerAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	// 用户登录操作
	public ActionForward checkManager(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		HttpSession session = request.getSession();
		ManagerForm managerform = (ManagerForm) objectDao
				.getObjectForm("from ManagerForm where account='"
						+ managerForm.getAccount() + "'");
		if (managerform == null) {
			request.setAttribute("errorNews", "您输入的账号不存在");
		} else if (!managerform.getPassword().equals(managerForm.getPassword())) {
			request.setAttribute("errorNews", "您输入的密码不正确");
		} else {
			session.setAttribute("managerform", managerform);
		}
		return mapping.findForward("checkManager");
	}

	// 用户修改操作
	public ActionForward updateManager(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		String result = "用户修改失败！！！";
		if (objectDao.updateObjectForm(managerForm))
			result = "用户修改成功！！！";
		request.setAttribute("result", result);
		return mapping.findForward("operationManager");
	}

	// 用户察看操作
	public ActionForward queryManager(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List list = objectDao
				.getObjectList("from ManagerForm where managerLevel!=1");
		request.setAttribute("list", list);
		return mapping.findForward("queryManager");
	}

	// 用户保存操作
	public ActionForward insertManager(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		ManagerForm managerform = (ManagerForm) objectDao
				.getObjectForm("from ManagerForm where account='"
						+ managerForm.getAccount() + "'");
		if (managerform == null) {
			objectDao.insertObjectForm(managerForm);
			return queryManager(mapping, form, request, response);
		} else {
			request.setAttribute("result", "您输入的账号重复，请重新输入");
			return mapping.findForward("errorManager");
		}
	}

	// 用户删除操作
	public ActionForward deleteManager(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		ManagerForm managerform = (ManagerForm) objectDao.getObjectForm("from ManagerForm where id='"
						+ request.getParameter("id") + "'");		
		objectDao.deleteObjectForm(managerform);
		return queryManager(mapping, form, request, response);		
	}

}
