package com.bjsxt.school.service;

import java.util.List;

import com.bjsxt.school.entity.Major;

public interface MajorService {

	public List<Major> show();

	public int addMajor(Major major);

	public List<Major> findAll();

	public void delete(String mno);

	public int updateMno(Major major);

	public Major findMajor(String mNo);
}
