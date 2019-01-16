package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.po.Dept;
import com.lhq.prj.bms.service.IDeptService;

/**
 * DeptAction.java Create on 2008-9-16 下午10:35:18
 * 
 * 部门处理
 * 
 * Copyright (c) 2008 by MTA.
 * Download by http://www.codefans.net
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class DeptAction extends BaseAction {
	private IDeptService deptService;

	private Dept dept;

	private boolean success;

	private Page page;

	private Integer deptId;

	/**
	 * 添加部门
	 * 
	 * @return
	 */
	public String saveDept() {
		deptId = (Integer) deptService.saveDept(dept);
		if (deptId != null) {
			success = true;
		}
		return SUCCESS;
	}

	/**
	 * 根据分公司查找部门
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findDeptByCompany() {
		String strCompanyId = getRequest().getParameter("companyId");
		Company company = new Company();
		if(strCompanyId != null && !"".equals(strCompanyId)){
			company.setCompanyId(Integer.valueOf(strCompanyId));
		}
		List conditions = new ArrayList();
		conditions.add(company);
		page = new Page();
		page.setConditions(conditions);
		page = deptService.findDeptByCompany(page);
		return SUCCESS;
	}

	/**
	 * 查找部门信息
	 * 
	 * @return
	 */
	public String findAllDept() {
		String strCondition = getRequest().getParameter("conditions");
		List conditions = new ArrayList();
		MyUtils.addToCollection(conditions, MyUtils.split(strCondition, " ,"));
		page = new Page();
		page.setConditions(conditions);
		int start = Integer.valueOf(getRequest().getParameter("start"));
		int limit = Integer.valueOf(getRequest().getParameter("limit"));
		page.setStart(++start);
		page.setLimit(limit = limit == 0 ? 20 : limit);
		page = deptService.findByPage(page);
		return SUCCESS;
	}

	/**
	 * 删除部门
	 * 
	 * @return
	 */
	public String deleteDept() {
		String strDeptId = getRequest().getParameter("deptId");
		if (strDeptId != null && !"".equals(strDeptId)) {
			success = deptService.deleteDept(Integer.valueOf(strDeptId));
		}
		return SUCCESS;
	}

	/**
	 * 修改部门信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateDept() throws Exception {
		String fieldName = getRequest().getParameter("fieldName");
		String strCompanyId = getRequest().getParameter("companyId");// 获得分公司id,当修改所属分公司时才有值传过来
		String fieldValue = getRequest().getParameter("fieldValue");
		String strDeptId = getRequest().getParameter("deptId");
		if (strDeptId != null && !"".equals(strDeptId)) {
			Dept dept = new Dept();
			if ("companyName".equals(fieldName) && !"".equals(strCompanyId)) {// 当修改所属分公司的时候做特殊处理
				dept.setCompanyId(Integer.valueOf(strCompanyId));
			}
			dept.setDeptId(Integer.valueOf(strDeptId));
			MyUtils.invokeSetMethod(fieldName, dept, new Object[] { fieldValue });
			success = deptService.updateDept(dept);
		}
		return SUCCESS;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
