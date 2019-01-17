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
import com.wy.form.EmployeeForm;
import com.wy.form.InviteJobForm;
import com.wy.form.ManagerForm;
import com.wy.tool.GetAutoNumber;

public class EmployeeAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	// 转向员工录用的页面
	
	public ActionForward forwardEmploye(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		
		String condition = "from EmployeeForm order by id desc";
		List list = objectDao.getObjectList(condition);
		String autoNumber = "1";
		if (list.size() != 0) {
			EmployeeForm employeeform = (EmployeeForm) list.get(0);
			Integer em_serialNumber = Integer.valueOf(employeeform.getId()) + 1;
			autoNumber = String.valueOf(em_serialNumber);
		}
		autoNumber = GetAutoNumber.getMaxNuber(autoNumber);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		EmployeeForm employeeForm =(EmployeeForm)form;		
		String id = request.getParameter("id");
		InviteJobForm inviteJobForm = (InviteJobForm) objectDao
					.getObjectForm("from InviteJobForm where id='" + id + "'");
			employeeForm.setEm_serialNumber(autoNumber);//将员工编号自动赋值
			employeeForm.setEm_name(inviteJobForm.getName());//将员工姓名赋值
			employeeForm.setEm_afterschool(inviteJobForm.getAfterSchool());//将员工的毕业学校自动赋值
			employeeForm.setEm_sex(inviteJobForm.getSex());//将员工的性别赋值
			employeeForm.setEm_born(inviteJobForm.getBorn());//将员工的出生日期赋值
			employeeForm.setEm_address(inviteJobForm.getAddress());//将员工地址赋值
			employeeForm.setEm_culture(inviteJobForm.getTeachSchool());//将员工的文化程度赋值
			employeeForm.setEm_tel(inviteJobForm.getTel());//将员工电话赋值
			employeeForm.setEm_speciality(inviteJobForm.getSpecialty());//将员工所学专业赋值
			request.setAttribute("employeeForm", employeeForm);
			request.setAttribute("id", id);
			return mapping.findForward("forwardEmploy");
	
	}
	//员工录用
	public ActionForward addEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeForm employeeForm = (EmployeeForm) form;
	if (this.isTokenValid(request)) {
			this.resetToken(request);
			objectDao.insertObjectForm(employeeForm);
		} else {
		this.saveToken(request);
			request.setAttribute("result", "不能重复提交！！！");
		}
	
		request.setAttribute("id", request.getParameter("id"));
		return mapping.findForward("operationEmployee");
	}
	
	
	

	// 员工查看详细信息操作
	public ActionForward queryOneEmployee(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String em_serialNumber = request.getParameter("em_serialNumber");
		String condition = "from EmployeeForm where em_serialNumber='"
				+ em_serialNumber + "'";
		EmployeeForm employeeForm = (EmployeeForm) objectDao
				.getObjectForm(condition);
		request.setAttribute("employeeForm", employeeForm);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("queryOneEmployee");
	}

	
	
	
	
	
	
	// 员工查看操作
	public ActionForward queryEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List list = null;
		String condition = "from EmployeeForm order by id desc";
		if (request.getParameter("departmentId") != null) {
			String em_departmentId = request.getParameter("departmentId");
			condition = "from EmployeeForm where em_departmentId='"
					+ em_departmentId + "' order by id desc";
			request.setAttribute("departmentId", em_departmentId);
		}
		list = objectDao.getObjectList(condition);
		request.setAttribute("list", list);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("queryEmployee");
	}

	// 转向添加员工的页面
	public ActionForward forwardInsertEmployee(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		
		String condition = "from EmployeeForm order by id desc";
		List list = objectDao.getObjectList(condition);
		String autoNumber = "1";
		if (list.size() != 0) {
			EmployeeForm employeeform = (EmployeeForm) list.get(0);
			Integer em_serialNumber = Integer.valueOf(employeeform.getId()) + 1;
			autoNumber = String.valueOf(em_serialNumber);
		}
		autoNumber = GetAutoNumber.getMaxNuber(autoNumber);
		request.setAttribute("autoNumber", autoNumber);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));


		return mapping.findForward("forwardInsertEmployee");
	}
	
	

	// 添加员工
	public ActionForward saveEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeForm employeeForm = (EmployeeForm) form;
		if (this.isTokenValid(request)) {
			this.resetToken(request);
			objectDao.insertObjectForm(employeeForm);
		} else {
			this.saveToken(request);
			request.setAttribute("result", "不能重复提交！！！");
		}
		return queryEmployee(mapping, form, request, response);
	}

	// 转向修改员工的页面
	public ActionForward forwardUpdateEmployee(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		String em_serialNumber = request.getParameter("em_serialNumber");
		String condition = "from EmployeeForm where em_serialNumber='"
				+ em_serialNumber + "'";

		EmployeeForm employeeForm = (EmployeeForm) objectDao
				.getObjectForm(condition);
		System.out.println("3213=" + employeeForm.getEm_sex());

		request.setAttribute("employeeForm", employeeForm);
		request.setAttribute("departmentList", objectDao
				.getObjectList("from DepartmentForm"));
		return mapping.findForward("forwardUpdateEmployee");
	}

	// 修改员工
	public ActionForward updateEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeForm employeeForm = (EmployeeForm) form;
		if (this.isTokenValid(request)) {
			this.resetToken(request);
			objectDao.updateObjectForm(employeeForm);
		} else {
			this.saveToken(request);
			request.setAttribute("result", "不能重复提交！！！");
		}
		return queryEmployee(mapping, form, request, response);
	}

	// 删除员工信息
	public ActionForward deleteEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String em_serialNumber = request.getParameter("em_serialNumber");
		String condition = "from EmployeeForm where em_serialNumber='"
				+ em_serialNumber + "'";
		EmployeeForm employeeForm = (EmployeeForm) objectDao
				.getObjectForm(condition);
		if (!objectDao.deleteObjectForm(employeeForm)) {
			request.setAttribute("result", "删除员工信息失败，可能还存在其他的信息");
		}
		return mapping.findForward("operationEmployee");
	}

}
