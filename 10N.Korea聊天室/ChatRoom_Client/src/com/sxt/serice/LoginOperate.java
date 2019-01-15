package com.sxt.serice;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.sql.rowset.spi.TransactionalWriter;
import javax.swing.JOptionPane;

import com.sxt.request.Communication;
import com.sxt.request.StartApp;
import com.sxt.swing.LoginSwing;
import com.sxt.vo.TransMsg;
import com.sxt.vo.Users;
/**
 * 用于登陆界面的相关操作
 * @author penglijun
 *
 */
public class LoginOperate implements ActionListener, KeyListener{
	private LoginSwing loginSwing;
	private String id;
	private String password;
	
	/**
	 * 获取当前用户
	 */
	private static Users self=null;
	
	public static Users getSelf() {
		return self;
	}

	public static void setSelf(Users self) {
		self = self;
	}

	/**
	 * 构造方法，初始化loginswing界面和添加监听事件
	 */
	public LoginOperate() {
		loginSwing=new LoginSwing();
		loginSwing.getLoginButton().addActionListener(this);
		loginSwing.getRegButton().addActionListener(this);
		loginSwing.getIdField().addKeyListener(this);
		loginSwing.getPasswordField().addKeyListener(this);
	}

	/**
	 * 登录点击事件
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		//登陆按钮
		if (e.getSource().equals(loginSwing.getLoginButton())) {
			password=loginSwing.getPasswordField().getText();
			id=loginSwing.getIdField().getText();
			Users users=new Users(id,password);
			Communication communication=new Communication();
			communication.sender(new TransMsg("login", users));
			communication.listener();
				while(true){
					ArrayList<TransMsg> list=(ArrayList<TransMsg>) communication.getList();
					Iterator<TransMsg> iterator=list.iterator();
					while (iterator.hasNext()) {
						TransMsg msg=iterator.next();
						if (msg.getFunction().equals("login")) {
							this.select(msg);	
							list.remove(msg);
							return;
						}
					}
				}
		}
		//注册按钮
		if(e.getSource().equals(loginSwing.getRegButton())){
			RegisterOperate registerOperate=new RegisterOperate();
			loginSwing.setVisible(false);
		}
	}
	
	
	
	/**
	 * 检查收到的账号信息与当前输入的账户信息是否匹配
	 * @param msg
	 */
	public void select (TransMsg msg){
		if (msg.getMsg()==null) {
			JOptionPane.showMessageDialog(null, "账号密码错误！");
			return;
		}
		Users users=(Users) msg.getMsg();
		self=users;
		if (users.getAdminStatus()==1) {
			AdminOperate adminOperate=new AdminOperate();
			loginSwing.setVisible(false);
		}else{
			MainRoomOperate mainRoomOperate=new MainRoomOperate();
			loginSwing.setVisible(false);
		}
	
		StartApp app=new StartApp();
		app.getList().add((Users) msg.getMsg());
	}

	@Override
	public void keyTyped(KeyEvent e) {
		
	}

	@Override
	public void keyPressed(KeyEvent e) {
		if(e.getKeyCode() == KeyEvent.VK_ENTER){
			password=loginSwing.getPasswordField().getText();
			id=loginSwing.getIdField().getText();
			Users users=new Users(id,password);
			Communication communication=new Communication();
			communication.sender(new TransMsg("login", users));
			communication.listener();
				while(true){
					ArrayList<TransMsg> list=(ArrayList<TransMsg>) communication.getList();
					Iterator<TransMsg> iterator=list.iterator();
					while (iterator.hasNext()) {
						TransMsg msg=iterator.next();
						if (msg.getFunction().equals("login")) {
							this.select(msg);	
							list.remove(msg);
							return;
						}
					}
				}
		}
	}

	@Override
	public void keyReleased(KeyEvent e) {
		
	}
	
	
}
