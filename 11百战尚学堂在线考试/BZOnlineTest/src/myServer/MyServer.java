package myServer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.ListUI;

import util.SubjectOperation;

class MyThread implements Runnable{
	//声明成员变量socket对象
	Socket socket = null;
	//声明一个静态集合，用来存放已登录的账户
	static List<String> listUsers = new ArrayList<>();
	//构造方法
	public MyThread(Socket socket){
		this.socket = socket;
	}
	public MyThread(){
		
	}
	
	@Override
	public void run() {
		RegexServer regex = new RegexServer(this.socket);
		System.out.println("线程开始运行了");
		//记录该账号的使用人姓名
		String name = "";		
		try {
			//接收来自客户端的信息
			BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			while(true){
				//对哪个界面发送来的信息进行判断
				String num = br.readLine();
				System.out.println("接收数字是" + num); 
				//根据界面信息来执行相应的界面操作
				switch(num){
				//增加用户
				case "1":regex.addUser();break;
				//增加科目
				case "2":regex.addQuestion();break;
				//登录界面
				case "3":name = regex.regexUser();System.out.println(name);
				if(name!=null)
				listUsers.add(name);break;
				//修改科目
				case "4":regex.modifySubject();break;
				//修改用户
				case "5":System.out.println("执行了修改用户的功能");regex.modifyUser();break;
				//学生界面
				case "6":System.out.println("执行的方法");regex.testOver(name);break;
				//管理员界面
				case "7":System.out.println("管理员");regex.changeXML();break;
				//考试界面
				case "8":System.out.println(name);regex.getTest(name);break;
				default:System.out.println("传输的界面信息错误");
				}
			}
		} catch (Exception e) {
			if(name != null)
			listUsers.remove(name);
		}
	}
}


public class MyServer {
	
	public static void main(String[] args) {
		//声明服务器对象
		ServerSocket ss = null;
		//声明客户端Socket对象
		Socket s = null;
		try {
			//创建服务器对象
			ss = new ServerSocket(8899);
			while(true){
			//持续接收客户端传来的信号
			s = ss.accept();
			System.out.println(s.getInetAddress().getHostName() + "连接成功");
			MyThread mt = new MyThread(s);
			Thread t = new Thread(mt);
			//启动线程
			t.start();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
