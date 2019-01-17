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
import com.wy.form.InviteJobForm;
import com.wy.form.ManagerForm;

public class InviteJobAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	
	
	
	//更改录用人员属性值
	public ActionForward employeeInviteJob(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String id=request.getParameter("id");
		InviteJobForm inviteJobForm = (InviteJobForm) objectDao
		.getObjectForm("from InviteJobForm where id='" + id + "'");
		inviteJobForm.setIsstock("1");
		this.objectDao.updateObjectForm(inviteJobForm);
		return queryInviteJob(mapping, form, request, response);
	}
	
	//删除应聘人员信息
	public ActionForward deleteInviteJob(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		InviteJobForm inviteJobForm = (InviteJobForm) objectDao
				.getObjectForm("from InviteJobForm where id='" + id + "'");
		String result="删除应聘人员信息失败";
		if(objectDao.deleteObjectForm(inviteJobForm)){
			result="删除应聘人员信息成功";
		}
		request.setAttribute("result", result);
		return mapping.findForward("operationInviteJob");
	}
	
	
	// 应聘人员详细查询
	public ActionForward queryOneInviteJob(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		InviteJobForm inviteJobForm = (InviteJobForm) objectDao
				.getObjectForm("from InviteJobForm where id='" + id + "'");
		request.setAttribute("form", inviteJobForm);
		return mapping.findForward("queryOneInviteJob");
	}

	// 应聘人信息查看(包括是否录用的查看)
	public ActionForward queryInviteJob(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List list = null;
		String information = "from InviteJobForm order by id desc";
		if (request.getParameter("isstock") != null) {
			String isstock=request.getParameter("isstock");
			information = "from InviteJobForm where isstock='"
					+ isstock + "' order by id desc";			
			request.setAttribute("isstock",isstock);
		}
		list = objectDao.getObjectList(information);
		request.setAttribute("list", list);
		return mapping.findForward("queryInviteJob");
	}

	// 保存应聘人员的信息
	public ActionForward insertInviteJob(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		InviteJobForm inviteJobForm = (InviteJobForm) form;
		objectDao.insertObjectForm(inviteJobForm);
		request.setAttribute("result", "添加应聘人员信息成功");
		return mapping.findForward("operationInviteJob");
	}

}
