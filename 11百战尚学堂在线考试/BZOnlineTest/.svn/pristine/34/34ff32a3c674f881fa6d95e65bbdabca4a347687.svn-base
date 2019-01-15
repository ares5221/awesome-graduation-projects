package parseXML;

/*
 * 解析问题XML文件
 */
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import entity.Question;

public class ParseQuestionXML {
	//返回一个集合
	public List<Question> getQuestion(String subject){
		//创建一个List集合，存放问题
		List<Question> list = new ArrayList<>();
		//声明问题对象
		Question ques = null;
		//创建解析器对象
		SAXReader reader = new SAXReader();
		//声明文件对象
		Document doc = null;
		try {
			//解析XML文件
			doc = reader.read("QuestionXML.xml");
			//获取根节点
			Element root = doc.getRootElement();
			//由根节点获取子节点
			List<Element> subjects = root.elements();
			//遍历科目
			for(Element ele:subjects){
				//获取科目名字
				String attr = ele.attributeValue("style");
				if(!attr.equals(subject)){
					continue;
				}else{
					//获取科目下的题目
					List<Element> problems = ele.elements();
					//遍历题目
					for (Element problem: problems) {
						//获取答案
						String answer = problem.attributeValue("answer");
						//获取题目
						String question = problem.elementText("question");
						//获取A选项
						String choicea = problem.elementText("choicea");
						//获取B选项
						String choiceb = problem.elementText("choiceb");
						//获取C选项
						String choicec = problem.elementText("choicec");
						//获取D选项
						String choiced = problem.elementText("choiced");
						//将问题选项答案放到问题对象中去
						ques = new Question(question, choicea, choiceb, choicec, choiced, answer);
						//将对象放入集合中去
						list.add(ques);
					}
				}
				System.out.println();
			}
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
