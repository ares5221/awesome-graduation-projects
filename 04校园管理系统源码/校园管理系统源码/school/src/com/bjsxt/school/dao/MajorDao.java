package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.Major;

public interface MajorDao {

	public List<Major> findAll();
	
	public int save(Major major);

	public void deleteMno(String mno);

	public int updateMno(Major major);

	public Major findMajor(String mNo);
}
