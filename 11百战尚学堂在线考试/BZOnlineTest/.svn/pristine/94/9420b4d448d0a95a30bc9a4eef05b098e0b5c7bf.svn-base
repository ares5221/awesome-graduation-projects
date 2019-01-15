package util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import entity.Subject;

public class SubjectOperation {
	/**
	 * 删除xml文档中子节点的信息（删除科目）
	 * 
	 * @param ID
	 *            课程号
	 */
	public static void delSubject(String ID) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("SubjectXML.xml");
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		// 获取要删除的节点对象
		Element sub = root.elementByID(ID);
		root.remove(sub);
		methed(doc);
	}

	/**
	 * 修改科目内容,修改属性（修改科目）
	 * 
	 * @param ID
	 * @param name
	 * @param score
	 * @param teacher
	 */
	public static void updateSubject(String ID, String name) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("SubjectXML.xml");
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		// 获取要修改的子节点对象
		Element element = root.elementByID(ID).element("name");
		element.setText(name);
		methed(doc);
	}

	/**
	 * 增加subject节点（增加科目）
	 * 
	 * @param ID
	 * @param name
	 * @param score
	 * @param teacher
	 * @throws IOException
	 * @throws DocumentException
	 */
	@SuppressWarnings("unused")
	public static void addSubject(String ID, String name) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("SubjectXML.xml");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		// 给根节点添加子节点
		List<Element> ele = root.elements();
		boolean flag=true;
		for (Element e : ele) {
			if (ID.equals(e.attribute("ID").getText())) {
				flag=false;
				return;
			}
		}
		if(flag){
			Element e = root.addElement("subject");
			// 给子节点添加属性
			e.addAttribute("ID", ID);
			// 给子节点添加子节点
			Element n = e.addElement("name");
			n.setText(name);
		}
		
		// 将创建的doc对象写出
		methed(doc);

	}

	// 将创建的doc对象写出
	private static void methed(Document doc) {

		// 创建文件关联对象
		FileOutputStream file = null;
		try {
			file = new FileOutputStream("SubjectXML.xml");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 创建格式化对象(将xml文档写出)
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("utf-8");
		// 创建xml写出对象
		XMLWriter writer = null;
		try {
			writer = new XMLWriter(file, format);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 写出
		try {
			writer.write(doc);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过id查看看指定课程信息
	 * 
	 * @param id
	 * @return List<Subject>
	 * @throws DocumentException
	 */
	@SuppressWarnings("unused")
	public static List<Subject> selSubjectByID(String id) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("SubjectXML.xml");
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		// 获取指定节点对象
		Element e = root.elementByID(id);
		String name = e.elementText("name");
		// 设置指定subject对象集合
		List<Subject> list2 = new ArrayList<>();

		list2.add(new Subject(id, name));
		return list2;
	}
}
