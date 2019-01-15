package com.zhatian.lsx.GUI;

import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class AdminLogicOpera extends JFrame implements ActionListener{

	private JButton manage;
	private JButton checkSignInfo;
	private JButton checkLog;
	/***
	 * 
	 * 管理员所有操作的逻辑显示界面。
	 * 包括管理学生信息、查看签到信息、查看指定学生工作日志都在这里进行显示
	 * 管理员在这里进行选择操作。
	 */
	public AdminLogicOpera(){
	
		//设置窗体的基本属性，大小和初始位置。以及窗口左上角的图标
		this.setLayout(null);
		this.setTitle("炸天学生签到系统_管理员操作端");
		this.setSize(500,500);
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//背景图片设置
		ImageIcon imageBg = new ImageIcon("resource\\admin_resouces\\loginBg.jpg");
		JLabel bgLable = new JLabel(imageBg);
		//背景布局设置为空
		bgLable.setLayout(null);
		//获取当前窗体的面板内容
		Container c = this.getContentPane();
		bgLable.setBounds(0, 0, imageBg.getIconWidth(), imageBg.getIconHeight());
		c.add(bgLable);
	
		//设置左上角图片文件
		ImageIcon liftIicon = new ImageIcon("resource\\admin_resouces\\ico1.jpg"); 
		//将左上角图标换做自定义图标
		this.setIconImage(liftIicon.getImage());
		
		//-----------------------设置一个label-------------------------------
		JLabel Uplabel = new JLabel("管理员操作");
		Uplabel.setFont(new Font("楷书",Font.BOLD,28));
		Uplabel.setBounds(180,115,160,70);
		bgLable.add(Uplabel);
		//---------------------------创建三个按钮----------------------------------
		manage = new JButton("管理学生");
		manage.setFont(new Font("微软雅黑", Font.BOLD, 14));
		manage.setBounds(190,183,130,45);
		manage.addActionListener(this);
		
		checkSignInfo = new JButton("查看签到信息");
		checkSignInfo.setFont(new Font("微软雅黑", Font.BOLD, 14));
		checkSignInfo.setBounds(190,253,130,45);
		checkSignInfo.addActionListener(this);
		
		checkLog = new JButton("<html>查看指定学生<br>学习日志信息</html>");
		checkLog.setFont(new Font("微软雅黑", Font.BOLD, 14));
		checkLog.setBounds(190,323,130,45);
		checkLog.addActionListener(this);
		
		//---------------------创建一个盘子----------------------------
		JPanel panel = new JPanel();
		panel.setBounds(0, 0, 500, 500);
		//设置布局为空
		panel.setLayout(null);
		//设置此组件为透明的。Opaque是不透明的意思。如果是true，那就是不透明，即他会显示出他自己，
		//如果false，就是透明的，不显示自己，显示别人的
		panel.setOpaque(false);
		
		panel.add(manage);
		panel.add(checkSignInfo);
		panel.add(checkLog);
		
		bgLable.add(panel);
		this.setVisible(true);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == manage){
			//此处不涉及和服务器的数据的交互，只是界面的跳转。进行下一项操作而已
			new AdminManageStus();
			this.dispose();
		}else if(e.getSource() == checkSignInfo){
			new AdminCheckSignInfo();
			this.dispose();
		}else if(e.getSource() == checkLog){
			new AdminCheckWorkInfo();
			this.dispose();
		}
		
	}
	
	public static void main(String[] args) {
		new AdminLogicOpera();
	}
	
	
}
