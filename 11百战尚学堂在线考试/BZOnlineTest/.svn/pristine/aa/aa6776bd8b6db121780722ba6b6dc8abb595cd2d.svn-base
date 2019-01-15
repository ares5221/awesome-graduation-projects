package windowOperation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import entity.Question;

public class ModifySubWinOpe {
	// 向服务器发送修改试题请求
		//ID对应的是  List中下标+1对应的题
		//ID不能大于当前科目的题目的数量
		//trueAnswer是正确答案，发送的是radioButton的getName;
	public boolean modifyTopic(String sub,String ID, String topic, String A, String B, String C, String D, String trueAnswer,
			Socket socket) {
		//将题包装为集合
		Map<String,Question> map=new HashMap<>();
		boolean flag = false;
		try {
			// 向服务器传送数据
			PrintWriter pw = new PrintWriter(socket.getOutputStream());
			ObjectOutputStream oos=new ObjectOutputStream(socket.getOutputStream());
			// 接收服务器传来的数据
			BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			//向集合添加数据
			map.put(ID,new Question(topic, A, B, C, D, trueAnswer));
			//向服务器传输数据
			oos.writeObject(map);
			//刷新
			oos.flush();
			//向服务器传输科目
			pw.println(sub+"\r");
			pw.flush();
			System.out.println(sub);
			
			System.out.println("向服务器传输了数据");
			String read = br.readLine();
			if(flag = "1".equals(read)){
				System.out.println("修改题目成功");
				flag=true;
			}
			//没必要有else
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
