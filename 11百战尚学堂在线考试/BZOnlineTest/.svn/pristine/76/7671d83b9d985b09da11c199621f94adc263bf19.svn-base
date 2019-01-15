package windowOperation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ModifyUserWinOpe {
	// 基于以上modifyStudent的方法，先判断学生的存在，再进行以下的方法。
		// 向服务器传输 修改用户名和密码的请求，不考虑学生的姓名
		public boolean modifyUser(String username, String oldpassword, String newpassword, String reNewpassword ,Socket socket) {
			Socket s = socket;
			boolean flag = false;
			try {
				// 向服务器传送数据
				PrintWriter pw = new PrintWriter(s.getOutputStream());
				// 接收服务器传来的数据
				BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));

				pw.print(username+"\r");
				pw.flush();

				pw.print(oldpassword+"\r");
				pw.flush();

				pw.print(newpassword+"\r");
				pw.flush();
				
				pw.print(reNewpassword+"\r");
				pw.flush();
				System.out.println("向服务器传输了数据");
				String read = br.readLine();
				// 服务器传回1，成功修改用户名和密码
				if ("1".equals(read)) {
					flag = true;
					System.out.println("修改用户密码成功");
				}
				// 不用else了
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
}
