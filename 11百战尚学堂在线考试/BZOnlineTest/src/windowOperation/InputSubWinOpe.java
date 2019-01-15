package windowOperation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class InputSubWinOpe {
	//基于以上的addSubject方法成功，执行该方法
		// 向服务器发送增加题目和试题请求
		public boolean addTopic(String subject, String topic, String A, String B, String C, String D, String trueAnswer,
				Socket socket) {
			Socket s = socket;
			boolean flag = false;
			try {
				// 向服务器传送数据
				PrintWriter pw = new PrintWriter(s.getOutputStream());
				// 接收服务器传来的数据
				BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));

				pw.write(subject + "\r");
				pw.flush();

				pw.write(topic + "\r");
				pw.flush();

				pw.write(A + "\r");
				pw.flush();

				pw.write(B + "\r");
				pw.flush();

				pw.write(C + "\r");
				pw.flush();

				pw.write(D + "\r");
				pw.flush();

				pw.write(trueAnswer + "\r");
				pw.flush();

				System.out.println("向服务器传输了数据");
				String read = br.readLine();
				// 服务器给我传回1，将科目和试题添加
				if (flag = "1".equals(read)) {
					flag = true;
					System.out.println("科目和试题添加成功");
				}
			
				// 当以上的addSubject的方法成功，才会执行当前方法，不必考虑是否添加成功

			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
}
