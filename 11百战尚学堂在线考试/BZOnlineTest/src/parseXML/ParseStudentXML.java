package parseXML;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.MalformedInputException;
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
import entity.Student;

public class ParseStudentXML {

	public List<Student> showStudent() throws DocumentException {

		List<Student> list = new ArrayList<>();
		List<String> list1 = new ArrayList<>();

		// 读取xml，封装对象
		SAXReader saxReader = new SAXReader();
		Document doc = saxReader.read("Users.xml");

		// 得到根节点
		Element root = doc.getRootElement();
		// 得到子节点
		List<Element> elements = root.elements();
		for (Element element : elements) {
			String ID = element.attributeValue("ID");
			String username = element.elementText("Username");
			String password = element.elementText("password");
			String pass = element.attributeValue("pass");
			String unpass = element.attributeValue("unpass");

			// 创建student对象
			Student stu = new Student(username, password, ID, pass, unpass);
			list.add(stu);
		}
		return list;

	}

}