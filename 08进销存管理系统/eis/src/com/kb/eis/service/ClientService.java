package com.kb.eis.service;


import java.util.List;

import com.kb.eis.pojo.KhInfo;
import com.kb.eis.util.PageBean;

public interface ClientService  {

	int add(KhInfo kh);

	KhInfo toupdate(int khid);

	int delete(int khid);

	List<KhInfo> show();

	int update(KhInfo kh);

	int deletes(String[] idarr);
	/**
	 * 查询客户信息
	 * @return
	 */
	List<KhInfo> findAllClient();

}
