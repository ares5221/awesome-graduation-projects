package com.kb.eis.service;

import com.kb.eis.pojo.CG;

public interface CGService {

	int add(CG cg);

	CG queryByID(String id);

	int update(CG cg);


}
