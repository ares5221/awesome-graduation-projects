package myServer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.net.Socket;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.DocumentException;

import entity.Question;
import entity.Student;
import entity.Subject;
import parseXML.ParseQuestionXML;
import parseXML.ParseStudentXML;
import parseXML.ParseSubjectXML;
import util.QuestionOperation;
import util.StudentOperation;
import util.SubjectOperation;

/*
 * 对客户端的不同请求进行判断
 */
public class RegexServer implements Serializable{
	private Socket socket= null;
	BufferedReader br = null;
	PrintWriter pw = null;
	//创建对象输入流，用来接收从客户端传来的
	ObjectInputStream ois = null;
	
	public RegexServer(Socket socket){
		this.socket = socket;
		try {
			br = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
			pw = new PrintWriter(this.socket.getOutputStream());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成添加用户的功能 ---------------------------界面1
	public void addUser(){
		//创建解析用户XML对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建解析科目的对象
		ParseSubjectXML psubxml = new ParseSubjectXML();
		//声明List集合，用来存放用户集合
		List<Student> list = null;
		//声明科目集合
		List<Subject> listsub = null;
		try {
			//获取用户集合
			list = psxml.showStudent();
			//获取科目集合
			listsub = psubxml.selXML();
			/*//测试数据
			String str = br.readLine();
			System.out.println(str);*/
			//获取用户端的姓名
			String ID = br.readLine();
			System.out.println(ID);
			//获取客户端传来的用户名
			String username = br.readLine();
			System.out.println(username);
			//获取客户端传来的密码
			String password = br.readLine();
			System.out.println(password);
			//获取重复密码
			String passwordagain = br.readLine();
			System.out.println(passwordagain);
			if(!password.equals(passwordagain)){
				pw.println("2");
				pw.flush();
				return;
			}
			String pass = "";
			String unpass = "";
			for(Subject sub:listsub){
				unpass = unpass + sub.getName() +",";
			}
			//遍历
			for (Student stu : list) {
				if(stu.getUsername().equals(username)){
					pw.println("1");
					pw.flush();
					return;
				}
			}
			pw.println("0");
			pw.flush();
			System.out.println("添加成功！");
			StudentOperation.addStudent(ID, username, password, pass, unpass);
			System.out.println("11111111");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成添加题目的功能   --------------------------界面2
	public void addQuestion(){
		//声明增加的科目
		String sub = null;
		//创建List集合
		Map<Question, Subject> map = null;
		try {
			//接收来自客户端的map集合
			ois = new ObjectInputStream(socket.getInputStream());
			map = (Map<Question, Subject>) ois.readObject();		
			Set<Question> set = map.keySet();
			for (Question question : set) {
				Subject subject = map.get(question);
				sub = subject.getName();
				String ID = subject.getID();
				String answer = question.getAnswer();
				String choicea = question.getChoicea();
				String choiceb = question.getChoiceb();
				String choicec = question.getChoicec();
				String choiced = question.getChoiced();
				String ques = question.getQuestion();
				SubjectOperation.addSubject(ID, sub);
				StudentOperation.addOrDelOfUnpass(sub);
				QuestionOperation.addQuestion(sub, ques, choicea, choiceb, choicec, choiced, answer);
			}
			System.out.println("题目录入完成");
			
		} catch (ClassNotFoundException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//完成对用户名的校验功能        -------------------界面3
	public String regexUser(){
		//记录用户的姓名
		String name = null;
		//接收来自客户端的信息
		String username;
		String password;
		//创建Student集合
		List<Student> list =null;
		//创建解析XML对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建一个标记
		boolean flag = false;
		try {
			//判断是学生或者是管理员
			String num = br.readLine();
			//从客户端接收用户名和密码
			username = this.br.readLine();
			password = this.br.readLine();
			System.out.println(username + " " + password);
			
			//解析获得用户信息
			list = psxml.showStudent();
			System.out.println("获得了解析的数据");
			//进行匹配
			for (Student stu:list) {
				if(username.equals(stu.getUsername()) && password.equals(stu.getPassword())&&"0".equals(num)){
					flag = true;
					name = stu.getID();
				}
			}
			//判断该用户是否已经登录
			for(String name2:MyThread.listUsers){
				if("bjsxt".equals(name2)&&"bjsxt".equals(username)){
					System.out.println("管理员已经存在");
					pw.print("0"+"\r");
					pw.flush();
					return null;
				}
				if(name2.equals(name)){
					System.out.println("用户已经存在");
					pw.print("0"+"\r");
					pw.flush();
					return null;
				}
			}
			//对管理员信息进行判断
			if("bjsxt".equals(username)&&"bjsxt".equals(password)&&"1".equals(num)){
				pw.print("1"+"\r");
				pw.flush();
				return "bjsxt";
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		if(flag){
			pw.print("1"+"\r");
			pw.flush();
		}
		else{
			pw.print("0"+"\r");
			pw.flush();
		}
		System.out.println(name + " " + flag);
		return name;
	}
	
	//完成修改科目的功能 ---------------------------界面4
	public void modifySubject(){
		//声明客户端传来的科目信息
		String subject = null;
		//声明解析科目
		ParseSubjectXML psubxml = new ParseSubjectXML();
		//声明一个集合用于存放科目集合
		List<Subject> list = null;
		//声明对象输入流
		//创建一个标记
		boolean flag = false;
		try {
			System.out.println("123465");
			ois = new ObjectInputStream(socket.getInputStream());
			System.out.println("123465");
			//接收传来的问题对象
			Map<String, Question> map = (Map<String, Question>) ois.readObject();
			System.out.println(map.size());
			//获取客户端传来的科目信息
			subject = br.readLine();
			System.out.println(subject);
			//创建对象输入流
			//获取科目集合
			list = psubxml.selXML();
			for (Subject sub : list) {
			if(sub.getName().equals(subject)){
					System.out.println("科目存在");
					flag = true;
				}
			}
			//声明题目中的一些变量
			String question = null;
			String choicea = null;
			String choiceb = null;
			String choicec = null;
			String choiced = null;
			String answer = null;
			String num = null;
			Set<String> set = map.keySet();
			for (String str : set) {
				num = str + "";
				Question ques = map.get(str);
				question = ques.getQuestion();
				choicea = ques.getChoicea();
				choiceb = ques.getChoiceb();
				choicec = ques.getChoicec();
				choiced = ques.getChoiced();
				answer = ques.getAnswer();
			}
			flag = QuestionOperation.modifyQuestion(subject, num, question, choicea, choiceb, choicec, choiced, answer);
			if(flag){
				pw.println("1");
				pw.flush();
				System.out.println("修改了题目");
			}else{
				pw.println("0");
				pw.flush();
				System.out.println("修改失败");
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//完成修改用户的功能   ---------------------------------界面5
	public void modifyUser(){
		//创建解析用户XML对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建一个集合，存放用户集合
		List<Student> list = null;
		//设置一个标记
		boolean flag = false;
		//记录该用户的名字
		String name = null;
		try {
			//从客户端接收要修改的用户名
			String username = br.readLine();
			System.out.println(username);
			//从客户端接收接收旧密码
			String oldpassword = br.readLine();
			System.out.println(oldpassword);
			//从客户端接收新密码
			String password = br.readLine();
			System.out.println(password);
			//从客户端接收重复新密码
			String reppassword = br.readLine();
			System.out.println(reppassword);
			//获取用户集合
			list = psxml.showStudent();
			//遍历
			for (Student stu : list) {
				//判断用户名和密码是否存在，存在则标记为true
				if((stu.getUsername().equals(username)&&stu.getPassword().equals(oldpassword))){
					flag = true;
					name = stu.getID();
				}
				if(!password.equals(reppassword)){
					pw.println("0");
					pw.flush();
					return;
				}
			}
			//根据标记判断用户是否存在
			if(flag){
				System.out.println("用户名存在，可以修改");
				pw.println("1");
				pw.flush();
				
				StudentOperation.modifyStudent(name, password);
				System.out.println("修改密码成功！");
			}else{
				System.out.println("用户名不存在");
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
	
	//完成对学生界面查看科目是否考完的功能及记录需要考试的科目  -----------------------界面6
	public void testOver(String name){
		//创建解析学生XML对象
		ParseStudentXML psxml = new ParseStudentXML();
		//创建解析学科XML对象
		ParseSubjectXML psubxml = new ParseSubjectXML();
		//创建一个存放subject的集合
		List<Subject> listsub = null;
		//声明存储学科对象
		String str1 = null;
		//创建一个存储学科编号的对象
		String str2 = "";
		try {
			//从SubjectXML中获取集合
			listsub = psubxml.selXML();
			//接收来自客户端的信息
			String string = br.readLine();
			System.out.println("接收到了输入信息" + string);
			List<Student> list = psxml.showStudent();
			if("do".equals(string)){
				System.out.println("匹配了do");
				//进行匹配
				for (Student stu:list) {
					if(stu.getID().equals(name)){
						str1 = stu.getPass();
					}
				}
			}
			if("undo".equals(string)){
				System.out.println("匹配了undo");
				//进行匹配
				for (Student stu:list) {
					if(stu.getID().equals(name)){
						str1 = stu.getUnpass();
					}
				}
			}
			if(str1 != null){
				String subject[] = str1.split(","); 
				for(int i = 0;i<subject.length;i++){
					System.out.println(subject.length);
					for (Subject sub : listsub) {
						if(subject[i].equals(sub.getName())){
							str2 = str2+sub.getID()+",";
						}
					}
				}
			}
			System.out.println(str1 + " " + str2);
			pw.print(str2 + "\r");
			pw.flush();
			System.out.println("传回了数据");
			pw.print(str1 + "\r");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	
	//完成对管理员界面的数据传输和更改     ----------------------界面7
	public void changeXML(){
		//声明客户端执行的操作信息
		String operation = null;
		//创建解析科目的对象
		ParseSubjectXML psxml = new ParseSubjectXML();
		//创建List集合   存放科目的集合
		List<Subject> list = null;
		//创建功能对象
		FunctionOfTeacher fot = new FunctionOfTeacher(this.socket);
		try {
			//读取客户端进行的操作
			operation = br.readLine();
			//传输操作和科目
			System.out.println(operation);
			String str[] = operation.split(",");
			//判断相应的科目 执行相应的方法
			switch(str[0]){
			case "addSubject":System.out.println("执行了核对");fot.regexSubjectUser(str[1]);break;
			case "deleteSubject":fot.deleteSubject(str[1]);break;
			case "searchSubject":fot.searchSubject();break;
			case "modifySubject":fot.modifySubject(str[1]);break;
			case "addUser":fot.regexSubjectUser(str[1]);break;
			case "deleteUser":fot.deleteUser(str[1]);break;
			case "searchUser":fot.searchUser();break;
			case "modifyUser":fot.modifyUser(str[1]);break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//完成对对试题的传输    ---------------------界面8
	public void getTest(String name){
		//创建一个解析问题XML的文件
		ParseQuestionXML pqxml = new ParseQuestionXML();
		//创建一个接收问题的集合
		List<Question> list = null;
		//声明接收的科目
		String subject = null;
		//设置一个标签
		boolean flag = false;
		try {
			//接收来自界面的科目信息
			subject = br.readLine();
			System.out.println("接收到" + subject);
			
			//对是否考过了进行判断
			flag = judge(name, subject);
			System.out.println("进行了判断");
			//获得解析的问题集合
			if(flag)
				list = pqxml.getQuestion(subject);
			//创建对象输出流
			ObjectOutputStream oos = new ObjectOutputStream(this.socket.getOutputStream());
			//将list集合传给界面
			System.out.println("传数据");
			oos.writeObject(list);
			oos.flush();
			System.out.println("传回了数据");
			//需要将该科目改为已完成
			FunctionOfTeacher fot = new FunctionOfTeacher(socket);
			fot.ifAlreadyTest(name, subject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//完成对学生该科目是否完成的判断
	public boolean judge(String name,String subject){
		//创建解析学生的对象
		ParseStudentXML psxml = new ParseStudentXML();
		//声明集合来存放学生集合
		List<Student> list = null;
		//设置一个标签
		boolean flag = false;
		try {
			//获取学生集合
			list = psxml.showStudent();
			//遍历
			for (Student stu : list) {
				//判断是否是这个人
				if(stu.getID().equals(name)){
					String pass[] = stu.getPass().split(",");
					for(String sub:pass){
						//判断这个科目是否是考过的
						if(sub.equals(subject)){
							flag = true;
						}
					}
				}
			}
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
