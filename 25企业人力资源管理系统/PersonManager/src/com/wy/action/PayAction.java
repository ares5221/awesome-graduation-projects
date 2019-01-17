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
import com.wy.form.ManagerForm;
import com.wy.form.PayForm;
import com.wy.tool.GetAutoNumber;

public class PayAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}
	//薪资删除
	public ActionForward deletePay(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String condition = "from PayForm where id='"+request.getParameter("id")+"'";
		PayForm payForm=(PayForm)objectDao.getObjectForm(condition);
		if(payForm!=null)
		objectDao.deleteObjectForm(payForm);
		return queryPay(mapping,form,request,response);
	}
	
	

	// 薪资查看
	public ActionForward queryPay(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = objectDao.getObjectList("from PayForm");	
		if(request.getParameter("emNumber")!=null){
		String emNumber= request.getParameter("emNumber");
		list = objectDao.getObjectList("from PayForm where pay_emNumber='"+emNumber+"'");	
		request.setAttribute("result1",emNumber);
		}
		if(request.getParameter("pay_month")!=null){
		String pay_month= request.getParameter("pay_month");
		list = objectDao.getObjectList("from PayForm where pay_month='"+pay_month+"'");	
		request.setAttribute("result2",pay_month);	
		}
		
		
		request.setAttribute("list", list);
		String condition = "from EmployeeForm order by id desc";
		request.setAttribute("employeeList",objectDao.getObjectList(condition));
		return mapping.findForward("queryPay");
	}

	// 转向添加新姿的页面
	public ActionForward forwardInsertPay(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		this.saveToken(request);
		String condition = "from EmployeeForm order by id desc";
		List list = objectDao.getObjectList(condition);
		request.setAttribute("employeeList",list);
		return mapping.findForward("forwardInsertPay");
	}
	// 添加薪资
	public ActionForward savePay(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PayForm payForm = (PayForm) form;
		String payCondition= "from PayForm where pay_month='"+payForm.getPay_month()+"' and pay_emNumber='"+payForm.getPay_emNumber()+"'";
		if(objectDao.getObjectForm(payCondition)!=null){
			request.setAttribute("result", "该员工已经工资已经发送完毕");
			return mapping.findForward("operationPay");
		}	
		String emCondition = "from EmployeeForm where em_serialNumber='"+payForm.getPay_emNumber()+"'";
		EmployeeForm employeeForm= (EmployeeForm)objectDao.getObjectForm(emCondition);
		payForm.setPay_emName(employeeForm.getEm_name());
		if (this.isTokenValid(request)) {
			this.resetToken(request);		
			objectDao.insertObjectForm(payForm);
		} else {
			this.saveToken(request);
		}
		return queryPay(mapping, form, request, response);
	}

	
	
	
	
	
	
	
	
	
	
}
