package com.bjsxt.school.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.school.dao.CourseDao;
import com.bjsxt.school.entity.Book;
import com.bjsxt.school.entity.Course;
import com.bjsxt.school.entity.Score;
import com.bjsxt.school.entity.StudentBook;
import com.bjsxt.school.entity.Teacher;
import com.bjsxt.school.entity.TeacherCourse;
import com.bjsxt.school.util.DBUtils;

public class CourseDaoImpl implements CourseDao {

	@Override
	public List<Course> selectAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Course> course = new ArrayList<Course>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select t.*, t.rowid from system_course_code t";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String courseno = rs.getString("courseno");
				String coursename = rs.getString("coursename");
				Course course1 = new Course(courseno, coursename);
				course.add(course1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return course;
	}

	@Override
	public int arrangeCourse(TeacherCourse teacherCourse) {

		String sql = "insert into empl_assign_charge t values(?,?,?,?,?,?,?)";
		Object params[] = { teacherCourse.getTname(),
				teacherCourse.getClassid(), teacherCourse.getTid(),
				teacherCourse.getMajorname(), teacherCourse.getClassname(),
				teacherCourse.getLeavedate(), teacherCourse.getJobdate() };
		return DBUtils.doDML(sql, params);

	}

	@Override
	public int save(Score score) {
		String sql = "insert into COURSE_STU_INFO values (?,?,?,?,?,?,?)";
		Object[] params = { score.getSname(), score.getSno(),
				score.getCourseno(), score.getScore(), score.getExamType(),
				new java.sql.Date(score.getExamDate().getTime()),
				score.getOperator() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public List<Score> findScore(String select, String text) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Score> scoreList = new ArrayList<Score>();
		try {
			conn = DBUtils.getConnection();
			StringBuffer sql = new StringBuffer("select * "
					+ "from course_stu_info "
					+ "s join system_course_code c on"
					+ " s.courseno=c.courseno" + " where 1=1");
			if(text != null && !"".equals(text)){
				if ("sno".equals(select)) {
					sql.append(" and sno like '%"+text+"%'");
				} else if ("sname".equals(select)) {
					sql.append(" and sname like '%"+text+"%'");
				} else if ("coursename".equals(select)) {
					sql.append(" and c.coursename like '%"+text+"%'");
				}
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				String sname = rs.getString("sname");
				String sno = rs.getString("sno");
				String courseno = rs.getString("courseno");
				int score = rs.getInt("score");
				String examType = rs.getString("examType");
				Date examDate = rs.getDate("examDate");
				String operator = rs.getString("operator");
				Score score2 = new Score(sname, sno, courseno, score, examType,
						examDate, operator);

				String coursename = rs.getString("coursename");
				Course course = new Course(courseno, coursename);
				score2.setCourse(course);

				scoreList.add(score2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeAll(rs, stmt, conn);
		}
		return scoreList;
	}

	@Override
	public int add(Course course) {
		String sql = "insert into system_course_code values(?,?)";
		Object[] params = { course.getCourseno(), course.getCoursename() };
		return DBUtils.doDML(sql, params);
	}

	@Override
	public void delete(String courseNo) {
		String sql = "delete from system_course_code where courseNo =?";
		Object [] params = {courseNo};
		DBUtils.doDML(sql, params);
	}

	@Override
	public int update(Course course) {
		String sql = "update system_course_code set courseName=?  where courseNo=?";
		Object params [] = {course.getCoursename(),course.getCourseno()};
		return DBUtils.doDML(sql, params);
	}

	@Override
	public List<Course> findAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Course> courseList = new ArrayList<Course>();
		try {			
			//（和数据库）建立连接
			conn = DBUtils.getConnection();
			//（向数据库）发送命令并得到结果
			String sql ="select * from system_course_code";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			//处理结果
			while(rs.next()){
				//获取各列的数据
				String courseNo = rs.getString("courseNo");
				String courseName = rs.getString("courseName");
				//将各列的数据封装到Employee对象中
				Course course = new Course(courseNo, courseName);
				courseList.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtils.closeAll(rs, stmt, conn);
		}
		//返回数据
		return courseList;
	}

	@Override
	public Course findCourse(String courseNo) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Course course = null;
		try {			
			//（和数据库）建立连接
			conn = DBUtils.getConnection();
			//（向数据库）发送命令并得到结果
			String sql ="select * from system_course_code where courseNo = "+courseNo;
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			//处理结果
			if(rs.next()){
				//获取各列的数据
				String courseName = rs.getString("courseName");
				//将各列的数据封装到Employee对象中
				course = new Course(courseNo, courseName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			//关闭资源
			DBUtils.closeAll(rs, stmt, conn);
		}
		//返回数据
		return course;
	}

}
