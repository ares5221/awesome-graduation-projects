package myServer;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import entity.Student;
import entity.Subject;
import parseXML.ParseStudentXML;
import parseXML.ParseSubjectXML;
import util.QuestionOperation;
import util.StudentOperation;
import util.SubjectOperation;

public class FunctionOfTeacher {
	private Socket socket;
	BufferedReader br = null;
	PrintWriter pw = null;
	
	public FunctionOfTeacher(Socket socket){
		this.socket = socket;
		try {
			//初始化缓冲的输入输出流
			br = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
			pw = new PrintWriter(this.socket.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成删除科目的功能
	public void deleteSubject(String subject){
		//获得解析对象
		ParseSubjectXML psubxml = new ParseSubjectXML();
		//创建一个List集合   存放科目集合
		List<Subject> list = null;
		//创建一个记号标签
		boolean flag = false;
		//记录该科目的编号
		String ID = null;
		try {
			//接收来自解析的集合
			list = psubxml.selXML();
			for (Subject sub : list) {
				if(sub.getName().equals(subject)){
					ID = sub.getID();
					flag = true;
				}
			}
			if(flag){
				System.out.println(ID + " 123 " +subject);
				SubjectOperation.delSubject(ID);
				QuestionOperation.delSubject(subject);
				StudentOperation.addOrDelOfUnpass(subject);
				System.out.println(subject + "删除成功");
				pw.println("1");
				pw.flush();
			}else{
				System.out.println("没有该科目");
				pw.println("0");
				pw.flush();
			}
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成查看所有学科的功能
	public void searchSubject(){
		//获得解析对象
		ParseSubjectXML psubxml = new ParseSubjectXML();
		//创建一个List集合   存放科目集合
		List<Subject> list = null;
		try {
			//获取subject集合
			list = psubxml.selXML();
			//创建对象输出流
			ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
			//将集合以对象的方式传给客户端
			oos.writeObject(list);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//完成了修改科目的功能
	public void modifySubject(String subject){
		//创建解析科目XML对象
		ParseSubjectXML psubxml = new ParseSubjectXML();
		//创建集合存放科目对象
		List<Subject> list = null;
		try {
			//获取科目集合
			list = psubxml.selXML();
			//遍历
			for (Subject sub : list) {
				if(sub.getName().equals(subject)){
					System.out.println("可以修改科目");
					pw.println("1");
					pw.flush();
					return;
				}
			}
			System.out.println("不可以修改科目");
			pw.println("0");
			pw.flush();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成删除用户的功能
	public void deleteUser(String username){
		//创建解析用户对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建集合存放用户
		List<Student> list = null;
		//记录该用户的ID
		String ID = null;
		//创建一个标签
		boolean flag = false;
		try {
			//获取用户集合
			list = psxml.showStudent();
			//遍历
			for (Student student : list) {
				if(student.getUsername().equals(username)){
					ID = student.getID();
					flag = true;
				}
			}
			if(flag){
				StudentOperation.delStudent(ID);
				pw.println("1");
				pw.flush();
			}else{
				pw.println("0");
				pw.flush();
			}
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成查看用户的功能
	public void searchUser(){
		//创建解析用户对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建集合存放用户信息
		List<Student> list = null;
		
		try {
			//获取解析的集合
			list = psxml.showStudent();
			ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
			oos.writeObject(list);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成修改用户信息的功能
	public void modifyUser(String student){
		//创建解析用户XML对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建存放用户的集合
		List<Student> list = null;
		try {
			//获取用户集合
			list = psxml.showStudent();
			//遍历
			for (Student stu : list) {
				if(stu.getUsername().equals(student)){
					System.out.println("可以修改用户");
					pw.println("1");
					pw.flush();
					return;
				}
			}
			System.out.println("传输了0");
			pw.println("0");
			pw.flush();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ifAlreadyTest(String name, String subject){
		// 获取Document对象
		SAXReader reader = new SAXReader();
		Document doc;
		try {
			doc = reader.read(new File("Users.xml"));
			// 获取根节点
			Element student = doc.getRootElement();
			// 获得指定的ID（name）的节点的属性
			Element studentName = student.elementByID(name);
			//获得考过的科目
			Attribute pass = studentName.attribute("pass");
			//获得还未考的科目
			Attribute unpass = studentName.attribute("unpass");
			//还未考的科目转化为字符串
			String str = studentName.attributeValue("unpass");
			
			String str3 = studentName.attributeValue("pass");
			//还未考的科目，用逗号隔开转化为字符串数组
			String[] str1 = str.split(",");
			//用来存放还未考的科目
			String string = "";
			for (int i = 0; i < str1.length; i++) {
				if (subject.equals(str1[i])) {
					str3+=","+str1[i]+",";
					str1[i] = "";
				}
				string += str1[i] + ",";
			}
			unpass.setValue(string);
			pass.setValue(str3);
			// 创建文件关联对象
			FileOutputStream file = new FileOutputStream("Users.xml");
			// 创建格式化对象(将xml文档写出)
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("utf-8");
			// 创建xml写出对象
			XMLWriter writer = new XMLWriter(file, format);
			// 写出
			writer.write(doc);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void regexSubjectUser(String subjectuser){
		//声明接收客户端传来的科目信息
		//String subjectuser = null;
		//创建解析科目的对象
		ParseSubjectXML psxml = new ParseSubjectXML();
		//创建解析用户对象
		ParseStudentXML psubxml = new ParseStudentXML();
		//创建List集合   存放科目的集合
		List<Subject> list = null;
		//创建List集合  存放用户信息
		List<Student> students = null;
		try {
			//解析XML获取科目集合
			list = psxml.selXML();
			//解析XML获取用户集合
			System.out.println("123456");
			students = psubxml.showStudent();
			//subjectuser = br.readLine();
			System.out.println("读取了" + subjectuser);
			for (Subject sub : list) {
				System.out.println(sub.getName());
				//判断该科目是否已经存在
				if(sub.getName().equals(subjectuser)){
					System.out.println(subjectuser + "1");
					pw.println("0");
					pw.flush();
					return;
				}
			}
			for (Student student : students) {
				//判断该用户是否存在  存在返回1
				if(student.getUsername().equals(subjectuser)){
					System.out.println(subjectuser + "1");
					pw.println("1");
					pw.flush();
					return;
				}
			}
			//不存在返回0
			pw.println("0");
			pw.flush();
			System.out.println("返回了0");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
