package windowOperation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class LoadWinOpe {
	//用于向服务器传输用户以及用户密码，并返回验证结果
	public boolean transferUser(String name,char[] passor,Socket socket) {
		boolean flag = false;
		try {
		Socket s = socket;
		//向服务器传送数据
		PrintWriter pw = new PrintWriter(s.getOutputStream());
		//接收服务器传来的数据
		BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
		String username = name;
		String Password = "";
		for (char c : passor) {
			Password = Password + c;
		}
//		String Password = passor;
		pw.write(username + "\r");
		pw.flush();
		pw.write(Password + "\r");
		pw.flush();
		System.out.println("向服务器传输了数据");
		String read = br.readLine();
		
		flag = "1".equals(read);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	
	
	//用于验证管理员的账号密码是否正确。如果正确就进入下一个管理员页面。
	public boolean transferTeacher(String name,char[] password,Socket socket) {
		String tName = null;
		
		String password2 = "";
		for (int i = 0; i < password.length; i++) {
			password2 += password[i];
		}
		try {
			PrintWriter pw = new PrintWriter(socket.getOutputStream());
			pw.write(name+"\r");
			pw.flush();
			
			pw.write(password2+"\r");
			pw.flush();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			tName = br.readLine();
			System.out.println(tName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if ("1".equalsIgnoreCase(tName)) {
			return true;
		}
		else {
			return false;
		}
	}

	
}
