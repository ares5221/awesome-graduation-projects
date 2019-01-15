package windowOperation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class AddUserWinOpe {
	/**
	 * 
	 * @param name   Users.xml的student的ID（姓名）
	 * @param username	用户名
	 * @param password	密码
	 * @param surePassword	确认密码
	 * @param socket
	 * @return
	 */

	// 向服务器传输增加用户的请求
		public boolean addyUser(String name, String username, String password,String surePassword, Socket socket) {
			boolean flag = false;
			try {
				// 向服务器传送数据
				PrintWriter pw = new PrintWriter(socket.getOutputStream());
	
				pw.write(name+"\r");
				pw.flush();

				pw.write(username+"\r");
				pw.flush();

				pw.write(password+"\r");
				pw.flush();
				
				pw.write(surePassword+"\r");
				pw.flush();
				// 接收服务器传来的数据
				BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));

				System.out.println("向服务器传输了数据");
				String read = br.readLine();

				if ("0".equals(read)){
					flag = true;
					System.out.println("增加用户成功");
				}
			/*	if ("2".equals(read)){
					flag = true;
					System.out.println("两次密码不正确");
				}*/
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;

		}
		
}
