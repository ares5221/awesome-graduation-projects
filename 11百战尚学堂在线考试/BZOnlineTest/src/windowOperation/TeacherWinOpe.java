package windowOperation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

import entity.Student;
import entity.Subject;

public class TeacherWinOpe {
	
	// 向服务器发送添加科目请求
	public boolean addSubject(String subject, Socket socket) {
		Socket s = socket;
		String sub = subject;
		boolean flag = false;
		try {
			// 向服务器传送数据
			PrintWriter pw = new PrintWriter(s.getOutputStream());
			//向服务器传送指令
			pw.write("addSubject"+","+sub+"\r");
			pw.flush();
			System.out.println("发送成功");
//			pw.close();
			// 接收服务器传来的数据
			BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			//服务器返回一个值确定这个科目存不存在
			String read = br.readLine();
			System.out.println(read);
			//如果这个科目不存在
			if ("0".equals(read)) {
				System.out.println("当前要添加的科目不存在，显示要增加科目和试题的界面");
				flag = true;
			} else {
				System.out.println("此科目已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}		

	// 用于向服务器传输要删除的科目
	public boolean delSubject(String subject, Socket socket) {
		boolean flag = false;
		Socket s = socket;
		try {
			// 向服务器传送数据
			PrintWriter pw = new PrintWriter(s.getOutputStream());
			// 接收服务器传来的数据
			BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			//将要删除的指令传给服务器
			pw.write("deleteSubject,"+subject+"\r");
			pw.flush();
//			pw.close();
//			// 将要删除的科目传给服务器，判断科目是否存在
//			pw.write(subject+"\r");
//			pw.flush();

			System.out.println("向服务器传输了数据");
			String read = br.readLine();
			// 服务器给我传回1，让该科目删除
			if (flag = "1".equals(read)) {
				flag = true;
				System.out.println("该科目已删除");
				// 如果flag不为1，说明该科目不存在
			} else {
				System.out.println("该科目不存在");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	//查看全部科目
	//当管理员页面点击查看全部科目是向服务器发送请求，服务器返回一个数据
		public String[][] lookAllSubject(Socket socket) {
			String[][] subjects = null;
			//向服务器发送请求，服务求会返回两个字符串，一个存放ID，一个存放科目名
			PrintWriter pw;
			try {
				pw = new PrintWriter(socket.getOutputStream());
				pw.write("searchSubject,"+"\r");
				pw.flush();
			//服务器返回返回一个对象
			ObjectInputStream ois = new ObjectInputStream(socket.getInputStream());
			//解读对象
			List<Subject> list = null;
			//将Subject对象写进list
			try {
				list = (List<Subject>)ois.readObject();
				System.out.println(list);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			//确定二维数组的行数
			int length = list.size()+1;
			//创建一个二维数组。
			subjects = new String[length][2];
			//创建表头
			subjects[0][0] = "ID";
			subjects[0][1] = "科目";
			//将两个一维数组整合为一个二维数组。把对象的
			for (int i = 1; i < subjects.length; i++) {
				subjects[i][0] = list.get(i-1).getID();
				subjects[i][1] = list.get(i-1).getName();
			}
			} catch (IOException e) {
				e.printStackTrace();
			}
			//返回一个数组
			return subjects;
		}
	//跳转修改科目的方法。
		public boolean modifySubject(String subject, Socket socket) {
			boolean flag = false;
			Socket s = socket;
			try {
				// 向服务器传送数据
				PrintWriter pw = new PrintWriter(s.getOutputStream());
				// 接收服务器传来的数据
				BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
				//将修改科目的指令发给服务器
				pw.write("modifySubject"+","+subject+"\r");
				pw.flush();
//				// 将要修改的科目传给服务器，判断科目是否存在
//				pw.write(subject+"\r");
//				pw.flush();
				System.out.println("向服务器传输了数据");
				String read = br.readLine();
				System.out.println(read);
				//pw.close();
				// 服务器给我传回1，进入到修改科目的页面
				if ("1".equals(read)) {
					flag = true;
					System.out.println("进入到修改科目的界面");
					// 如果flag不为1，说明该科目不存在
				} else {
					System.out.println("要修改科目不存在");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
	//增加学生的信息
	public boolean addUser(String user, Socket socket) {
			boolean flag = false;
			Socket s = socket;
			try {
				// 向服务器传送数据
				PrintWriter pw = new PrintWriter(s.getOutputStream());
				// 接收服务器传来的数据
				BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
				//将添加用户的指令发给服务器
				pw.print("addUser"+","+user+"\r");
				pw.flush();
				
				System.out.println("向服务器传输了数据");
				String read = br.readLine();
				System.out.println(read);
				//pw.close();
				// 服务器给我传回1，进入到修改科目的页面
				if ("0".equals(read)) {
					flag = true;
					System.out.println("进入到增加用户的界面");
					// 如果flag不为1，说明该科目不存在
				} else {
					System.out.println("要增加用户已存在");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
	// 删除学生的信息
	public boolean delStudent(String studentName, Socket socket) {
		Socket s = socket;
		boolean flag = false;
		try {
			// 向服务器传送数据
			PrintWriter pw = new PrintWriter(s.getOutputStream());
			// 接收服务器传来的数据
			BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			//将删除用户的指令发给服务器
			pw.write("deleteUser,"+studentName+"\r");
			pw.flush();
			//pw.close();
			//将要删除的用户名称发给服务器
//			pw.write(studentName + "\r");
//			pw.flush();

			System.out.println("向服务器传输了数据");
			String read = br.readLine();
			// 服务器传回1，将该学生删除
			if (flag = "1".equals(read)) {
				System.out.println("该学生已删除");
			}
			// flag不为1 说明该学生不存在
			else {
				System.out.println("该学生不存在");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	//查看全部用户
			//当管理员页面点击查看全部用户是向服务器发送请求，服务器返回一个数据
	public String[][] lookAllUser(Socket socket) {
			String[][] subjects = null;
			//向服务器发送请求，服务求会返回两个字符串，一个存放ID，一个存放科目名
			PrintWriter pw;
			try {
				pw = new PrintWriter(socket.getOutputStream());
				//将要查看全部用户的指令发给服务器
				pw.write("searchUser,"+"\r");
				pw.flush();
			//服务器返回一个对象
			ObjectInputStream ois = new ObjectInputStream(socket.getInputStream());
			//将对象写入客户端的list中
			List<Student> list = null;
			try {
				list = (List<Student>) ois.readObject();
				System.out.println(list);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			//确定二维数组的行数
			int length = list.size()+1;
			//创建一个二维数组。
			subjects = new String[length][2];
			//创建表头
			subjects[0][0] = "姓名";
			subjects[0][1] = "账号";
			//将两个一维数组整合为一个二维数组。
			for (int i = 1; i < subjects.length; i++) {
				subjects[i][0] = list.get(i-1).getID();
				subjects[i][1] = list.get(i-1).getUsername();
			}
			} catch (IOException e) {
				e.printStackTrace();
			}
			//返回一个数组
			return subjects;
		}
	//查看用户是否存在，如果存在就修改。不存在弹出错误页面
	// 先查询该学生是否存在
	public boolean modifyStudent(String studentName, Socket socket) {
		Socket s = socket;
		boolean flag = false;
		try {
			// 向服务器传送数据
			PrintWriter pw = new PrintWriter(s.getOutputStream());
			// 接收服务器传来的数据
			BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			//向服务器发送修改用户的指令
			pw.write("modifyUser"+","+studentName+"\r");
			pw.flush();
			//向服务器发送要操作的用户
//			pw.write(studentName + "\r");
//			pw.flush();
			System.out.println("向服务器传输了数据");
			String read = br.readLine();
//			pw.close()
			// 服务器传回1，该学生存在
			if ("1".equals(read)) {
				flag = true;
				System.out.println("该学生存在，显示ModifyUserSwing界面");
			}
			// flag不为1 说明该学生不存在
			else {
				System.out.println("该学生不存在");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}			
}
