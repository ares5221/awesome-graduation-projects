package com.bjsxt.swing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.TextArea;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import com.bjsxt.client.Regex;
import com.bjsxt.service.Service;
import com.bjsxt.service.ServiceModify;

import javax.swing.ImageIcon;
import javax.swing.JButton;

public class Admin extends JFrame implements ActionListener,MouseListener {

	private Socket socket;
	private PrintWriter pw;
	private BufferedReader br;

	final ImageIcon iconAddTeacher=new ImageIcon("image/添加教师.png");
	final ImageIcon iconAddTeacher2=new ImageIcon("image/添加教师2.png");
	final ImageIcon iconAddStu=new ImageIcon("image/添加学生.png");
	final ImageIcon iconAddStu2=new ImageIcon("image/添加学生2.png");
	final ImageIcon iconModifyPW=new ImageIcon("image/修改密码111.png");
	final ImageIcon iconModifyPW2=new ImageIcon("image/修改密码222.png");
	final ImageIcon iconSearchUser=new ImageIcon("image/查询用户.png");
	final ImageIcon iconSearchUser2=new ImageIcon("image/查询用户2.png");
	final ImageIcon iconSubmit=new ImageIcon("image/确定.png");
	final ImageIcon iconSubmit2=new ImageIcon("image/确定2.png");
	final Image backImg =new ImageIcon("image/管理员背景.jpg").getImage();
	
	private JLabel labelAddTeacher;
	private JLabel labelAddStu;
	private JLabel labelModifyPW;
	private JLabel labelSearchUser;
	private JPanel contentPane;
	private JLabel laberUserID;
	private JTextField textUserID;
	private JLabel laberUserIDRegex;
	private JLabel labelTextarea;
	
	public Admin(Socket s) {
		setTitle("管理员界面");
		socket = s;
		try {
			pw = new PrintWriter(this.socket.getOutputStream());
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		double width = Toolkit.getDefaultToolkit().getScreenSize().getWidth();
	     double height = Toolkit.getDefaultToolkit().getScreenSize().getHeight();
	     int x=(int)(width-600)/2;
	     int y=(int)(height-420)/2;
		setBounds(x, y, 600, 420);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		labelModifyPW=new JLabel();
		labelModifyPW.setIcon(iconModifyPW);
		labelModifyPW.setBounds(20, 320, 160,43);
		labelModifyPW.addMouseListener(this);
		contentPane.add(labelModifyPW);
		
		
		labelAddStu=new JLabel();
		labelAddStu.setIcon(iconAddStu);
		labelAddStu.setBounds(20, 270, 160,43);
		labelAddStu.addMouseListener(this);
		contentPane.add(labelAddStu);
		

		labelAddTeacher=new JLabel();
		labelAddTeacher.setIcon(iconAddTeacher);
		labelAddTeacher.setBounds(20, 220, 160,43);
		labelAddTeacher.addMouseListener(this);
		contentPane.add(labelAddTeacher);
		
		labelSearchUser=new JLabel();
		labelSearchUser.setIcon(iconSearchUser);
		labelSearchUser.setBounds(330, 20, 160,43);
		labelSearchUser.addMouseListener(this);
		contentPane.add(labelSearchUser);
		
		
		  laberUserID=new JLabel("用户 I D");
		 laberUserID.setBounds(30, 20, 140, 40);
		 laberUserID.setFont(new Font("微软雅黑", 1, 20));
		 contentPane.add(laberUserID);
		 
		  textUserID=new JTextField();
		 textUserID.setBounds(130, 23, 140, 35);
		 textUserID.setFont(new Font("新宋体", 1, 18));
		 contentPane.add(textUserID);
		 
		  laberUserIDRegex=new JLabel("格式不正确");
		  laberUserIDRegex.setFont(new Font("新宋体", 1, 15));
		 laberUserIDRegex.setBounds(130, 60, 140, 35);
		 contentPane.add(laberUserIDRegex);
		 
		  labelTextarea=new JLabel();
		  labelTextarea.setFont(new Font("黑体", 1, 15));
		  labelTextarea.setForeground(Color.WHITE);
		  labelTextarea.setBounds(20, 135, 500, 60);
		 contentPane.add(labelTextarea);
		 
		 JLabel label = new JLabel("") {
				public void paint(Graphics g) {
					g.drawImage(backImg, 0, 0, this.getWidth(), this.getHeight(), null);
				}
			};
			label.setBounds(0, 0, 600, 400);
			contentPane.add(label);
		 
		 
		new Thread(new AdminRegex()).start();
		new Thread(new InfoListener()).start();
	}

	
	//发送查询用户的信息
	public void sendSearchInfo() {
		StringBuilder sb = new StringBuilder();
		sb.append("查看用户信息,");
		sb.append(textUserID.getText());
		Service.send(pw, sb.toString());
	}
	
	/*
	 * 登录界面的校正线程
	 * 每0.1秒判定一次
	 */
	private class AdminRegex implements Runnable {

		@Override
		public void run() {
			while (true) {
				regex();
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//校正
	public void regex() {
		Regex regex = new Regex();
		
		
		if (!regex.userIDRegex(textUserID.getText())) {
			laberUserIDRegex.setForeground(Color.RED);
			laberUserIDRegex.setText("2或4或6位数字");
		} else {
			laberUserIDRegex.setForeground(Color.GREEN);
			laberUserIDRegex.setText("ID格式正确");
		}
	}
	
	
	/*
	 * 内部类 当点击修改密码时创建 功能:创建一个新窗口，输入具体信息并提供提交功能
	 */
	private class ModifyPW extends JFrame implements MouseListener,ActionListener{

		private JPanel contentPane;
		private JLabel showOldPW;
		private JTextField userID;
		private JLabel PWRegex;
		private JLabel showNewPW;
		private JPasswordField newPW;
		private JLabel doublePWRegex;
		private JButton buttonSubmit;
		private JLabel labelSubmit;
		private PrintWriter pw;
		private Regex regex = new Regex();
		
		final Image backImg =new ImageIcon("image/背景图3.jpg").getImage();
		
		public ModifyPW(PrintWriter pw) {
			this.pw=pw;
			setTitle("修改密码");
			double width = Toolkit.getDefaultToolkit().getScreenSize().getWidth();
		     double height = Toolkit.getDefaultToolkit().getScreenSize().getHeight();
		     int x=(int)(width-400)/2;
		     int y=(int)(height-380)/2;
			setBounds(x, y, 400, 380);
			contentPane = new JPanel();
			contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
			setContentPane(contentPane);
			contentPane.setLayout(null);

//			buttonSubmit = new JButton("确定");
//			buttonSubmit.setFont(new Font("微软雅黑", 1, 20));
//			buttonSubmit.setBounds(100, 210, 100, 40);
//			buttonSubmit.addActionListener(this);
//			contentPane.add(buttonSubmit);

			labelSubmit = new JLabel();
			labelSubmit.setIcon(iconSubmit);
			labelSubmit.setBounds(100, 240, 160, 40);
			labelSubmit.addMouseListener(this);
			contentPane.add(labelSubmit);
			
			  showOldPW=new JLabel("用户 I  D");
			 showOldPW.setBounds(13, 50, 150, 30);
			 showOldPW.setFont(new Font("微软雅黑", 1, 19));
			contentPane.add(showOldPW);
			
			  userID=new JTextField();
			  userID.setBounds(100, 50, 135, 30);
			contentPane.add(userID);
			
			  PWRegex=new JLabel("");
			 PWRegex.setBounds(250, 50, 150, 30);
			 PWRegex.setFont(new Font("新宋体", 1, 17));
			contentPane.add(PWRegex);
			
			 showNewPW=new JLabel("设置密码");
			 showNewPW.setFont(new Font("微软雅黑", 1, 19));
			 showNewPW.setBounds(13, 145, 150, 30);
			contentPane.add(showNewPW);
			
			  newPW=new JPasswordField();
			  newPW.setBounds(100, 145, 135, 30);
			contentPane.add(newPW);
			
			  doublePWRegex=new JLabel("");
			  doublePWRegex.setBounds(250, 145, 150, 30);
			  doublePWRegex.setFont(new Font("新宋体", 1, 17));
			contentPane.add(doublePWRegex);
			
			JLabel label = new JLabel("") {
				public void paint(Graphics g) {
					g.drawImage(backImg, 0, 0, this.getWidth(), this.getHeight(), null);
				}
			};
			label.setBounds(0, 0, 400, 380);
			contentPane.add(label);
			
			new Thread(new PWRegex()).start();

		}
		
			public void sendNewPW() {
				StringBuilder sb = new StringBuilder();
				sb.append("修改用户密码,");
				sb.append(userID.getText()+",");
				sb.append(String.valueOf(newPW.getPassword()));
				Service.send(pw, sb.toString());
			}
			/*
			 * 登录界面的校正线程
			 * 每0.1秒判定一次
			 */
			private class PWRegex implements Runnable {
				@Override
				public void run() {
					while (true) {
						regex();
						try {
							Thread.sleep(100);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}

			}

			public void regex() {
				
				if (!(regex.userIDRegex(userID.getText()))) {
					PWRegex.setForeground(Color.RED);
					PWRegex.setText("ID2-6位数字");
				} else {
					PWRegex.setForeground(Color.GREEN);
					PWRegex.setText("ID格式正确");
				}
				
				if (!(regex.passwordRegex(String.valueOf(newPW.getPassword())))) {
					doublePWRegex.setForeground(Color.RED);
					doublePWRegex.setText("密码4-10位");
				} else {
					doublePWRegex.setForeground(Color.GREEN);
					doublePWRegex.setText("密码格式正确");
				}
			}

		@Override
		public void actionPerformed(ActionEvent e) {
			if(e.getSource()==buttonSubmit&&Color.GREEN.equals(PWRegex.getForeground())&&Color.GREEN.equals(doublePWRegex.getForeground()))
			{
				sendNewPW();
				userID.setText("");
			}
	}

		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void mousePressed(MouseEvent e) {
			if (e.getSource() == labelSubmit)
			{
				labelSubmit.setIcon(iconSubmit2);

			}
		}

		@Override
		public void mouseReleased(MouseEvent e) {
			if(e.getSource()==labelSubmit)
			{
				labelSubmit.setIcon(iconSubmit);
			if(Color.GREEN.equals(PWRegex.getForeground())&&Color.GREEN.equals(doublePWRegex.getForeground()))
			{
				sendNewPW();
				userID.setText("");
			}
			}
		}

		@Override
		public void mouseEntered(MouseEvent e) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void mouseExited(MouseEvent e) {
			// TODO Auto-generated method stub
			
		}
		
	}
	
	/*
	 * 内部类 在系统初始化的时候，创建一个线程 功能：监听从服务器传来的数据 并对数据进行处理和执行
	 */

	private class InfoListener implements Runnable {

		@Override
		public void run() {
			while (true) {
				judgeAdmin(Service.listen(br));
			}
		}

		/*
		 * 解析服务器传来的数据 依照标识码分别进行操作
		 */
		private void judgeAdmin(String str) {
			// TODO
			if(str.startsWith("修改用户密码"))
			{
				if("true".equals(dealInfo(str)))
				{
					JOptionPane.showMessageDialog(null, "修改成功");
				}
				else
					JOptionPane.showMessageDialog(null, "修改失败", "修改密码", JOptionPane.ERROR_MESSAGE);
			}
			if(str.startsWith("查看用户信息"))
			{
				labelTextarea.setText(dealInfo(str));
			}
			if (str.startsWith("添加学生")) {
				if ("true".equals(dealInfo(str)))
					JOptionPane.showMessageDialog(null, "添加成功");
				else
					JOptionPane.showMessageDialog(null, "添加失败", "添加", JOptionPane.ERROR_MESSAGE);
			}
			if (str.startsWith("添加教师")) {
				if ("true".equals(dealInfo(str)))
					JOptionPane.showMessageDialog(null, "添加成功");
				else
					JOptionPane.showMessageDialog(null, "添加失败", "添加", JOptionPane.ERROR_MESSAGE);
			}
		}

		/*
		 * 将获得的字符串进行处理 按“,”分开，丢掉标识码 返回有用的信息
		 */
		private String dealInfo(String str) {
			String[] sArr = str.split(",");
			return sArr[1];
		}
	}

	/*
	 * 内部类 当点击添加时创建 功能:创建一个新窗口，输入具体信息并提供提交功能
	 * 
	 */
	private class Submit extends JFrame implements MouseListener,ActionListener {
		private JTextField textID;
		private JLabel IDRegex;
		private JTextField textName;
		private JLabel nameRegex;
		private JTextField textPW;
		private JLabel PWRegex;
		private JTextField textAge;
		private JLabel ageRegex;
		private JTextField textSex;
		private JLabel sexRegex;
		private JButton buttonSubmit;
		private JLabel labelSubmit;
		private String str;
		final Image backImg =new ImageIcon("image/背景图3.jpg").getImage();

		public Submit(String str) {
			setTitle("添加");
			this.str = str;
			double width = Toolkit.getDefaultToolkit().getScreenSize().getWidth();
		     double height = Toolkit.getDefaultToolkit().getScreenSize().getHeight();
		     int x=(int)(width-400)/2;
		     int y=(int)(height-450)/2;
			setBounds(x, y, 400, 450);
			contentPane = new JPanel();
			contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
			setContentPane(contentPane);
			contentPane.setLayout(null);

			buttonSubmit = new JButton();
//			buttonSubmit.setBounds(100, 310, 100, 40);
			buttonSubmit.setFont(new Font("微软雅黑", 1, 20));
			buttonSubmit.addActionListener(this);
			contentPane.add(buttonSubmit);
			
			labelSubmit = new JLabel();
			labelSubmit.setIcon(iconSubmit);
			labelSubmit.setBounds(100, 310, 160, 40);
			labelSubmit.addMouseListener(this);
			contentPane.add(labelSubmit);

			JLabel labelID = new JLabel("I    D");
			labelID.setBounds(13, 30, 80, 20);
			labelID.setFont(new Font("微软雅黑", 1, 19));
			contentPane.add(labelID);
			textID = new JTextField();
			textID.setBounds(100, 30, 135, 30);
			contentPane.add(textID);
			IDRegex = new JLabel("");
			IDRegex.setFont(new Font("宋体", 1, 17));
			IDRegex.setBounds(250, 30, 150, 20);
			contentPane.add(IDRegex);

			JLabel labelName = new JLabel("姓名");
			labelName.setBounds(13, 80, 80, 20);
			labelName.setFont(new Font("微软雅黑", 1, 19));
			contentPane.add(labelName);
			textName = new JTextField();
			textName.setBounds(100, 80, 135, 30);
			contentPane.add(textName);
			nameRegex = new JLabel("");
			nameRegex.setFont(new Font("宋体", 1, 17));
			nameRegex.setBounds(250, 80, 150, 20);
			contentPane.add(nameRegex);

			JLabel labelPW = new JLabel("密码");
			labelPW.setBounds(13, 130, 80, 20);
			labelPW.setFont(new Font("微软雅黑", 1, 19));
			contentPane.add(labelPW);
			textPW = new JTextField();
			textPW.setBounds(100, 130, 135, 30);
			contentPane.add(textPW);
			PWRegex = new JLabel("");
			PWRegex.setFont(new Font("宋体", 1, 17));
			PWRegex.setBounds(250, 130, 150, 20);
			contentPane.add(PWRegex);

			JLabel labelAge = new JLabel("年龄");
			labelAge.setBounds(13, 180, 80, 20);
			labelAge.setFont(new Font("微软雅黑", 1, 19));
			contentPane.add(labelAge);
			textAge = new JTextField();
			textAge.setBounds(100, 180, 135, 30);
			contentPane.add(textAge);
			ageRegex = new JLabel("");
			ageRegex.setFont(new Font("宋体", 1, 17));
			ageRegex.setBounds(250, 180, 150, 20);
			contentPane.add(ageRegex);

			JLabel labelSex = new JLabel("性别");
			labelSex.setBounds(13, 230, 80, 20);
			labelSex.setFont(new Font("微软雅黑", 1, 19));
			contentPane.add(labelSex);
			textSex = new JTextField();
			textSex.setBounds(100, 230, 135, 30);
			contentPane.add(textSex);
			sexRegex = new JLabel("");
			sexRegex.setFont(new Font("宋体", 1, 17));
			sexRegex.setBounds(250, 230, 150, 20);
			contentPane.add(sexRegex);

			JLabel p = new JLabel("") 
			 {
				public void paint(Graphics g) {
					g.drawImage(backImg, 0, 0, this.getWidth(), this.getHeight(), null);
				}
			 };
			 p.setBounds(0, 0, 400,450);
			 contentPane.add(p);
			
			new Thread(new AdminRegex()).start();
		}

		/*
		 * 登录界面的校正线程 每0.5秒判定一次
		 */
		private class AdminRegex implements Runnable {

			@Override
			public void run() {
				while (true) {
					regex();
					try {
						Thread.sleep(500);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}

		}

		public void regex() {
			Regex regex = new Regex();
			if("添加学生".equals(this.str))
			{
				if (!regex.stuIDRegex(textID.getText())) {
					IDRegex.setForeground(Color.RED);
					IDRegex.setText("6位数字");
				} else {
					IDRegex.setForeground(Color.GREEN);
					IDRegex.setText("ID格式正确");
				}
			}
			else
			{
				if (!regex.teacherIDRegex(textID.getText())) {
					IDRegex.setForeground(Color.RED);
					IDRegex.setText("4位数字");
				} else {
					IDRegex.setForeground(Color.GREEN);
					IDRegex.setText("ID格式正确");
				}
			}
			if (!regex.sexRegex(textSex.getText())) {
				sexRegex.setForeground(Color.RED);
				sexRegex.setText("男或女");
			} else {
				sexRegex.setForeground(Color.GREEN);
				sexRegex.setText("性别格式正确");
			}

			if (!regex.ageRegex(textAge.getText())) {
				ageRegex.setForeground(Color.RED);
				ageRegex.setText("1-2位数字");
			} else {
				ageRegex.setForeground(Color.GREEN);
				ageRegex.setText("年龄格式正确");
			}

			if (!regex.passwordRegex(textPW.getText())) {
				PWRegex.setForeground(Color.RED);
				PWRegex.setText("4-10位");
			} else {
				PWRegex.setForeground(Color.GREEN);
				PWRegex.setText("密码格式正确");
			}

			if (!regex.nameRegex(textName.getText())) {
				nameRegex.setForeground(Color.RED);
				nameRegex.setText("1-10位汉字");
			} else {
				nameRegex.setForeground(Color.GREEN);
				nameRegex.setText("姓名格式正确");
			}

		}

		/*
		 * 向服务器发送添加课程数据 发送识别码 并且发送从输入框获得信息 将他们连接起来，并以","隔开
		 */
		public void sendAdd() {
			StringBuilder sb = new StringBuilder();
			sb.append(this.str + ",");
			sb.append(textID.getText() + ",");
			sb.append(textName.getText() + ",");
			sb.append(textPW.getText() + ",");
			sb.append(textAge.getText() + ",");
			sb.append(textSex.getText());
			Service.send(pw, sb.toString());
		}

		/*
		 * 管理员二级菜单 Submit的事件 当点击提交时
		 */
		@Override
		public void actionPerformed(ActionEvent e) {
			if (e.getSource() == buttonSubmit) {
				if (Color.GREEN.equals(IDRegex.getForeground()) &&Color.GREEN.equals(nameRegex.getForeground()) && Color.GREEN.equals(ageRegex.getForeground())
						&& Color.GREEN.equals(PWRegex.getForeground()) && Color.GREEN.equals(sexRegex.getForeground()))
				{
					sendAdd();
					dispose();
				}
				else
					JOptionPane.showMessageDialog(null, "格式不正确", "添加", JOptionPane.ERROR_MESSAGE);
			}
		}

		@Override
		public void mouseClicked(MouseEvent e) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void mousePressed(MouseEvent e) {
			if (e.getSource() == labelSubmit)
			{
				labelSubmit.setIcon(iconSubmit2);

			}
		}

		@Override
		public void mouseReleased(MouseEvent e) {
			if (e.getSource() == labelSubmit) {
				labelSubmit.setIcon(iconSubmit);
				if (Color.GREEN.equals(IDRegex.getForeground()) &&Color.GREEN.equals(nameRegex.getForeground()) && Color.GREEN.equals(ageRegex.getForeground())
						&& Color.GREEN.equals(PWRegex.getForeground()) && Color.GREEN.equals(sexRegex.getForeground()))
				{
					sendAdd();
					dispose();
				}
				else
					JOptionPane.showMessageDialog(null, "格式不正确", "添加", JOptionPane.ERROR_MESSAGE);
			}
		}

		@Override
		public void mouseEntered(MouseEvent e) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void mouseExited(MouseEvent e) {
			// TODO Auto-generated method stub
			
		}

	}

	/*
	 * 管理员菜单事件 添加学生按钮 与添加教师按钮 按下后弹出新的二级菜单，输入信息并发送至服务器
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
//		
	}


	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mousePressed(MouseEvent e) {
		if(e.getSource()==labelAddTeacher)
		{
			labelAddTeacher.setIcon(iconAddTeacher2);
		}
		if(e.getSource()==labelAddStu)
		{
			labelAddStu.setIcon(iconAddStu2);
		}
		if(e.getSource()==labelModifyPW)
		{
			labelModifyPW.setIcon(iconModifyPW2);
		}
		if(e.getSource()==labelSearchUser)
		{
			labelSearchUser.setIcon(iconSearchUser2);
		}
	}


	@Override
	public void mouseReleased(MouseEvent e) {
		if (e.getSource() == labelAddStu) {
			labelAddStu.setIcon(iconAddStu);
			Submit submit = new Submit("添加学生");
			submit.setVisible(true);
		}
		if (e.getSource() == labelModifyPW)
		{
			labelModifyPW.setIcon(iconModifyPW);
			new ModifyPW(pw).setVisible(true);
		}
		
		if (e.getSource() == labelSearchUser) {
			labelSearchUser.setIcon(iconSearchUser);
			if(Color.GREEN.equals(laberUserIDRegex.getForeground()))
			{
				sendSearchInfo();
			}
			else
			JOptionPane.showMessageDialog(null, "ID格式不正确", "查询", JOptionPane.ERROR_MESSAGE);
		}
		if (e.getSource() == labelAddTeacher) {
			labelAddTeacher.setIcon(iconAddTeacher);
			Submit submit = new Submit("添加教师");
			submit.setVisible(true);
		}
	}

}
