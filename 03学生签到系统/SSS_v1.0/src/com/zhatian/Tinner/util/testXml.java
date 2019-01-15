package com.zhatian.Tinner.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.zhatian.Tinner.dao.StudentDao;
import com.zhatian.Tinner.entity.Sign;
import com.zhatian.Tinner.entity.Student;

public class testXml{
	protected static Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	protected static Format formats = new SimpleDateFormat("yyyy-MM-dd");
	/**
	 *解析xml的第一步,获取Document对象 
	 */
	public static Document readStudent() throws DocumentException{
		//1.获取Document对象
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new File("resource//SSS_DB//students.xml"));
		return doc;
	}
	public static Document readSign() throws DocumentException{
		//1.获取Document对象
		
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new File("resource//SSS_DB//sign.xml"));
		
		return doc;
	}
	
	/**
	 * 将遍历的xml文件中的数据转换为Student类对象的集合
	 * @throws DocumentException 
	 * 
	 */
	public static List<Student> selXMLDoc() throws DocumentException {
		//创建Students类型的集合
		List<Student> students = new ArrayList<>();
		Document doc = readStudent();
		//2.获取根节点对象
			Element stuRoot = doc.getRootElement();	
		//3.获取根节点的子节点对象集合
			List<Element> list = stuRoot.elements();		
		//4.遍历集合
			for(Element ele:list){		
				Student s = new Student( Integer.parseInt(ele.attributeValue("ID").trim()),ele.elementText("username"), ele.elementText("password"), 
						ele.elementText("name"), ele.elementText("sex"), ele.elementText("age"), ele.elementText("classroom"));
				students.add(s);	
			}
			return students;
	}
	/**
	 * 将遍历的xml文件中的数据转换为Sign类对象的集合
	 * @throws DocumentException 
	 * 
	 */
	public static List<Sign> selXMLDoc_sign() throws DocumentException, NumberFormatException, ParseException {
		//创建Students类型的集合
		
		
		List<Sign> signs = new ArrayList<>();
		Document doc = readSign();
		//2.获取根节点对象
			Element Root = doc.getRootElement();	
		//3.获取根节点的子节点对象集合
			List<Element> list = Root.elements();		
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdfs=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//4.遍历集合
		
			for(Element ele:list){		
				Sign s = new Sign( Integer.parseInt(ele.attributeValue("ID").trim()),Integer.parseInt(ele.elementText("studentId").trim()), 	sdfs.parse(ele.elementText("signInTime")), 
						"".equals(ele.elementText("signOutTime"))?null:(sdfs.parse(ele.elementText("signOutTime"))), 
								ele.elementText("dateLog"), 
								sdf.parse(ele.elementText("date")));
				signs.add(s);	
			}
			
			return signs;
	}
	
	
	/**
	 *将修改的数据写入到xml文件中 
	 */
	public static void writeToStudent(Document doc) throws IOException{
		
		//将document对象重新写入到XML中
		//创建文件关联对象
		FileOutputStream file = new FileOutputStream("resource//SSS_DB//students.xml");
		//创建格式对象
		OutputFormat format = OutputFormat.createPrettyPrint();
			//设置写出的编码格式
			format.setEncoding("utf-8");
		//创建xml写出对象
		XMLWriter writer = new XMLWriter(file,format);
		
		//写出
		writer.write(doc);
	//	System.out.println("修改成功!");
	}
	/**
	 *写出到Sign表 
	 */
	public static void writeToSign(Document doc) throws IOException{
		
		//将document对象重新写入到XML中
		//创建文件关联对象
		FileOutputStream file = new FileOutputStream("resource//SSS_DB//sign.xml");
		//创建格式对象
		OutputFormat format = OutputFormat.createPrettyPrint();
			//设置写出的编码格式
			format.setEncoding("utf-8");
		//创建xml写出对象
		XMLWriter writer = new XMLWriter(file,format);
		
		//写出
		writer.write(doc);
	//	System.out.println("修改成功!");
	}
	/**
	 * 判断是否签过到
	 */
	public static Sign isNotSignd(Sign s){
		String date = format.format(s.getSign_Date());	
		return s;	
	}
	/**
	 *修改学生信息 
	 */
	public static boolean motifyXML(Student s) throws DocumentException, IOException{
		boolean flag = false;
		Document doc = readStudent();
		Element root = doc.getRootElement();
		
		Element pwd = root.elementByID(Integer.toString(s.getStudent_Id())).element("password");
		pwd.setText(s.getStudent_Password());
		Element name = root.elementByID(Integer.toString(s.getStudent_Id())).element("name");
		name.setText(s.getStudent_Name());
		Element sex = root.elementByID(Integer.toString(s.getStudent_Id())).element("sex");
		sex.setText(s.getStudent_Sex());
		Element age = root.elementByID(Integer.toString(s.getStudent_Id())).element("age");
		age.setText(s.getStudent_Age());
		Element room = root.elementByID(Integer.toString(s.getStudent_Id())).element("classroom");
		room.setText(s.getStudent_Classroom());
		
		writeToStudent(doc);
		flag = true;
		return flag;	
	}
	/**
	 *用户注册写入xml 
	 * @throws DocumentException 
	 * @throws IOException 
	 */
	public static boolean addXML(Student s) throws DocumentException, IOException{
		boolean flag = false;
		Document doc = readStudent();
		Element root = doc.getRootElement();
		Element student = root.addElement("student");
			student.addAttribute("ID",  Integer.toString(s.getStudent_Id()));
		Element username = student.addElement("username");
		username.setText(s.getStudent_Username());
		
		Element password = student.addElement("password");
		password.setText(s.getStudent_Password());
		
		Element name = student.addElement("name");
		name.setText(s.getStudent_Name());
		
		Element sex = student.addElement("sex");
		sex.setText(s.getStudent_Sex());
		
		Element age = student.addElement("age");
		age.setText(s.getStudent_Age());
		
		Element classroom = student.addElement("classroom");
		classroom.setText(s.getStudent_Classroom());
		writeToStudent(doc);
		flag = true;	
		return flag;
	}
	/**
	 *删除学生信息
	 */
	public static boolean deleteXML(int id) throws DocumentException, IOException{
		boolean flag = false;
		//从学生表中删除
		Document doc = readStudent();
		Element root = doc.getRootElement();
		Element stu = root.elementByID(Integer.toString(id));
		root.remove(stu);
		writeToStudent(doc);
		//从签到表中删除
		Document docs = readSign();
		Element roots = docs.getRootElement();
		List<Element> list = roots.elements();
		for(Element e:list){
			String id_s= e.elementText("studentId");
			if(id_s.equals(Integer.toString(id))){
				
				e.detach();
				
			}
		}
		writeToSign(docs);
		flag = true;
		return flag;
		
	}
	/**
	 *签到功能
	 */
	public static boolean addSign(Sign s) throws DocumentException, IOException {
		boolean flag = false;
		Document doc = readSign();
		Element root = doc.getRootElement();
			Element sign = root.addElement("sign");
			sign.addAttribute("ID", Integer.toString(s.getSign_Id()));
			
			Element studentId = sign.addElement("studentId");
			studentId.setText( Integer.toString(s.getSign_studentId()));
			
			Element signInTime = sign.addElement("signInTime");
			signInTime.setText(format.format(s.getSign_InTime()));
			
			Element signOutTime = sign.addElement("signOutTime");
			signOutTime.setText("");
			
			Element dateLog = sign.addElement("dateLog");
			dateLog.setText(s.getSign_DateLog());
			
			Element date = sign.addElement("date");
			date.setText(formats.format(s.getSign_Date()));
		
		writeToSign(doc);
		flag = true;	
		return flag;
		
	}
	/**
	 *签退功能 
	 */
	public static boolean notifySign(int id,String sign_OutTime) throws DocumentException, IOException {
		boolean flag = false;
		Document doc = readSign();
		Element root = doc.getRootElement();
		Element sign = root.elementByID(Integer.toString(id));
		Element sign_out = sign.element("signOutTime");
		sign_out.setText(sign_OutTime);
		writeToSign(doc);
		flag = true;	
		return flag;
		
	}
	/**
	 *写入日志 
	 */
	public static boolean addLogSign(int sign_Id, String sign_DateLog) throws DocumentException, IOException {
		boolean flag = false;
		Document doc = readSign();
		Element root = doc.getRootElement();
		Element sign = root.elementByID(Integer.toString(sign_Id));
		Element log = sign.element("dateLog");
		log.setText(sign_DateLog);
		writeToSign(doc);
		flag = true;	
		return flag;
	}
}
