package windowOperation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JOptionPane;

public class StudentWinOpe {
	//当学生页面点击未选科目是向服务器发送请求，服务器返回一个数据
	public String[][] notSelect(Socket socket) {
		String[][] subjects = null;
		//向服务器发送请求，服务求会返回两个字符串，一个存放ID，一个存放科目名
		PrintWriter pw;
		try {
			pw = new PrintWriter(socket.getOutputStream());
			pw.write("undo"+"\r");
			pw.flush();
		//服务器返回两个字符串
		BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		String ids = br.readLine(); 
		String subject = br.readLine(); 
		
		//将服务器返回的字符串转换成数组。
		String[] ids1 = ids.split(",");
		String[] subject1 = subject.split(",");
		//确定二维数组的行数
		int length = ids1.length+1;
		//创建一个二维数组。
		subjects = new String[length][2];
		//创建表头
		subjects[0][0] = "ID";
		subjects[0][1] = "科目";
		//将两个一维数组整合为一个二维数组。
		for (int i = 1; i < subjects.length; i++) {
			subjects[i][0] = ids1[i-1];
//			subjects[i][1] = subject1[i-1];
		}
		//将科目放入二维数组
		int count = 1;
		for (int i = 0; i < subject1.length; i++) {
			if (!("".equals(subject1[i]))) {
				subjects[count][1] = subject1[i];
				count++;
			}
		}
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		//返回一个数组
		return subjects;
	}
	
	//当学生选中的是未选科目是，向服务器发送一个do信号。服务器会返回两个字符串。一个ID，一个一考科目。
	public String[][] yetSelect(Socket socket) {
		String[][] subjects = null;
		//向服务器发送请求，服务求会返回两个字符串，一个存放ID，一个存放科目名
		PrintWriter pw;
		try {
			pw = new PrintWriter(socket.getOutputStream());
			pw.write("do\r");
			pw.flush();
		
		//服务器返回两个字符串
		BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		String ids = br.readLine(); 
		String subject = br.readLine(); 
		//将服务器返回的字符串转换成数组。
		String[] ids1 = ids.split(",");
		String[] subject1 = subject.split(",");
		//确定二维数组的行数
		int length = ids1.length+1;
		//创建一个二维数组。
		subjects = new String[length][2];
		//创建表头
		subjects[0][0] = "姓名";
		subjects[0][1] = "账号";
		//将两个一维数组整合为一个二维数组。
		for (int i = 1; i < subjects.length; i++) {
				subjects[i][0] = ids1[i-1];
//				subjects[i][1] = subject1[i-1];
			}
				//将科目放入二维数组
		int count = 1;
		for (int i = 0; i < subject1.length; i++) {
			if (!("".equals(subject1[i]))) {
				subjects[count][1] = subject1[i];
				count++;
			}
		}
		} catch (IOException e) {
			e.printStackTrace();
		}
		//返回一个二维数组
		return subjects;
	}
	
	//接受用户输入的ID以及判断ID的合法性。
	  public String inputId(String[][] strings,String id) {
		  //判断表格中是否有这个id
		  for (int i = 1; i < strings.length; i++) {
			if (id.equals(strings[i][0])) {
			//如果是有这个Id就传递给下一个页面
				String string = strings[i][1];
			return string;
			}
		}
		  JOptionPane.showMessageDialog(null, "该ID的课程已经考过");
		  return null;
	}
}
