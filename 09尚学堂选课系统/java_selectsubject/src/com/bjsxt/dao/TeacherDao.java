package com.bjsxt.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.bjsxt.entity.Course;
import com.bjsxt.entity.Student;
import com.bjsxt.entity.Teacher;
import com.bjsxt.utils.Utils;
/*
 * 得到与老师操作相关的xml解析数据
 *     
 *  
 */
public class TeacherDao {
	
	 SAXReader reader=new SAXReader();
	
	/**
	 * 
	 * @param id   通过用户的id,来找到该id对应的老师
	 * @param name 用户输入的姓名
	 * @param password 用户输入的密码
	 * @return    返回一个boolean类型，用于判断用户输入是否正确
	 * @throws DocumentException 可能文件不存在
	 */
    public boolean Validate(String id,String password) throws DocumentException{
    	Document doc = reader.read(new File("userXML.xml"));
    	Element root = doc.getRootElement();
    	Element teacher = root.elementByID(id);
    	if(teacher==null){
    		return false;
    	}
    	Element element = teacher.element("name");
    	if(teacher.elementText("password").equals(password)){
    		return true;
    	}
    	return false;
    }
	/**
	 * 
	 * @return 返回老师的集合
	 * @throws DocumentException 文件没找到
	 */
	public List<Teacher> getTeaList() throws DocumentException{
		List<Teacher> teaList=new ArrayList<>();
		Document doc = reader.read(new File("userXML.xml"));
		Element root = doc.getRootElement();
		Element teachers = root.elementByID("2");
		List teacher = teachers.elements();
		Iterator iterator = teacher.iterator();
		while(iterator.hasNext()){
			Element next = (Element) iterator.next();
			String id = next.attributeValue("ID");
			String name = next.elementText("name");
			String password = next.elementText("password");
			String age = next.elementText("age");
			String sex= next.elementText("sex");
			String course = next.elementText("course");
			Teacher t=new Teacher(id, name,password, age, sex, course);
			teaList.add(t);
		}
		return teaList;
	}
	
	
	
	
	
	 //解析课程的xml,并返回一个Documnet对象
	public Document praseCourseXML() throws DocumentException{
		Document doc= reader.read(new File("courseXML.xml"));
		return doc;
	}
	public static void main(String[] args) {
		try {
			List<String> s = new TeacherDao().praseCourseViewXml("2223");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//解析已选课程的XML，然后遍历已选课程中学生ID下的课程中老师的ID此老师的ID进行比较
	//如果相等，就把这个学生的ID加进列表中
	public List<String> praseCourseViewXml(String id) throws DocumentException{
		//解析学生课程xml CourseviewXml
		Document read = reader.read(new File("CourseViewXml.xml"));
		//根节点
		Element root = read.getRootElement();
		//遍历已选课程
		Iterator CourseUp = root.element("CourseDown").elementIterator();
		List<String> list=new ArrayList<>();
		while(CourseUp.hasNext()){
			boolean b=false;
			 //学生节点
			  Element students = (Element) CourseUp.next();
			  //获得已选课程的学生ID
			  String ID = students.attributeValue("ID");
			   Iterator iterator = students.elementIterator();
			   //通过遍历所有课程找到该学生的ID
			   while(iterator.hasNext()){
				  //课程节点
				  Element teacher = (Element) iterator.next();
		           if(id.equals(teacher.element("teacher").attributeValue("ID"))){
		        	  b=true;
		        	  break;
		        	
		          }
			   }
			   //每一次的遍历，都将找到的学生的id加入到结合中
			   if(b){
				   list.add(ID);
			   }
			}
	     return list;
	}

	
	// 获得所有学生信息
	public List<Student> getStudents() throws DocumentException{
		//解析某个学号的学生信息
		Document doc = reader.read(new File("userXML.xml"));
    	Element root = doc.getRootElement();
		Element students = root.elementByID("1");
		Iterator student = students.elementIterator();
		//用来装所有的学生
		List<Student> list=new ArrayList<>();
		while(student.hasNext()){
			Element stu = (Element) student.next();
			String ID = stu.attributeValue("ID");
			String name = stu.elementText("name");
			String password = stu.elementText("password");
			String age = stu.elementText("age");
			String sex= stu.elementText("sex");
			Student s=new Student(ID, name, password, age, sex);
			list.add(s);
		}
		
		return list;
	}
	
	
	// 添加的那个老师的id   给这个老师添加课程
	public void addCourseOfTeacher(String ID,String course) throws DocumentException{
		Document doc = reader.read(new File("userXML.xml"));
    	 Element root = doc.getRootElement();
    	 Element teacher = root.elementByID(ID);
		 Element Ecourse = teacher.element("course");
		 String text = Ecourse.getText();
		 if("暂无课程".equals(text)){
			 Ecourse.setText(course);
		 }else{
			 Ecourse.setText(text+"  "+course);
		 }
		 //写到文件中
		 Utils.ToXml(new File("userXML.xml") , doc);
		 
     }
	
	
	
	// 获得所有课程
	public List<Course> parseCxml() throws DocumentException{
		Document doc = reader.read(new File("courseXML.xml"));
		Element root = doc.getRootElement();
		Iterator courses = root.elementIterator();
		List<Course> list=new ArrayList<>();
		while(courses.hasNext()){
			Element course = (Element) courses.next();
			String courseID = course.attributeValue("ID");
			String courseName = course.elementText("name");
			String teacher = course.elementText("teacher");
			String teacherID = course.element("teacher").attributeValue("ID");
			Course c=new Course(courseID, courseName, teacher, teacherID);
			list.add(c);
		} 
		return list;
	}
	
	
}
