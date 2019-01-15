package com.bjsxt.tomcat;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import com.bjxst.service.StudentService;

public class StudentTomcat {

	public StudentTomcat(String ID, String r,PrintWriter pri) {
		StudentService st=new StudentService();
		if("学生个人信息".equals(r)){
			pri.println(st.stuInfo(ID));
			pri.flush();
		}
		if("可选课程".equals(r)){
			List<String> list = st.searchUpCourse(ID);
			Iterator<String> it = list.iterator();
			while(it.hasNext()){
				String next = it.next();
				pri.println(next);
			}
		pri.flush();
		}
		if("已选课程".equals(r)){
			List<String> list = st.searchDownCourse(ID);
			Iterator<String> it = list.iterator();
			while(it.hasNext()){
				String next = it.next();
				pri.println(next);
				}
		pri.flush();
		}
	}
}


