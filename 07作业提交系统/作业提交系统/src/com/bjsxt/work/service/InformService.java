package com.bjsxt.work.service;

import java.util.List;

import com.bjsxt.work.entity.Inform;

public interface InformService {

	public int add(Inform inform);
	public List<Inform> findAll();
	public Inform findById(int iid, String title);
	int delete(int iid);
}
