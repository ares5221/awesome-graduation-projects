package com.bjxst.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.bjsxt.dao.StudentDao;
import com.bjsxt.entity.Course;
import com.bjsxt.entity.Student;

public class StudentService {
    
	//判断是否可以登录
	public boolean iftrue(String ID,String password) throws Exception{
		return new StudentDao().checkStudentLogin(ID, password);
	}
	
	//查看学生信息
	public String stuInfo(String id){
		String s=null;
		//首先获得一个学生对象，然后遍历他基本信息和已选课程即可		
		Student stu=null;;
		try {
			stu = new StudentDao().getStu(id);
			if(stu!=null){
				s="学生个人信息"+","+"  此学生id为:"+id+"  名称为:"+stu.getName()+"   年龄为:"+stu.getAge()+"  性别:"+stu.getSex();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	
    //选课  选择的课程加入到对应学生的id下边
	public boolean chooseCourse(String stuid,String courseid) throws Exception{
		return new StudentDao().addSelectCourse(stuid, courseid);
	}
	
	//查看已选课程
	public List<String> searchDownCourse(String id) {
		String s=null;
		List<String> li=new ArrayList<>();
		List<Course> list=null;
		try {
			list = new StudentDao().getDownCourse(id);
			if(list!=null){
				Iterator<Course> it = list.iterator();
				while(it.hasNext()){
					Course next = it.next();
					s="已选课程"+","+"已选课程id为："+next.getId()+"  名称为："+next.getName()+"  老师为："+next.getTeacher();
					li.add(s);
				}
			}else{
				s="尊敬的学霸同学，您已经选完";
				li.add(s);
			}
		} catch (Exception e) {
		}
		return li;
	}
	
	
//  查看可选课程
	public List<String> searchUpCourse(String id){
		String s=null;
		List list =null;
		List<String> li=new ArrayList<>();
		try {
			list = new StudentDao().getUpCourse(id);
			if(list!=null){
				Iterator<Course> it = list.iterator();
				while(it.hasNext()){
					Course next = it.next();
					s="可选课程"+","+"可选课程id为:"+next.getId()+" 名称为:"+next.getName()+" 老师为:"+next.getTeacher();
					li.add(s);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return li;
	}
	
	
	
}
