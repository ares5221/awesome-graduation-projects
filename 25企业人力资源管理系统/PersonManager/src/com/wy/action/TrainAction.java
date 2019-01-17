package com.wy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wy.dao.ObjectDao;
import com.wy.form.TrainForm;

public class TrainAction extends DispatchAction {
	private ObjectDao objectDao;

	public ObjectDao getObjectDao() {
		return objectDao;
	}

	public void setObjectDao(ObjectDao objectDao) {
		this.objectDao = objectDao;
	}

	// ≈‡—µ≤Ïø¥≤Ÿ◊˜
	public ActionForward queryTrain(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = objectDao.getObjectList("from TrainForm order by id desc");
		request.setAttribute("list", list);
		return mapping.findForward("queryTrain");
	}

	
	// ÃÌº”≈‡—µ≤Ÿ◊˜
	public ActionForward deleteTrain(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String id=request.getParameter("id");
		TrainForm trainForm=(TrainForm)objectDao.getObjectForm("from TrainForm where id='"+id+"'");
		this.objectDao.deleteObjectForm(trainForm);
		return this.queryTrain(mapping, form, request, response);
	}

	//ÃÌº”≈‡—µ≤Ÿ◊˜
	public ActionForward saveTrain(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		TrainForm trainForm=(TrainForm)form;
		this.objectDao.insertObjectForm(trainForm);
		return mapping.findForward("operationTrain");
	}
	
	//≈‡—µœÍœ∏≤È—Ø
	public ActionForward queryOneTrain(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String id=request.getParameter("id");
		TrainForm trainForm=(TrainForm)objectDao.getObjectForm("from TrainForm where id='"+id+"'");
		request.setAttribute("trainForm", trainForm);
		return mapping.findForward("queryOneTrain");
	}
	
}
