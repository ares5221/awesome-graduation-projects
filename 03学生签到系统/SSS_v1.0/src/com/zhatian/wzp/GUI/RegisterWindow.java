package com.zhatian.wzp.GUI;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import com.zhatian.kraken.control.StudentAction;
import com.zhatian.wzp.util.Regex;


/**
 * 用户注册窗体
 * @author Wang zhanpeng
 */

public class RegisterWindow extends JFrame{
	//提升组件的作用域
	private ImageIcon background;
	private ImageIcon lg;
	private Container container;
	private JPanel jp;
	private JPanel information;
	private JLabel head;
	private JLabel logo;
	private JLabel back;
	private JLabel userLabel;
	private JLabel passwordLabel;
	private JLabel nameLabel;
	private JLabel sexLabel;
	private JLabel ageLabel;
	private JLabel classLabel;
	private JLabel bottom1;
	private JLabel bottom2;
	private JTextField userText;
	private JPasswordField passwordText;
	private JTextField nameText;
	private JRadioButton boy;
	private JRadioButton girl;
	private ButtonGroup bg;
	private JTextField ageText;
	private JTextField classText;
	private JButton okbtn;
	private JButton resert;
	private Font font;
	private JPanel timePanel;
    private JLabel timeLabel;
	private JLabel displayArea;
	private String DEFAULT_TIME_FORMAT = "HH:mm:ss";
	private String time;
	private int ONE_SECOND = 1000;
	static RegisterWindow rw;
	
	//判断用户注册成功还是失败的标志
	private boolean flag;
	
	/*
	 * 初始化窗体类
	 */
	public static void main(String[] args) {
		rw = new RegisterWindow();
	}
	
	/*
	 * 窗体组成及布局
	 */
	public RegisterWindow() {
		this.setTitle("炸天_签到系统");
		
		//保存背景和logo图片
		background = new ImageIcon("resource\\student_resources\\register.jpg");
		lg = new ImageIcon("resource\\student_resources\\logo.jpg");
		
		//初始化一个存放组件的容器
		container = this.getContentPane();
		
		//将背景和logo存放到JLabel中，并初始化JLabel的位置和大小(大小为所存图片的大小)
		back = new JLabel(background);
		logo = new JLabel(lg);
		back.setBounds(0, 0, background.getIconWidth(), background.getIconHeight());
		logo.setBounds(0, 0, lg.getIconWidth(), lg.getIconHeight());
		
		//初始化一个JPanel容器，设置其布局为空，初始化其大小和位置
		jp = new JPanel();
		jp.setLayout(null);
		jp.setBounds(0, 0, background.getIconWidth(), background.getIconHeight());
		
		//参数设置为true，设置背景色不透明
		jp.setOpaque(true);
		
		//设置窗体不可变及初始化窗体大小和位置
		this.setResizable(false);
		this.setSize(background.getIconWidth(), background.getIconHeight());
		this.setLocationRelativeTo(null);
		
		//将提示信息添加到JPanel中
		information = new JPanel();
		
		//初始化各组件
		timePanel = new JPanel();
		timeLabel = new JLabel("时间: ");
		displayArea = new JLabel();  
	    configTimeArea(); 
		timePanel.add(timeLabel);
		timePanel.add(displayArea);
		head = new JLabel("用户注册");
		userLabel = new JLabel("账 号:");
		passwordLabel = new JLabel("密 码: ");
		nameLabel = new JLabel("姓 名: ");
		sexLabel = new JLabel("性别：");
		ageLabel = new JLabel("年 龄: ");
		classLabel = new JLabel("班 级: ");
		bottom1 = new JLabel("炸天出品");
		bottom2 = new JLabel("必属精品");
		
		okbtn = new JButton("确定");
		//给确定按钮添加监听器
		okbtn.addActionListener(new myActionListener());
		resert = new JButton("重置");
		//给重置按钮添加监听器
		resert.addActionListener(new myActionListener());
		
		//给用户名、密码、姓名、性别、年龄和班级设置字体类型、颜色和大小
		font = new Font("微软雅黑", 0, 24);
		userLabel.setForeground(Color.black);
		passwordLabel.setForeground(Color.black);
		nameLabel.setForeground(Color.black);
		sexLabel.setForeground(Color.black);
		ageLabel.setForeground(Color.black);
		classLabel.setForeground(Color.black);
		timePanel.setBackground(new Color(217, 169, 121));
		timeLabel.setForeground(Color.black);
		displayArea.setForeground(Color.black);
		timeLabel.setFont(font);
		displayArea.setFont(font);
		userLabel.setFont(font);
		passwordLabel.setFont(font);
		nameLabel.setFont(font);
		sexLabel.setFont(font);
		ageLabel.setFont(font);
		classLabel.setFont(font);
		
		//给用户输入框内字体设置类型和大小
		font = new Font("楷体", 0, 20);
		userText = new JTextField();
		passwordText = new JPasswordField();
		nameText = new JTextField();
		bg = new ButtonGroup();
		boy = new JRadioButton("男", false);
		bg.add(boy);
		girl = new JRadioButton("女", false);
		bg.add(girl);
		ageText = new JTextField();
		classText = new JTextField();
		userText.setFont(font);
		nameText.setFont(font);
		ageText.setFont(font);
		classText.setFont(font);

		//给单选框内字体设置字体类型、颜色和大小
		font = new Font("楷体", 0, 22);
		boy.setFont(font);
		boy.setForeground(Color.BLUE);
		boy.setBackground(new Color(217, 169, 121));
		girl.setFont(font);
		girl.setBackground(new Color(217, 169, 121));
		girl.setForeground(Color.RED);
		
		//给确定和终止按钮内添加字体类型、大小
		font = new Font("微软雅黑", 0, 18);
		okbtn.setFont(font);
		resert.setFont(font);
		
		//给头部字体设置类型、颜色和大小
		font = new Font("微软雅黑", 0, 36);	
		head.setForeground(Color.white);
		head.setFont(font);
		
		//给尾部字体设置类型、颜色和大小
		font = new Font("微软雅黑", 0, 26);
		bottom1.setForeground(Color.white);
		bottom1.setFont(font);
		bottom2.setForeground(Color.white);
		bottom2.setFont(font);
		
		//给各个组件设置大小和布局位置(自定义坐标布局)
		head.setBounds(325, 30, 200, 80);
		logo.setBounds(220, 10, 100, 100);
		timePanel.setBounds(560, 20, 200, 50);
		userLabel.setBounds(230, 130, 100, 50);
	    passwordLabel.setBounds(230, 170, 100, 50);
	    nameLabel.setBounds(230, 210, 100, 50);
	    sexLabel.setBounds(230, 250, 100, 50);
	    ageLabel.setBounds(230, 290, 100, 50);
	    classLabel.setBounds(230, 330, 100, 50);
	    userText.setBounds(300, 140, 240, 36);
	    passwordText.setBounds(300, 180, 240, 36);
	    nameText.setBounds(300, 220, 240, 36);
	    boy.setBounds(300, 260, 60, 36);
	    girl.setBounds(420, 260, 60, 36);
	    ageText.setBounds(300, 300, 240, 36);
	    classText.setBounds(300, 340, 240, 36);
	    okbtn.setBounds(280, 390, 80, 48);
	    resert.setBounds(440, 390, 80, 48);
	    bottom1.setBounds(620, 400, 120, 60);
	    bottom2.setBounds(620, 430, 120, 60);
	    
	    //将各组件添加到JPanel中
	    jp.add(timePanel);
	    jp.add(userLabel);
	    jp.add(passwordLabel);
	    jp.add(nameLabel);
	    jp.add(sexLabel);
	    jp.add(ageLabel);
	    jp.add(classLabel);
	    jp.add(userText);
	    jp.add(passwordText);
	    jp.add(nameText);
	    jp.add(boy);
	    jp.add(girl);
	    jp.add(ageText);
	    jp.add(classText);
	    jp.add(okbtn);
	    jp.add(resert);
	    jp.add(bottom1);
	    jp.add(bottom2);
	    jp.add(head);
	    jp.add(logo);
	    jp.add(back);
	    
	    //将JPanel添加到容器中
	    container.add(jp);
	    container.add(information);
	    
	    //将容器设置为可见
		this.setVisible(true);
	}
	

 	/**
	 * 此方法创建一个计时器任务来更新每秒的时间。
	 */
	 private void configTimeArea() {
		 Timer tmr = new Timer();
		 tmr.scheduleAtFixedRate(new JLabelTimerTask(),new Date(), ONE_SECOND);
	 }
	  
	 /**
	 * 计时器任务来更新时间显示区域 
	 *
	 */
	 protected class JLabelTimerTask extends TimerTask {
		 SimpleDateFormat dateFormatter = new SimpleDateFormat(DEFAULT_TIME_FORMAT);
		 @Override
		 public void run() {
		  time = dateFormatter.format(Calendar.getInstance().getTime());
		  displayArea.setText(time);
		 }
	 }
	
	/*
	 * 构造一个内部类实现ActionListener接口来处理监听到的事件
	 */
	private class myActionListener implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			
			//监听到确定按钮事件，执行各种判断
			if(okbtn == e.getSource()) {
				
				//获得用户输入的用户名、密码、姓名、性别、年龄和班级
				String user = userText.getText();
				String password = new String(passwordText.getPassword());
				String name = nameText.getText();
				String sex = "";
				if(boy.isSelected()) {
					sex = boy.getText();
				} else if(girl.isSelected()) {
					sex = girl.getText();
				}
				
				String age = ageText.getText();
				String _class = classText.getText();	
				
				//判断输入的各种情况，包括输入为空、输入格式错误、登录成功提示和登录失败提示(采用对话框显示)
				if(user.equals("")) {
					JOptionPane.showMessageDialog(information, "请您输入用户名再注册！", "提示信息",JOptionPane. WARNING_MESSAGE); 
				} else if(password.equals("")) {
					JOptionPane.showMessageDialog(information, "请您输入密码再注册！", "提示信息",JOptionPane. WARNING_MESSAGE); 
				} else if(name.equals("")) {
					JOptionPane.showMessageDialog(information, "请您输入姓名再注册！", "提示信息",JOptionPane. WARNING_MESSAGE); 
				} else if(sex.equals("")) {
					JOptionPane.showMessageDialog(information, "请您输入性别再注册！", "提示信息",JOptionPane. WARNING_MESSAGE); 
				} else if(age.equals("")) {
					JOptionPane.showMessageDialog(information, "请您输入年龄再注册！", "提示信息",JOptionPane. WARNING_MESSAGE); 
				} else if(_class.equals("")) {
					JOptionPane.showMessageDialog(information, "请您输入班级再注册！", "提示信息",JOptionPane. WARNING_MESSAGE); 
				} else {
					boolean flag1 = Regex.usernameRegex(user);
					boolean flag2 = Regex.passwordRegex(password);
					boolean flag3 = Regex.nameRegex(name);
					boolean flag4 = Regex.sexRegex(sex);
					boolean flag5 = Regex.ageRegex(age);
					boolean flag6 = Regex.classRegex(_class);
					if(flag1 == false){
						JOptionPane.showMessageDialog(information, "用户名格式错误！", "提示信息",JOptionPane. WARNING_MESSAGE);
					} else if(flag2 == false) {
						JOptionPane.showMessageDialog(information, "密码格式错误！", "提示信息",JOptionPane. WARNING_MESSAGE);
					} else if(flag3 == false) {
						JOptionPane.showMessageDialog(information, "姓名格式错误！", "提示信息",JOptionPane. WARNING_MESSAGE);
					} else if(flag4 == false) {
						JOptionPane.showMessageDialog(information, "性别格式错误！", "提示信息",JOptionPane. WARNING_MESSAGE);
					} else if(flag5 == false) {
						JOptionPane.showMessageDialog(information, "年龄格式错误！", "提示信息",JOptionPane. WARNING_MESSAGE);
					} else if(flag6 == false) {
						JOptionPane.showMessageDialog(information, "班级格式错误！", "提示信息",JOptionPane. WARNING_MESSAGE);
					} else {
						flag = StudentAction.stuRegister(user, password, name, sex, age, _class);
						if(flag) {
							JOptionPane.showMessageDialog(information, "注册成功！", "提示信息",JOptionPane.INFORMATION_MESSAGE); 
							rw.dispose();
							LoginWindow.lw = new LoginWindow();	
						} else {
							JOptionPane.showMessageDialog(information, "注册失败！", "提示信息",JOptionPane. WARNING_MESSAGE);
						}
					}
				}
			}
			
			//监听到重置事件，将用户输入的数据清空
			if(resert == e.getSource()) {
				userText.setText("");
				passwordText.setText("");
				nameText.setText("");
				bg.clearSelection();
				ageText.setText("");
				classText.setText("");
			}
		}	
	}
}
