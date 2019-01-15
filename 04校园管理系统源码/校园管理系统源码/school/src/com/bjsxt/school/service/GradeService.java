package com.bjsxt.school.service;

import java.util.List;

import com.bjsxt.school.entity.Grade;

public interface GradeService {

	int addGrade(Grade grade);

	List<Grade> findAll();

	void delete(String gradeNo);

	int updateMno(Grade grade);

	Grade findGrade(String gradeNo);

}
