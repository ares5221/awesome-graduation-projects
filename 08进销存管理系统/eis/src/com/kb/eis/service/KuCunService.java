package com.kb.eis.service;

import java.util.List;

import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.Pojo;

public interface KuCunService {
	int add(String rkid);

	List<KuCun> queryAll();
	
}
