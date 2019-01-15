package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import entity.Student;

public class StudentOperation {
	// 删除学生
	public static void delStudent(String ID) throws DocumentException, IOException {
		// 获取Document对象
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new File("Users.xml"));
		// 获取根节点
		Element root = doc.getRootElement();
		// 获取要删除的节点对象
		Element student = root.elementByID(ID);
		// 父节点对象删除子节点对象
		root.remove(student);
		// 将document对象重新写回到xml文件中
		methed(doc);

	}

	// 增加学生
	public static void addStudent(String ID, String Username, String password, String pass, String unpass)
			throws DocumentException, IOException {
		// 获取Document对象
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new File("Users.xml"));
		// 获取根节点
		Element root = doc.getRootElement();

		// 创建学生节点，给学生节点增加属性
		Element student = root.addElement("student");
		student.addAttribute("ID", ID);
		// 考虑是否追加还是覆盖
		student.addAttribute("pass", pass);
		student.addAttribute("unpass", unpass);
		// 给学生节点增加子节点
		Element Username1 = student.addElement("Username");
		Username1.setText(Username);

		Element password1 = student.addElement("password");
		password1.setText(password);

		// 将document对象重新写回到xml文件中
		methed(doc);

	}

	// 修改学生密码
	public static void modifyStudent(String ID, String newpassword) throws DocumentException, IOException {
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new File("Users.xml"));
		// 获取根节点
		Element root = doc.getRootElement();

		// 获取要获取的子节点对象
		Element password = root.elementByID(ID).element("password");
		// TODO
		password.setText(newpassword);

		methed(doc);
	}
	/**
	 * 对unpass进行操作，
	 * @param sub 需要增加或者删除的科目
	 */
	public static void addOrDelOfUnpass(String sub) {
		// 获取Document对象
		SAXReader reader = new SAXReader();
		Document doc=null;
		try {
			doc = reader.read(new File("Users.xml"));
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		// 获取根节点
		Element root = doc.getRootElement();
		//遍历根节点
		List<Element> eles= root.elements();
		String replace="";
		for(Element e:eles){
			//获取属性
			Attribute attribute = e.attribute("unpass");
			//获取属性值
			String attributeValue = e.attributeValue("unpass");
			
			if(attributeValue.contains(sub)){
				 replace = attributeValue.replace(sub,"");
			}else{
				replace=attributeValue.concat(","+sub+",");
			}
			attribute.setValue(replace);
		}
		try {
			methed(doc);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	// 将创建的doc对象写出
	private static void methed(Document doc) throws FileNotFoundException, IOException {

		// 创建文件关联对象
		FileOutputStream file = new FileOutputStream("Users.xml");
		// 创建格式化对象(将xml文档写出)
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("utf-8");
		// 创建xml写出对象
		XMLWriter writer = new XMLWriter(file, format);
		// 写出
		writer.write(doc);
	}

}
