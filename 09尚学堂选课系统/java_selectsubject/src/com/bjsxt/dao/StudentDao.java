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
import com.bjsxt.utils.Utils;

public class StudentDao {
	
	//判断学生登录的方法
	public boolean checkStudentLogin(String ID,String password) throws Exception{
		//解析所有的  然后我们传进去了一个ID
		Document read = new SAXReader().read(new File("userXML.xml"));
		Element e = read.elementByID("1");
		Iterator<Element> it = e.elementIterator();
		while(it.hasNext()){
		Element next = it.next();
			String id = next.attributeValue("ID");
			String thispassword=next.elementText("password");
			if(thispassword.equals(password)&&id.equals(ID)){
				return true;
			}
			}
			return false;
			
			
	}
	//根据所给id返回一个学生对象
	public Student getStu(String iD) throws Exception{
		Student stu;
		stu=new Student();
		//解析	
		Document read = new SAXReader().read(new File("userXML.xml"));
		Element e = read.elementByID(iD);//获得指定学生的id
		stu.setID(iD);
		stu.setCourseDown(getDownCourse(iD));
		stu.setCourseUp(getUpCourse(iD));
		stu.setName(e.elementText("name"));
		stu.setAge(e.elementText("age"));
		stu.setPassword(e.elementText("password"));
		stu.setSex(e.elementText("sex"));
		return stu;
	}

	

	//获得已选课程
	public List getDownCourse(String iD) throws Exception{
		//解析课程xml
		Document read = new SAXReader().read(new File("CourseViewXML.xml"));
		//首先遍历list获得每个学生相对应的ID，然后根据ID再去找寻对应的课程放入已选课程中
		List<Course> listc=new ArrayList<>();
			Element ele = read.getRootElement();
			List<Element> el = ele.elements();
			 Element elem= el.get(1);
			 Element e = elem.elementByID(iD);
			if(e!=null){
			Iterator<Element> it = e.elementIterator();
			while(it.hasNext()){
				Element n = it.next();
				//根据对应学生的ID获得他课程的ID,名称,老师，最大数  添加进课程这个对象
				String id=n.attributeValue("ID");
				String name=n.elementText("name");
				String tname=n.elementText("teacher");
				String tID=n.element("teacher").attributeValue("ID");
				Course course = new Course(id,name,tname,tID);
				listc.add(course);
			}
			}else{
				Course course = new Course("无","无","无","无");
				listc.add(course);
			}
		return listc;
	}
	public void xuane(String iD) throws Exception{
		
		}
		
		
		
	
	
	//获得可选课程
	public List getUpCourse(String iD) throws Exception{
		String id=null;
		String name=null;
		String teacher=null;
		String teaid=null;
		//定义一个链表保存已选课程
		List<Course> list=new ArrayList<>();
		//首先解析所有课程  然后根据可选课程的遍历跟所有课程相比较，没有的就装在集合中
		Document read = new SAXReader().read(new File("courseXML.xml"));
		//获得所有已选课程
		List<Course> dc = new StudentDao().getDownCourse(iD);
		List<String> l=new ArrayList<>();
		//获得所有课程
		Element root = read.getRootElement();
		List<Element> e = root.elements();
		Iterator<Element> it = e.iterator();
		Iterator<Course> i = dc.iterator();
		while(i.hasNext()){
			Course next = i.next();
			String s=next.getId();
			l.add(s);
			}
		while(it.hasNext()){
			Element next = it.next();
			id=next.attributeValue("ID");
			name=next.elementText("name");
			teacher=next.elementText("teacher");
			teaid=next.element("teacher").attributeValue("ID");
			//如果id不相等，那么就把课程加进去
			if(!l.contains(id)){
			Course c=new Course();
			c.setId(id);
			c.setName(name);
			c.setTeacher(teacher);
			c.setTeaId(teaid);
			list.add(c);
			}
			
		}
		return list;
		
	}
		
	
	//选课方法
	public boolean addSelectCourse(String stuid,String courseid) throws Exception{
		//添加课程
		String teaID=null;
		String name=null;
		String teacher=null;
		Course next=null;
		//获得可选课程，然后在可选课程中将课程的ID与传过来的id进行比较，相同的添加进去，再在已选课程中添加即可
		//获得可选课程
		List<Course> stulist = getUpCourse(stuid);
		//准备遍历可选课程
		Iterator<Course> stuli = stulist.iterator();
		int i=0;	
		while(stuli.hasNext()){
			next = stuli.next();
					//当传过来的课程id等于可选课程的ID时 就添加然后返回
					if(courseid.equals(next.getId())){
						name=next.getName();
						teacher=next.getTeacher();
						teaID=next.getTeaId();
						break;
					}
					i++;
				}
		if(i==stulist.size()){
			return false;
		}
		File file=new File("CourseViewXML.xml");
		Document read = new SAXReader().read(file);
		Element root = read.getRootElement();
		//根节点		
		List<Element> list = root.elements();
		//获得是否是添加
		Element element = list.get(1);
		Element elemen  = list.get(0);
		//在已选课中找到对应的学生
		Element stu = element.elementByID(stuid);
		if(stu==null){
			Element e = element.addElement("Student");
			e.addAttribute("ID", stuid);
			Element st = element.elementByID(stuid);
			//在学生下边添加课程
			Element c = st.addElement("course");
			c.addAttribute("ID",courseid);
			c.addElement("name").setText(name);
			Element t = c.addElement("teacher");
			t.setText(teacher);
			t.addAttribute("ID", teaID);
			//在可选课程中，学生下边删除对应的课程
			Element dstu = elemen.elementByID(stuid);
			//找到对应的课程
			Element course = dstu.elementByID(courseid);
			course.detach();
			new Utils().ToXml(file, read);
			
		}else{
		//在学生下边添加课程
			Element c = stu.addElement("course");
			c.addAttribute("ID",courseid);
			c.addElement("name").setText(name);
			Element t = c.addElement("teacher");
			t.setText(teacher);
			t.addAttribute("ID", teaID);
			//在可选课程中，学生下边删除对应的课程
			Element dstu = elemen.elementByID(stuid);
			//找到对应的课程
			Element course = dstu.elementByID(courseid);
			if(course!=null){
			course.detach();
			}
			new Utils().ToXml(file, read);
		}
		return true;		
	}
}
	



