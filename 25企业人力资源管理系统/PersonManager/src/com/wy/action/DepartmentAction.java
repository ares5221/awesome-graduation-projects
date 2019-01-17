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
import com.wy.form.DepartmentForm;
import com.wy.form.ManagerForm;

public class DepartmentAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	// 部门察看操作
	public ActionForward queryDepartment(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = objectDao.getObjectList("from DepartmentForm order by id desc");
		request.setAttribute("list", list);
		request.setAttribute("employeeList", objectDao.getObjectList("from EmployeeForm"));
		return mapping.findForward("queryDepartment");
	}

	// 部门信息保存
	public ActionForward insertDepartment(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		DepartmentForm departmentForm = (DepartmentForm) form;
		DepartmentForm departmentform = (DepartmentForm)objectDao
				.getObjectForm("from DepartmentForm where dt_name='"
						+ departmentForm.getDt_name() + "'");
		if (departmentform== null) {
			objectDao.insertObjectForm(departmentForm);
			return queryDepartment(mapping, form, request, response);
		} else {
			request.setAttribute("result", "不能够重复提交！！！");
			return mapping.findForward("operationDepartment");
		}
	}
	//部门信息删除
	public ActionForward deleteDepartment(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		DepartmentForm departmentform = (DepartmentForm)objectDao
		.getObjectForm("from DepartmentForm where id='"
				+ request.getParameter("id") + "'");	
		if(objectDao.deleteObjectForm(departmentform)){			
		}else{
			request.setAttribute("result", "删除部门信息失败！！！");
		
		}
		return mapping.findForward("operationDepartment");
		
	}
	
	
	
}
