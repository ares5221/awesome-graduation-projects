package com.bjsxt.school.service.impl;

import java.util.List;

import com.bjsxt.school.dao.CourseDao;
import com.bjsxt.school.dao.impl.CourseDaoImpl;
import com.bjsxt.school.entity.Course;
import com.bjsxt.school.entity.Score;
import com.bjsxt.school.entity.TeacherCourse;
import com.bjsxt.school.service.CourseService;

public class CourseServiceImpl implements CourseService {
	private CourseDao courseDao = new CourseDaoImpl();

	@Override
	public List<Course> selectAll() {
		List<Course> course = courseDao.selectAll();
		return course;
	}

	@Override
	public int arrangeCourse(TeacherCourse teacherCourse) {
		return courseDao.arrangeCourse(teacherCourse);

	}

	@Override
	public int save(Score score) {
		return this.courseDao.save(score);
	}

	@Override
	public List<Score> showAll(String select, String text) {
		return this.courseDao.findScore(select, text);
	}

	@Override
	public int addCourse(Course course) {
		return this.courseDao.add(course);
	}

	@Override
	public void delete(String courseNo) {
		this.courseDao.delete(courseNo);
	}

	@Override
	public int update(Course course) {
		return this.courseDao.update(course);
	}

	@Override
	public List<Course> findAll() {
		return this.courseDao.findAll();
	}

	@Override
	public Course findCourse(String courseNo) {
		return courseDao.findCourse(courseNo);
	}

}
