package util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import entity.Question;

public class QuestionOperation {
	/**
	 * 增加科目题目
	 * 
	 * @param sub
	 *            需要增加的科目
	 * @param question
	 *            增加的问题
	 * @param ansA
	 *            选项A
	 * @param ansB
	 *            选项B
	 * @param ansC
	 *            选项C
	 * @param ansD
	 *            选项D
	 * @param anString
	 *            答案
	 */
	public static void addQuestion(String sub, String question, String ansA, String ansB, String ansC, String ansD,
			String anString) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("QuestionXML.xml");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		//得到根目录下的科目集合
		List<Element> ele = root.elements();
		
		boolean flag=true;
		//遍历科目集合，如果存在该科目增加题，不存在则添加该科目，同时添加题目
		for(Element e:ele){
			if(sub.equals(e.attribute("style").getText())){
				// 给子节点添加子节点
				Element n = e.addElement("problem");
				// 添加属性
				n.addAttribute("answer", anString);
				// 添加选项
				n.addElement("question").setText(question);
				n.addElement("choicea").setText(ansA);
				n.addElement("choiceb").setText(ansB);
				n.addElement("choicec").setText(ansC);
				n.addElement("choiced").setText(ansD);
				flag=false;
			}
		}
		if(flag){
			// 给根节点添加子节点
			Element element = root.addElement("subject");
			// 给子节点添加属性
			element.addAttribute("style", sub);
			// 给子节点添加子节点
			Element n = element.addElement("problem");
			// 添加属性
			n.addAttribute("answer", anString);
			// 添加选项
			n.addElement("question").setText(question);
			n.addElement("choicea").setText(ansA);
			n.addElement("choiceb").setText(ansB);
			n.addElement("choicec").setText(ansC);
			n.addElement("choiced").setText(ansD);
		}
		// 将创建的doc对象写出
		methed(doc);

	}
	/**
	 *删除该科目中的所有题目 
	 * @param sub 需要删除的科目
	 */
	public static void delSubject(String sub) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("QuestionXML.xml");
		} catch (DocumentException e1) {
			e1.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		// 获取根节点的subject集合
		List<Element> elements = root.elements();
		for(Element e:elements){
			if(sub.equals(e.attributeValue("style"))){
				root.remove(e);
			}
		}
		methed(doc);
	}
	/**
	 * 修改题目
	 * 
	 * @param sub
	 *            需要增加的科目
	 * @param num
	 *            需要修改的题号
	 * @param question
	 *            增加的问题
	 * @param ansA
	 *            选项A
	 * @param ansB
	 *            选项B
	 * @param ansC
	 *            选项C
	 * @param ansD
	 *            选项D
	 * @param anString
	 *            答案
	 */
	public static boolean modifyQuestion(String sub, String num, String question, String ansA, String ansB, String ansC,
			String ansD, String anString) {
		// 获取doc对象
		Document doc = null;
		try {
			doc = new SAXReader().read("QuestionXML.xml");
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 获取根节点对象
		Element root = doc.getRootElement();
		//获得科目集合
		List<Element> rootEle = root.elements();
		Element ele=null;
		for(int i=0;i<rootEle.size();i++){
			if(sub.equals(rootEle.get(i).attribute("style").getText())){
				ele = rootEle.get(i);
			};
		}
		// 根据科目获取问题集合
		List elements = ele.elements();
		// 修改的题号
		int i = Integer.parseInt(num);
		if (i<elements.size()) {
			Element element = (Element) elements.get(i-1);
			// 修改属性
			Attribute attribute = element.attribute("answer");
			attribute.setValue(anString);
			// 修改选项
			Element e1 = element.element("question");
			e1.setText(question);
			Element e2 = element.element("choicea");
			e2.setText(ansA);
			Element e3 = element.element("choiceb");
			e3.setText(ansB);
			Element e4 = element.element("choicec");
			e4.setText(ansC);
			Element e5 = element.element("choiced");
			e5.setText(ansD);
		} else {
			return false;
		}
		methed(doc);
		return true;
	}
	// 将创建的doc对象写出
	private static void methed(Document doc) {

		// 创建文件关联对象
		FileOutputStream file = null;
		try {
			file = new FileOutputStream("QuestionXML.xml");
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
}
