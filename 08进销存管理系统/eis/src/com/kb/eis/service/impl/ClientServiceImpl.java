package com.kb.eis.service.impl;

import java.util.List;

import com.kb.eis.dao.KhInfoDao;
import com.kb.eis.dao.impl.KhInfoDaoImpl;
import com.kb.eis.pojo.KhInfo;
import com.kb.eis.service.ClientService;
import com.kb.eis.util.PageBean;

public class ClientServiceImpl implements ClientService {
	private KhInfoDao khdao = new KhInfoDaoImpl();
	/**
	 * 添加客户
	 */
	@Override
	public int add(KhInfo kh) {
		return khdao.add(kh);
	}
	/**
	 * 修改客户信息
	 */
	@Override
	public KhInfo toupdate(int khid) {
		return khdao.toupdate(khid);
	}
	/**
	 * 删除客户
	 */
	@Override
	public int delete(int khid) {
		//关于删除客户信息   不完整版
		return khdao.delete(khid);
	}
	/**
	 * 多条件分页显示客户信息
	 */
	@Override
	public List<KhInfo> show() {
		return khdao.query();
	}
	@Override
	public int update(KhInfo kh) {
		// TODO Auto-generated method stub
		return khdao.update(kh);
	}
	/**
	 * 不完整版批量删除
	 */
	@Override
	public int deletes(String[] idarr) {
		return khdao.deletes(idarr);
	}
	
	/**
	 * 查询所有客户信息
	 * @return
	 */
	public List<KhInfo> findAllClient() {
		return khdao.queryAllClient();
	}


}
