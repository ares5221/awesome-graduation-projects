package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.Grade;

public interface GradeDao {

	int save(Grade grade);

	List<Grade> findAll();

	void delete(String gradeNo);

	int update(Grade grade);

	Grade findGrade(String gradeNo);

}
