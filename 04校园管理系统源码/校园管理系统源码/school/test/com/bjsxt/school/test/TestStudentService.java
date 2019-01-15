package com.bjsxt.school.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import com.bjsxt.school.entity.Student;
import com.bjsxt.school.service.StudentService;
import com.bjsxt.school.service.impl.StudentServiceImpl;

public class TestStudentService {

	private StudentService stuService = new StudentServiceImpl();

	@Test
	public void testStuRegister() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birth = null;
		try {
			birth = sdf.parse("1993-8-28");
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Student stu = new Student("20170101", "李白", "0", 24,
				"421081199308283675", birth, "中国", "18566271037", "0", "0");
		boolean flag = stuService.save(stu);
		System.out.println(flag);
	}

	@Test
	public void testStuFindById() {
		Student student = stuService.findById("20170102");
		System.out.println(student);
	}

	@Test
	public void testUpdateStu() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birth = null;
		try {
			birth = sdf.parse("1993-8-28");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Student stu = new Student("20170101", "李白", "0", 24,
				"421081199308283675", birth, "地球上的中国", "18566271037", "0", "0");
		boolean flag = stuService.update(stu);
		System.out.println(flag);
	}
	
	@Test
	public void testDeleteStu() {
		boolean flag = stuService.delete("20170103");
		System.out.println(flag);
	}
}
