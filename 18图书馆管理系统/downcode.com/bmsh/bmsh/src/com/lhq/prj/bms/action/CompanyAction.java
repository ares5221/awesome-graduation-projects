package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.service.ICompanyService;

@SuppressWarnings("serial")
public class CompanyAction extends BaseAction {

	private ICompanyService companyService;

	private boolean success;

	private Company company;

	private Page page;

	private Integer companyId;

	/**
	 * 添加分公司
	 * 
	 * @return
	 */
	public String saveCompany() {
		companyId = (Integer) companyService.saveCompany(company);
		if (companyId != null) {
			success = true;
		}
		return SUCCESS;
	}
	
	/**
	 * 查找所有公司
	 * 
	 * @return
	 */
	public String findAll(){
		page = new Page();
		page.setRoot(companyService.findAll());
		return SUCCESS;
	}

	/**
	 * 根据条件分页查找公司
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findAllCompany() {
		String strCondition = getRequest().getParameter("conditions");	//获得传递过来的参数,多个参数用空格隔开
		List conditions = new ArrayList();
		MyUtils.addToCollection(conditions, MyUtils.split(strCondition, " ,"));
		page = new Page(); // 实例化分页对象
		page.setConditions(conditions);// 设置查询条件
		int start = Integer.valueOf(getRequest().getParameter("start"));
		int limit = Integer.valueOf(getRequest().getParameter("limit"));
		page.setStart(++start);
		page.setLimit(limit = limit == 0 ? 20 : limit);
		page = companyService.findByPage(page);
		if (null != page.getRoot()) {
			page.setSuccess(true);
		}
		return SUCCESS;
	}

	/**
	 * 删除公司
	 * 
	 * @return
	 */
	public String deleteCompany() {
		String strCompanyId = getRequest().getParameter("companyId");
		if (strCompanyId != null && !"".equals(strCompanyId)) {
			success = companyService.deleteCompany(Integer.valueOf(strCompanyId));
		}
		return SUCCESS;
	}

	/**
	 * 修改公司指定字段的值
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateCompany() throws Exception {
		String fieldName = getRequest().getParameter("fieldName");
		String fieldValue = getRequest().getParameter("fieldValue");
		String strCompanyId = getRequest().getParameter("companyId");
		if (strCompanyId != null && !"".equals(strCompanyId)) {
			Company c = new Company();
			c.setCompanyId(Integer.valueOf(strCompanyId));
			MyUtils.invokeSetMethod(fieldName, c, new Object[] { fieldValue });
			success = companyService.updateCompany(c);
		}
		return SUCCESS;
	}
	

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public void setCompanyService(ICompanyService companyService) {
		this.companyService = companyService;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
