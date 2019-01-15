package com.sxt.server;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

import com.sxt.dao.Parse;
import com.sxt.server.swing.ServerSwing;
import com.sxt.service.ServersOparate;
import com.sxt.vo.TransMsg;
import com.sxt.vo.Users;
/**
 * 服务器测试版
 * @author gabriel
 *
 */
public class ServerBate {
	private static TransMsg buff;
	private static ServerSwing swing;
	private static ArrayList<Users> list;
	private static HashMap<String, Socket> smap;
	private static String FG=">>>>\t";
	public ServerBate() {
		ServerSocket server = null;
		try {
			server = new ServerSocket(8888);
		} catch (IOException e1) {
			toCmd("服务器启动失败"+FG+e1.getMessage());
			e1.printStackTrace();
		}
		ServerBate.toCmd("---------------SERVER Bate----------------");
		ServerBate.toCmd("Server Port"+FG+server.getLocalSocketAddress());
		//主线程负责所有的客户端连接
		while(true){
			Socket socket = null;
			try {
				socket = server.accept();
				toCmd(socket.getRemoteSocketAddress().toString());
			} catch (IOException e) {
				toCmd(e.getMessage());
				e.printStackTrace();
			}
			ServerBate.toCmd("Somebody Connection"+FG+socket.toString());
			new Thread(new Recv(socket)).start();
			Send send=new Send(socket);
			new Thread(send).start();
			new Thread(new chatR(socket,send.getOutputStream())).start();
		}
	}
	static{
		smap=new HashMap<>();
		swing=new ServerSwing();
		list=new ArrayList<>();
	}
	private static void toCmd(String s){
		swing.getCommandMsg().insert((s+"\r\n"), 0);;
	}
	//接收信息---------------------------------------------------
	static class Recv implements Runnable{
		private Socket socket;
		
		public Recv(Socket socket){
			this.socket=socket;
			
		}
		@Override
		public void run() {
			
			try{
			InputStream ips=this.socket.getInputStream();
			while(true){
				ObjectInputStream oips = new ObjectInputStream(ips);
				buff =(TransMsg) oips.readObject();
				toCmd("Request"+FG+buff.toString());
			//	wakeRespon();
				wakeOne(socket);
				String fun= buff.getFunction();
				if (fun==null) {
					continue;
				}
				if(fun.equals("Chat")){
					wakeRespon();
				}
			}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
	}
	
	//发送信息----------------------------------------------------
	static class Send implements Runnable{
		private Socket socket;
		private Users loginUser;
		private OutputStream outputStream;
		
		
		
		public OutputStream getOutputStream() {
			return outputStream;
		}
		public Send(Socket socket){
			this.socket=socket;
			try {
				outputStream =socket.getOutputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		@Override
		public void run() {
			try{
				OutputStream ops= outputStream;
			while(true){
			//	waitRespon();
				waitOne(socket);
				ObjectOutput oops =null;
				try{
				 oops = new ObjectOutputStream(socket.getOutputStream());
				}catch(Exception e){
					//e.printStackTrace();
//					System.out.println("掉线了---");
//					list.remove(loginUser);
//					smap.remove(loginUser.getId());
					toCmd("掉线了。。。");
					
					
					toCmd(e.toString());
				}
				ServersOparate.addToServerOnlineUser(swing.getJlt_onlineUsers(), list);
				if (oops==null) {
					continue;
				}
				String function=buff.getFunction();
		//根据函数执行功能
					switch (function) {
					//登录
					case "login": 
					{
						
						TransMsg msg4=ServersOparate.checkUser(buff);
						 loginUser=(Users) msg4.getMsg();
						if(loginUser!=null) {
							ServersOparate.addOnlineUsers(list, loginUser);
							
							ServerBate.toCmd("Add A User To List"+FG+loginUser);
							ServerBate.toCmd("ListSize"+FG+list.size());
							smap.put(loginUser.getId(), socket);
							
							}
						oops.writeObject(msg4);
						ServerBate.toCmd("Response login"+FG+msg4);
					}
						break;
						//注册用户
					case "regist":
					{
						TransMsg msg3=ServersOparate.registerUser(buff);
						oops.writeObject(msg3);
						ServerBate.toCmd("Response regist"+FG+msg3);
					}
						break;
						//用户列表
					case "UsersList":
						
					{
						TransMsg msg1=new TransMsg("UsersList", list);
						//TransMsg msg1=ServersOparate.adminShowAllUsers();
						oops.writeObject(msg1);
						ServerBate.toCmd("Response UsersList"+FG+msg1);
					}
						break;
						//管理员显示全部用户
					case "Admin-ShowAllUsers":
					{
						TransMsg msg2=ServersOparate.adminShowAllUsers();
						oops.writeObject(msg2);
						ServerBate.toCmd("Response Admin-ShowAllUsers"+FG+msg2);
					}
						break;
					//管理员删除用户
					case "Admin-DeleteUsers":
					{	
						Users users=Parse.searchUser((Users)buff.getMsg());
						TransMsg msg5=ServersOparate.delUser(buff);
						msg5.setMsg(users);
						oops.writeObject(msg5);
						ServerBate.toCmd("Response Admin-DeleteUsers"+FG+msg5);
					}
					//管理员查找用户
					case "Admin-FindUser":
					{
						TransMsg msg6=ServersOparate.AdminCheckUser(buff);
						oops.writeObject(msg6);
						ServerBate.toCmd("Response Admin-FindUser"+FG+msg6);
					}break;
					//管理员修改用户
					case "Admin-ModifyUser":
					{
						TransMsg msg6=ServersOparate.AdminModifyUser(buff);
						oops.writeObject(msg6);
					}break;
					case "Admin-SearchUser":
					{
						TransMsg msg6=ServersOparate.AdminCheckUser(buff);
						msg6.setFunction("Admin-SearchUser");
						oops.writeObject(msg6);
						ServerBate.toCmd("Response Admin-SearchUser"+FG+msg6);
					}break;
					//聊天
//					case "Chat":
//					{
//						oops.writeObject(buff);
//						
//						ServerBate.toCmd("Response Chat"+FG+buff);
//					}break;
					
//					case "SigleChat":
//					{
//						oops.writeObject(buff);
//						ServerBate.toCmd("Response SigleChat"+FG+buff);
//					}break;
					
					default:
						break;
					}
				}
			
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
	
		
	}
 static class chatR implements Runnable{
	private Socket socket;
	private Users loginUser;
	OutputStream outputStream;
	public chatR(Socket socket,OutputStream outputStream){
		this.socket=socket;
		this.outputStream=outputStream;
	}
	@Override
	public void run() {
		try{
			while(true){
					waitRespon();
					ObjectOutput oops =null;
					try{
							 oops = new ObjectOutputStream(socket.getOutputStream());
					}catch(Exception e){
						toCmd("掉线了。。。");
						toCmd(e.toString());
					}
					ServersOparate.addToServerOnlineUser(swing.getJlt_onlineUsers(), list);
					if (oops==null) {
						continue;
					}
					String function=buff.getFunction();
				
			//根据函数执行功能
						switch (function) {
						case "Chat2":
						{
							oops.writeObject(buff);
							
							ServerBate.toCmd("Response Chat"+FG+buff);
						}break;
						
						case "SigleChat":
						{
							oops.writeObject(buff);
							ServerBate.toCmd("Response SigleChat"+FG+buff);
						}break;
						
						default:
							break;
						}
					}
				
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}
	}
	//等待线程
	private  static void  waitRespon(){
		synchronized("1"){
			try {
				"1".wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	//唤醒线程
	private static void wakeRespon(){
		synchronized ("1") {
			"1".notifyAll();
		}
	}
	//等待线程
		private  static void  waitOne(Socket socket){
			synchronized(socket){
				try {
					socket.wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		//唤醒线程
		private static void wakeOne(Socket socket){
			synchronized (socket) {
				socket.notifyAll();
			}
		}

		
	public static void main(String[] args) throws Exception {
		ServerBate server=new ServerBate();
	}

}
