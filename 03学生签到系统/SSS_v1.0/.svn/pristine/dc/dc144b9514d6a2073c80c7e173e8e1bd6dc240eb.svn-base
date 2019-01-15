package com.zhatian.lsx.GUI;

import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import com.zhatian.kraken.control.AdminAction;
import com.zhatian.wzp.util.Regex;

public class AdminLogin extends JFrame implements ActionListener {

	//一定注意命名规范
	private JButton login;
	private JButton quit;
	private JTextField userNameField;
	private JTextField pwdField;
	private JPanel panel;
	/***
	 * 
	 * 管理员登陆界面，也是管理员客户端登入系统的入口
	 * 管理员必须输入指定的用户名和密码。才能登陆成功。
	 * 
	 * 管理员用户名：admin
	 * 管理员密码：123456
	 */
	public AdminLogin() {
		
		/*
		 * 自定义布局，首先是设置布局为null。不然有默认布局的效果会干扰。
		 * 如果有默认布局的干扰，就没有办法按照自己的想法去自定义了
		 */
		this.setLayout(null);
		this.setTitle("炸天学生签到系统_管理员登录");
		this.setSize(500, 500);
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//设置背景图片放在lable里
		ImageIcon imageBg = new ImageIcon("resource\\admin_resouces\\loginBg.jpg");
		JLabel bgLable = new JLabel(imageBg);
		//背景在这个框架中会被作为桌布，所以需要设置布局为空
		bgLable.setLayout(null);
		bgLable.setBounds(0, 0, imageBg.getIconWidth(), imageBg.getIconHeight());
		//获取窗体对象
		Container c = this.getContentPane();
		c.add(bgLable);

		// 设置左上角图片文件
		ImageIcon liftIicon = new ImageIcon("resource\\admin_resouces\\ico1.jpg");
		// 将左上角图标换做自定义图标
		this.setIconImage(liftIicon.getImage());
		//弹窗用
		panel = new JPanel();
		
		// -------------------------------1、设置用户名和紧跟这个的输入文本框------------------------------------
		JLabel label1 = new JLabel("用户名：");
		label1.setFont(new Font("微软雅黑", Font.PLAIN, 18));
		label1.setBounds(141, 210, 100, 25);
		userNameField = new JTextField(20);
		userNameField.setBounds(215, 210, 120, 25);

		// -------------------------------2、设置密码和紧跟这个的输入文本框------------------------------------
		JLabel label2 = new JLabel("密码：");
		label2.setFont(new Font("微软雅黑", Font.PLAIN, 18));
		label2.setBounds(160, 250, 100, 25);
		pwdField = new JPasswordField();
		pwdField.setBounds(215, 250, 120, 25);

		// -------------------------------3、添加该组件到桌布------------------------------------
		bgLable.add(label1);
		bgLable.add(userNameField);
		bgLable.add(label2);
		bgLable.add(pwdField);

		// 定义两个鼠标
		login = new JButton("登录");
		login.setFont(new Font("微软雅黑", Font.BOLD, 12));
		login.setBounds(180, 300, 60, 30);
		login.addActionListener(this);
		
		quit = new JButton("退出");
		quit.setFont(new Font("微软雅黑", Font.BOLD, 12));
		quit.setBounds(260, 300, 60, 30);
		quit.addActionListener(this);
		
		bgLable.add(login);
		bgLable.add(quit);

		// --------------------------再定义两个标签------------------------------
		JLabel labelAdmin = new JLabel("管理员登录");
		labelAdmin.setFont(new Font("", Font.BOLD, 25));
		labelAdmin.setBounds(190, 130, 140, 70);
		bgLable.add(labelAdmin);

		JLabel authorLabel = new JLabel("<html>炸天出品<br>必属精品</html>");
		authorLabel.setFont(new Font("", Font.BOLD, 18));
		authorLabel.setBounds(290, 340, 140, 70);
		bgLable.add(authorLabel);

		this.setVisible(true);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == login) {
			//获取文本框中的输入内容。
			String useName = this.userNameField.getText();
			String pwd = (String) this.pwdField.getText();
			//定义一个标识标量
			boolean flag;
			//对用户输入的姓名和密码进行校验
			if (Regex.usernameRegex(useName)) {
				if (Regex.passwordRegex(pwd)) {
					//双层判断，当输入的用户名和密码都是符合规范的时候，将这两个数据传给服务器，由服务器进行匹配判断，正确返回true，错误返回false
					flag = AdminAction.adminLogin(useName, pwd);
					if (flag) {
						//如果输入的用户名和密码和系统服务器相同，则会返回true。则登陆成功，进到下一个界面
						new AdminLogicOpera();
						//使当前窗体消失
						this.dispose();
					} else {
						//如果登陆失败则进行友好提示。
						//此处的提示信息是输入的信息和系统的用户名和密码不匹配造成的
						JOptionPane.showMessageDialog(panel, "登录失败,用户名或密码错误！");
						//将文本框的信息清空
						userNameField.setText("");
						pwdField.setText("");
					}
				} else {//此处为密码输入不正确
					JOptionPane.showMessageDialog(panel, "密码格式不对，请重新输入");
					userNameField.setText("");
					pwdField.setText("");

				}
			} else {//此处为用户名输入不正确
				JOptionPane.showMessageDialog(panel, "用户名格式不对，请重新输入");
				userNameField.setText("");
				pwdField.setText("");
			}

		} else if (e.getSource() == quit) {
			this.dispose();
		}
	}

	public static void main(String[] args) {
		new AdminLogin();

	}

}
