package com.bjsxt.school.service;

import java.util.List;

import com.bjsxt.school.entity.Course;
import com.bjsxt.school.entity.Score;
import com.bjsxt.school.entity.TeacherCourse;

public interface CourseService {

	List<Course> selectAll();

	int arrangeCourse(TeacherCourse teacherCourse);

	/***
	 * ³É¼¨Â¼Èë
	 * @param score
	 * @return
	 */
	int save(Score score);




	int addCourse(Course course);

	void delete(String courseNo);

	List<Course> findAll();

	int update(Course course);

	List<Score> showAll(String select, String text);

	Course findCourse(String courseNo);
}
