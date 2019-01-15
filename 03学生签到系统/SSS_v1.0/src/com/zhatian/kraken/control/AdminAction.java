package com.zhatian.kraken.control;

import java.util.List;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import com.zhatian.Tinner.entity.Sign;
import com.zhatian.Tinner.entity.SignDate;
import com.zhatian.Tinner.entity.Student;
import com.zhatian.kraken.util.KrakenRecord;
import com.zhatian.kraken.util.KrakenUtil;

/**
 * 管理员端服务器连接接口 管理员客户端可调用此类中的静态方法连接服务器
 * 
 * @author ask-kraken
 *
 */
public class AdminAction {
	private static Socket socket;
	private static ObjectInputStream input;
	private static ObjectOutputStream output;

	private static void init() throws Exception {
		socket = new Socket(KrakenUtil.getHostPath(), 9000);
		output = new ObjectOutputStream(socket.getOutputStream());
		input = new ObjectInputStream(socket.getInputStream());
		
	}

	private static void destroy() throws Exception {
		input.close();
		output.close();
		socket.close();
	}

	/**
	 * 管理员登录-11
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static boolean adminLogin(String username, String password) {
		KrakenRecord.log("AdminAction:adminLogin");
		boolean result = false;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(11);
			output.flush();
			
			output.writeUTF(username);
			output.writeUTF(password);
			output.flush();

			// 返回
			result = input.readBoolean();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 管理员新增学生-12
	 * 
	 * @param student
	 * @return
	 */
	public static boolean adminAddStudent(Student student) {
		KrakenRecord.log("AdminAction:adminAddStudent");
		boolean result = false;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(12);
			output.flush();
			
			output.writeObject(student);
			output.flush();

			// 返回
			result = input.readBoolean();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 通过Id查找学生-13
	 * 
	 * @param Id
	 * @return
	 */
	public static Student adminFindStudentById(int Id) {
		KrakenRecord.log("AdminAction:adminFindStudentById");
		Student student = null;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(13);
			output.flush();
			
			output.writeInt(Id);
			output.flush();

			// 返回
			student = (Student) input.readObject();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}

	/**
	 * 通过Username查找学生-14
	 * 
	 * @param Id
	 * @return
	 */
	public static Student adminFindStudentByUsername(String username) {
		KrakenRecord.log("AdminAction:adminFindStudentByUsername");
		Student student = null;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(14);
			output.flush();
			
			output.writeUTF(username);
			output.flush();

			// 返回
			student = (Student) input.readObject();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}

	/**
	 * 修改学生信息-15
	 * 
	 * @param student
	 * @return
	 */
	public static boolean adminChangeStudent(Student student) {
		KrakenRecord.log("AdminAction:adminChangeStudent");
		boolean result = false;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(15);
			output.flush();
			
			output.writeObject(student);
			output.flush();

			// 返回
			result = input.readBoolean();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 删除学生信息-16
	 * 
	 * @param student
	 * @return
	 */
	public static boolean adminDeleteStudent(Student student) {
		KrakenRecord.log("AdminAction:adminDeleteStudent");
		boolean result = false;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(16);
			output.flush();
			
			output.writeObject(student);
			output.flush();

			// 返回
			result = input.readBoolean();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 通过日期和班级查找学生签到信息-17
	 * 
	 * @param time
	 * @param classroom
	 * @return
	 */
	public static List<SignDate> findAllSignByTimeAndClass(String time, String classroom) {
		KrakenRecord.log("AdminAction:findAllSignByTimeAndClass");
		List<SignDate> list = null;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(17);
			output.flush();
			
			output.writeUTF(time);
			output.writeUTF(classroom);
			output.flush();

			// 返回
			list = (List<SignDate>) input.readObject();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 通过学生Id查找该学生历史日记-18
	 * 
	 * @param Id
	 * @return
	 */
	public static List<Sign> findAllSignByStudentId(Student student) {
		KrakenRecord.log("AdminAction:findAllSignByStudentId");
		List<Sign> list = null;
		try {// 获取连接
			init();

			// 传输数据
			output.writeInt(18);
			output.flush();
			
			output.writeObject(student);
			output.flush();

			// 返回
			list = (List<Sign>) input.readObject();

			destroy();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
