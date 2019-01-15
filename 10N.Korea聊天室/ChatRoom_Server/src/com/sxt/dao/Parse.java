
package com.sxt.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.print.attribute.ResolutionSyntax;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.sxt.vo.Users;
/**
 * XML解析与持久化数据
 * @author Damon Salvatore
 *
 */

public class Parse {
	
	
	//获得解析XML文档后的List
	public static List getUser(){
		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			document = reader.read(new File("src/resource/Users.xml"));
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		Element root = document.getRootElement();
		List<Element> list = root.elements();
		List<Users> list01 = new ArrayList<>();
		for (Element ele01 : list) {
			if(ele01.getName().equals("user")){
				String id = ele01.elementText("id");
				String name = ele01.elementText("name");
				String password = ele01.elementText("password");
				int admin = Integer.parseInt(ele01.elementText("admin"));
				String img = ele01.elementText("img");
				Users users = new Users(id, name, password, admin, img);
				list01.add(users);
			}
		}
		return list01;
	}
	
	//查找是否包含该用户ID
	public static Users searchUser(Users user){
		List<Users> list = getUser();
		Iterator<Users> item = list.iterator();
		Users users = null;
		while(item.hasNext()){
			users = item.next();
			if(users.getId().equals(user.getId())){	//判断传进来的Users对象是否存在于xml文档中
				return users;
			}
		}
		return null;
	}
	
	//校验用户ID和密码是否正确
	public static Users checkout(Users user){
		List<Users> list = getUser();
		Iterator<Users> item = list.iterator();
		Users users = null;
		while(item.hasNext()){
			users = item.next();
			if(users.getId().equals(user.getId()) && users.getPassword().equals(user.getPassword())){	//判断Users对象的ID和密码是否正确
				return users;
			}
		}
		return null;
	}
	
	//添加用户
	public static boolean addUser(Users user){
		if(checkout(user) != null){
			System.out.println("该用户已存在！");
			return false;
		}else{
			SAXReader reader = new SAXReader();
			Document document = null;
			try {
				document = reader.read(new File("src/resource/Users.xml"));
			} catch (DocumentException e1) {
				e1.printStackTrace();
			}
			Element root = document.getRootElement();
			
			Element son = root.addElement("user");
			Element id = son.addElement("id");
			id.setText(user.getId());
			
			Element name = son.addElement("name");
			name.setText(user.getName());
			
			Element password = son.addElement("password");
			password.setText(user.getPassword());
			
			Element admin = son.addElement("admin");
			String str = String.valueOf(user.getAdminStatus());
			admin.setText(str);
			
			Element img = son.addElement("img");
			img.setText(user.getImg());
			
			FileOutputStream file = null;
			try {
				file = new FileOutputStream("src/resource/Users.xml");
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("utf-8");
			XMLWriter writer = null;
			try {
				writer = new XMLWriter(file, format);
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			try {
				writer.write(document);
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("添加成功！");
			return true;
		}
	}
	
	//删除指定id的Users对象
	public static boolean deleteUsers(Users users){
		
		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			document = reader.read(new File("src/resource/Users.xml"));
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		Element root = document.getRootElement();
		List<Element> list01 = root.elements();
		boolean flag = false;
		for (Element element : list01) {
			if(users.getId().equals(element.elementText("id"))){
				element.detach();
				flag = true;
			}
		}
		if(!flag){
			return false;
		}
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(new File("src/resource/Users.xml"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		OutputFormat format = new OutputFormat().createPrettyPrint();
		format.setEncoding("utf-8");
		XMLWriter writer = null;
		try {
			writer = new XMLWriter(fos, format);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			writer.write(document);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	//修改指定id的Users对象的某些属性
	public static boolean changeUsers(Users users){
		List<Users> list = getUser();
		Iterator<Users> item = list.iterator();
		Users user = null;
		while(item.hasNext()){
			user = item.next();
			if(user.getId().equals(users.getId())){	//判断传进来的Users对象是否存在
				String id = user.getId();
				String name = null;
				String password = null;
				int admin = 0;
				if(users.getName() == null){
					name = user.getName();
				}else{
					name = users.getName();
				}
				if(users.getPassword() == null){
					password = user.getPassword();
				}else{
					password = users.getPassword();
				}
				if(users.getAdminStatus() != 0){
					admin = 1;
				}
				Users user01 = new Users(id, name, password, admin);
				deleteUsers(user01);
				addUser(user01);
				return true;
			}
		}
		return false;
	}
}
