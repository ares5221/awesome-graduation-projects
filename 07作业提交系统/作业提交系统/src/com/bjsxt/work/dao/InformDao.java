package com.bjsxt.work.dao;

import java.util.List;

import com.bjsxt.work.entity.Inform;

public interface InformDao {

	public int save(Inform inform);
	public List<Inform> findAll();
	public Inform findById(int iid, String title);
	int delete(int iid);
}
