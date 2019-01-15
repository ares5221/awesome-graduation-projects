package com.bjsxt.swing;

import java.awt.Color;
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

import javax.swing.ImageIcon;
import javax.swing.JButton;
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

public class Student extends JFrame implements ActionListener,MouseListener {
	private JPanel contentPane;
	private JTextField textCourseID;
	private JTextArea textArea;
	private JLabel courseIDRegex;
	private JLabel labelSeachInfo;
	private JLabel labelSeachKX;
	private JLabel labelSeachYX;
	private JLabel labelModifyPW;
	private JLabel labelChooseCourse;

	private Socket socket;
	private PrintWriter pw;
	private BufferedReader br;
	private ServiceModify sm;
	
	final Image backImg =new ImageIcon("image/背景图3.jpg").getImage();
	final ImageIcon iconSeachInfo=new ImageIcon("image/查看个人信息.png");
	final ImageIcon iconSeachInfo2=new ImageIcon("image/查看个人信息2.png");
	final ImageIcon iconSeachKX=new ImageIcon("image/查看可选信息.png");
	final ImageIcon iconSeachKX2=new ImageIcon("image/查看可选信息2.png");
	final ImageIcon iconSeachYX=new ImageIcon("image/查看已选信息.png");
	final ImageIcon iconSeachYX2=new ImageIcon("image/查看已选信息2.png");
	final ImageIcon iconModifyPW=new ImageIcon("image/修改密码1.png");
	final ImageIcon iconModifyPW2=new ImageIcon("image/修改密码2.png");
	final ImageIcon iconChooseCourse=new ImageIcon("image/选课1.png");
	final ImageIcon iconChooseCourse2=new ImageIcon("image/选课2.png");
	
	final Image image = new ImageIcon("image/主界面.jpg").getImage();
	final Image image2 = new ImageIcon("image/2.jpg").getImage();
	Graphics g;
	public Student(Socket s) {
		setTitle("学生界面");
		
		double width = Toolkit.getDefaultToolkit().getScreenSize().getWidth();
	     double height = Toolkit.getDefaultToolkit().getScreenSize().getHeight();
	     int x=(int)(width-574)/2;
	     int y=(int)(height-609)/2;
		setBounds(x, y, 574, 609);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		socket = s;
		try {
			pw = new PrintWriter(this.socket.getOutputStream());
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		labelChooseCourse = new JLabel();
		labelChooseCourse.setIcon(iconChooseCourse);
		labelChooseCourse.setBounds(350, 203, 65, 30);
		labelChooseCourse.addMouseListener(this);
		contentPane.add(labelChooseCourse);
		
		labelModifyPW = new JLabel();
		labelModifyPW.setIcon(iconModifyPW);
		labelModifyPW.setBounds(350, 203, 200, 30);
		labelModifyPW.addMouseListener(this);
		contentPane.add(labelModifyPW);
		
		labelSeachInfo=new JLabel();
		labelSeachInfo.setIcon(iconSeachInfo);
		labelSeachInfo.setBounds(23, 505, 160,43);
		labelSeachInfo.addMouseListener(this);
		contentPane.add(labelSeachInfo);
		
		labelSeachKX=new JLabel();
		labelSeachKX.setIcon(iconSeachKX);
		labelSeachKX.setBounds(198, 505, 160,43);
		labelSeachKX.addMouseListener(this);
		contentPane.add(labelSeachKX);
		
		labelSeachYX=new JLabel();
		labelSeachYX.setIcon(iconSeachYX);
		labelSeachYX.setBounds(373, 505, 160,43);
		labelSeachYX.addMouseListener(this);
		contentPane.add(labelSeachYX);
		
		
		
		textArea = new JTextArea();
		textArea.setBounds(10, 248, 532, 236);
		textArea.setBackground(new Color(217, 190, 147));
		textArea.setFont(new Font("微软雅黑", 1, 19));
		textArea.isOpaque();
		
		contentPane.add(textArea);

		textCourseID = new JTextField();
		textCourseID.setBounds(90, 205, 100, 24);
		contentPane.add(textCourseID);
		textCourseID.setColumns(10);


		JLabel lblid = new JLabel("课程ID");
		lblid.setFont(new Font("微软雅黑", 1, 19));
		lblid.setBounds(22, 205, 72, 18);
		contentPane.add(lblid);
		
		courseIDRegex = new JLabel("");
		courseIDRegex.setBounds(203, 199, 150, 40);
		courseIDRegex.setFont(new Font("宋体", 1, 15));
		contentPane.add(courseIDRegex);
		


		JLabel label = new JLabel("") {
			public void paint(Graphics g) {
				g.drawImage(image, 0, 0, this.getWidth(), this.getHeight(), null);
			}
		};
		label.setBounds(0, 0, 574, 178);
		contentPane.add(label);

		JLabel label_1 = new JLabel() {
			public void paint(Graphics g) {
				g.drawImage(image2, 0, 0, this.getWidth(), this.getHeight(), null);
			}
		};
		label_1.setBounds(345, 0, 211, 178);
		contentPane.add(label_1);
		
		JLabel p = new JLabel("") 
		 {
			public void paint(Graphics g) {
				g.drawImage(backImg, 0, 0, this.getWidth(), this.getHeight(), null);
			}
		 };
		 p.setBounds(0, 0, 574,609);
		 contentPane.add(p);
		 
		 
		new Thread(new InfoListener()).start();
		new Thread(new StuRegex()).start();
	}

	
	
	/*
	 * 向服务器发送选课数据 发送识别码 并且发送从输入框获得的ID字符串 将他们连接起来，并以","隔开
	 */
	public void sendChooseCourse() {
		StringBuilder sb = new StringBuilder();
		sb.append("选课,");
		sb.append(textCourseID.getText());
		Service.send(pw, sb.toString());
	}

	/*
	 * 登录界面的校正线程
	 * 每0.1秒判定一次
	 */
	private class StuRegex implements Runnable {

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
		Regex regex = new Regex();
		
		
		if (!regex.courseIDRegex(textCourseID.getText())) {
			courseIDRegex.setForeground(Color.RED);
			courseIDRegex.setText("课程ID两位数字");
		} else {
			courseIDRegex.setForeground(Color.GREEN);
			courseIDRegex.setText("课程ID格式正确");
		}
	}
	
	/*
	 * 内部类 在系统初始化的时候，创建一个线程 功能：监听从服务器传来的数据 并对数据进行处理和执行
	 */
	private class InfoListener implements Runnable {

		@Override
		public void run() {
			while (true) {
				judgeStu(Service.listen(br));
			}
		}
		/*
		 * 解析服务器传来的数据 依照标识码分别进行操作
		 */
		private void judgeStu(String str) {
			if (str.startsWith("学生个人信息"))
				textArea.append(dealInfo(str)+"\n" );
			if (str.startsWith("可选课程"))
				textArea.append(dealInfo(str)+"\n" );
			if (str.startsWith("已选课程"))
				textArea.append(dealInfo(str)+"\n" );
			if(str.startsWith("修改旧密码"))
			{
				if("true".equals(dealInfo(str)))
				{
					JOptionPane.showMessageDialog(null, "密码正确");
					sm.setFlag(true);
				}
				else
					JOptionPane.showMessageDialog(null, "密码错误", "修改密码", JOptionPane.ERROR_MESSAGE);
			}
			if(str.startsWith("设置新密码"))
			{
				if("true".equals(dealInfo(str)))
				{
					JOptionPane.showMessageDialog(null, "设置成功");
					sm.setFlag(false);
					sm.dispose();
				}
				else
					JOptionPane.showMessageDialog(null, "设置失败", "修改密码", JOptionPane.ERROR_MESSAGE);
			}
			if (str.startsWith("选课")) {
				if ("true".equals(dealInfo(str)))
					JOptionPane.showMessageDialog(null, "选课成功");
				else
					JOptionPane.showMessageDialog(null, "选课失败", "选课", JOptionPane.ERROR_MESSAGE);
			}
		}
		/*
		 * 将获得的字符串进行处理 按“,”分开，丢掉标识码 返回有用的信息
		 */
	}
	private String dealInfo(String str) {
		String[] sArr = str.split(",");
		return sArr[1];
	}
	/*
	 * 依据选择的按钮不同 向服务器发送不同的数据
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
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
		if(e.getSource()==labelSeachInfo)
		{
			labelSeachInfo.setIcon(iconSeachInfo2);
		}
		if(e.getSource()==labelSeachKX)
		{
			labelSeachKX.setIcon(iconSeachKX2);
		}
		if(e.getSource()==labelSeachYX)
		{
			labelSeachYX.setIcon(iconSeachYX2);
		}
		if(e.getSource()==labelChooseCourse)
		{
			labelChooseCourse.setIcon(iconChooseCourse2);
		}
		if(e.getSource()==labelModifyPW)
		{
			labelModifyPW.setIcon(iconModifyPW2);
		}
	}



	@Override
	public void mouseReleased(MouseEvent e) {
		if (e.getSource() == labelModifyPW)
		{
			labelModifyPW.setIcon(iconModifyPW);
			 sm=new ServiceModify(pw);
			sm.setVisible(true);

		}
		if (e.getSource() == labelChooseCourse)
		{
			labelChooseCourse.setIcon(iconChooseCourse);
			if(Color.GREEN.equals(courseIDRegex.getForeground()))
			{
				sendChooseCourse();
				
			}
			else
			JOptionPane.showMessageDialog(null, "格式不正确", "添加", JOptionPane.ERROR_MESSAGE);
	}
		if(e.getSource()==labelSeachInfo)
		{
			labelSeachInfo.setIcon(iconSeachInfo);
			textArea.setText("");
			textArea.append("================个人信息==================\n" );
			Service.send(pw,"学生个人信息" );
		}
		if (e.getSource() == labelSeachKX)
		{
			labelSeachKX.setIcon(iconSeachKX);
			textArea.setText("");
			textArea.append("================可选课程=================\n" );
			Service.send(pw,"可选课程");
		}
		if (e.getSource() == labelSeachYX)
		{
			labelSeachYX.setIcon(iconSeachYX);
			textArea.setText("");
			textArea.append("================已选课程==================\n");
			Service.send(pw,"已选课程");
		}
	}

}
