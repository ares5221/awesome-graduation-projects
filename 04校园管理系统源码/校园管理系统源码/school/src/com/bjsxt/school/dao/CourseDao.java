package com.bjsxt.school.dao;

import java.util.List;

import com.bjsxt.school.entity.Course;
import com.bjsxt.school.entity.Score;
import com.bjsxt.school.entity.TeacherCourse;

public interface CourseDao {

	List<Course> selectAll();

	int arrangeCourse(TeacherCourse teacherCourse);

	/***
	 * 成绩录入
	 * @param score
	 * @return
	 */
	int save(Score score);

	/***
	 * 成绩查询
	 * @param select
	 * @param text
	 * @return
	 */
	List<Score> findScore(String select, String text);

	int add(Course course);

	void delete(String courseNo);

	int update(Course course);

	List<Course> findAll();

	Course findCourse(String courseNo);
}
