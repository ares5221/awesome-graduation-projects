package com.sxt.server;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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

import javax.jws.soap.SOAPBinding.Use;

import org.w3c.dom.ls.LSInput;

import com.sxt.dao.Parse;
import com.sxt.server.swing.ServerSwing;
import com.sxt.service.ServersOparate;
import com.sxt.vo.TransMsg;
import com.sxt.vo.Users;
/**
 * 服务器系统
 * @author gabriel
 *
 */
public class Server {
	private static TransMsg buff;
	private static ServerSwing swing;	
	private static ArrayList<Users> list;  //在线好友列表
	private static HashMap<String, Socket> smap;
	private static String FG=">>>>\t"; //分隔符
	public Server() {
		ServerSocket server = null;
		try {
			server = new ServerSocket(8888);
		} catch (IOException e1) {
			toCmd("服务器启动失败"+FG+e1.getMessage());
			e1.printStackTrace();
		}
		Server.toCmd("---------------突击聊天室----------------");
		Server.toCmd("Server Port"+FG+server.getLocalSocketAddress());
		//主线程负责所有的客户端连接
		while(true){
			Socket socket = null;
			try {
				socket = server.accept();
				toCmd(socket.getRemoteSocketAddress().toString());
			} catch (IOException e) {
				toCmd(e.getMessage());
				//e.printStackTrace();
			}
			Server.toCmd("Somebody Connection"+FG+socket.toString());
			new Thread(new Recv(socket)).start();
			new Thread(new Send(socket)).start();
		}
	}
	static{
		smap=new HashMap<>();
		swing=new ServerSwing();
		list=new ArrayList<>();
		swing.getSendButton().addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				buff=new TransMsg("Chat", new Users(swing.getSmID().getText(), swing.getSmName().getText(), "0", 0, swing.getSmComboBox().getSelectedItem().toString()),"宋体|20|0-0-0|"+swing.getMsgText().getText());
				wakeRespon();
			}
		});
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
				wakeRespon();
			//	wakeOne(socket);
			}
			}catch(Exception e){
			//	e.printStackTrace();
				toCmd(e.getMessage());
			}
		}
		
		
	}
	
	//发送信息----------------------------------------------------
	static class Send implements Runnable{
		private Socket socket;
		private Users loginUser;
		
		public Send(Socket socket){
			this.socket=socket;
		}
		@Override
		public void run() {
			try{
				OutputStream ops=this.socket.getOutputStream();
			while(true){
				waitRespon();
			//	waitOne(socket);
				ObjectOutput oops =null;
				try{
				 oops = new ObjectOutputStream(ops);
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
							
							Server.toCmd("Add A User To List"+FG+loginUser);
							Server.toCmd("ListSize"+FG+list.size());
							smap.put(loginUser.getId(), socket);
							
							}
						oops.writeObject(msg4);
						Server.toCmd("Response login"+FG+msg4);
					}
						break;
						//注册用户
					case "regist":
					{
						TransMsg msg3=ServersOparate.registerUser(buff);
						oops.writeObject(msg3);
						Server.toCmd("Response regist"+FG+msg3);
					}
						break;
						//用户列表
					case "UsersList":
						
					{
						TransMsg msg1=new TransMsg("UsersList", list);
						//TransMsg msg1=ServersOparate.adminShowAllUsers();
						oops.writeObject(msg1);
						Server.toCmd("Response UsersList"+FG+msg1);
					}
						break;
						//管理员显示全部用户
					case "Admin-ShowAllUsers":
					{
						TransMsg msg2=ServersOparate.adminShowAllUsers();
						oops.writeObject(msg2);
						Server.toCmd("Response Admin-ShowAllUsers"+FG+msg2);
					}
						break;
					//管理员删除用户
					case "Admin-DeleteUsers":
					{	
						Users users=Parse.searchUser((Users)buff.getMsg());
						TransMsg msg5=ServersOparate.delUser(buff);
						//msg5.setMsg(users);
						oops.writeObject(msg5);
						Server.toCmd("Response Admin-DeleteUsers"+FG+msg5);
					}
					//管理员查找用户
					case "Admin-FindUser":
					{
						TransMsg msg6=ServersOparate.AdminCheckUser(buff);
						oops.writeObject(msg6);
						Server.toCmd("Response Admin-FindUser"+FG+msg6);
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
						Server.toCmd("Response Admin-SearchUser"+FG+msg6);
					}break;
				
					//聊天室聊天
					case "Chat":
					{
						oops.writeObject(buff);
						swing.getChatMess().insert(buff.getContent()+"\r\n", 0);
						swing.getChatMess().insert(((Users)buff.getMsg()).getName()+"-- id:"+((Users)buff.getMsg()).getId()+"\r\n", 0);
						Server.toCmd("Response Chat"+FG+buff);
					}break;
					
					//私聊
					case "SigleChat":
					{
						oops.writeObject(buff);
//						swing.getChatMess().insert(buff.getContent()+"\r\n", 0);
						
						ArrayList<Users> list=(ArrayList<Users>) buff.getMsg();
						System.out.println(list);
						Users u1=list.get(0);
						Users u2=list.get(1);
//						list.clear();
//						list.add(u2);
//						list.add(u1);
						System.out.println(list);
//						swing.getChatMess().insert("私聊："+u1.getName()+"-- id:"+u1.getId()+"****"+u2.getName()+"-- id:"+u2.getId()+"\r\n",0);
						Server.toCmd("Response SigleChat"+FG+buff);
					}break;
					
					default:
						break;
					}
				}
			
			}catch(Exception e){
			//	e.printStackTrace();
				toCmd(e.getMessage());
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
		Server server=new Server();
	}

}
