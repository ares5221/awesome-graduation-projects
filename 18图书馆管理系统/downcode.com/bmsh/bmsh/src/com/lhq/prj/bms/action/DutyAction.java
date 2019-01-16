package com.lhq.prj.bms.action;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Duty;
import com.lhq.prj.bms.service.IDutyService;

/**
 * DutyAction.java Create on 2008-9-18 下午08:10:48
 * 
 * 职务管理
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author 廖瀚卿
 * @version 1.0
 */
@SuppressWarnings("serial")
public class DutyAction extends BaseAction {

	private IDutyService dutyService;

	private Duty duty;

	private Integer dutyId;

	private boolean success;

	private Page page;
	
	
	/**
	 * 保存职务到数据库
	 *
	 * @return
	 */
	public String saveDuty() {
		dutyId = (Integer) dutyService.saveDuty(duty);
		if (dutyId != null) {
			success = true;
		}
		return SUCCESS;
	}
	
	
	/**
	 * 查找所有职务
	 * 
	 * @return
	 */
	public String findAllDuty(){
		page = new Page();
		page.setRoot(dutyService.findAll());
		return SUCCESS;
	}


	/**
	 * 删除职务
	 * 
	 * @return
	 */
	public String deleteDuty() {
		String strDutyId = getRequest().getParameter("dutyId");
		if (strDutyId != null && !"".equals(strDutyId)) {
			success = dutyService.deleteDuty(Integer.valueOf(strDutyId));
		}
		return SUCCESS;
	}

	/**
	 * 修改职务指定字段的值
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateDuty() throws Exception {
		String fieldName = getRequest().getParameter("fieldName");
		String fieldValue = getRequest().getParameter("fieldValue");
		String strDutyId = getRequest().getParameter("dutyId");
		if (strDutyId != null && !"".equals(strDutyId)) {
			Duty c = new Duty();
			c.setDutyId(Integer.valueOf(strDutyId));
			MyUtils.invokeSetMethod(fieldName, c, new Object[] { fieldValue });
			success = dutyService.updateDuty(c);
		}
		return SUCCESS;
	}
	
	
	public Duty getDuty() {
		return duty;
	}

	public void setDuty(Duty duty) {
		this.duty = duty;
	}

	public Integer getDutyId() {
		return dutyId;
	}

	public void setDutyId(Integer dutyId) {
		this.dutyId = dutyId;
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

	public void setDutyService(IDutyService dutyService) {
		this.dutyService = dutyService;
	}
}
