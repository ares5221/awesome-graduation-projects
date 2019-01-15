package parseXML;

import java.util.ArrayList;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import entity.Subject;

public class ParseSubjectXML {
	/**
	 * 查看xml文档（解析）
	 * 
	 * @return List<Subject>
	 * @throws DocumentException
	 */
	@SuppressWarnings("unused")
	public static List<Subject> selXML() throws DocumentException {
		// 获取doc对象
		Document doc = new SAXReader().read("SubjectXML.xml");
		// 获取根节点对象
		Element root = doc.getRootElement();
		// 获取子节点对象集合
		List<Element> list = root.elements();
		// 设置存储subject对象集合
		List<Subject> list2 = new ArrayList<>();
		// 遍历子节点对象
		for (Element e : list) {
			String ID = e.attributeValue("ID");
			String name = e.elementText("name");
			list2.add(new Subject(ID, name));
		}
		return list2;
	}
}
