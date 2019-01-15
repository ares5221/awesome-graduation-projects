package windows;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import windowOperation.AddUserWinOpe;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.awt.Color;

public class AddUserSwing extends JFrame implements ActionListener,MouseListener{
	private JTextField tfUsername;// 姓名
	private JTextField tfpassword;// 密码
	private JTextField tfNewPassword;// 新密码
	private JLabel jUsername;
	private JLabel jpassword;
	private JLabel jAgainPassword;
	private JButton btCommit;// 提交
	private JButton btReset;// 重置
	private JLabel jId;
	private JLabel tfId;//账号
	private String user;
	private PrintWriter pw;//创建流，用于向服务器传送数据
	// 定义socket对象
	private Socket socket;

	// ================添加用户界面======================
	public AddUserSwing(Socket socket,String user) {
		this.socket = socket;
		this.user = user;
		
		setTitle("BZ增加用户");
		setSize(400, 353);   
        setLocation(200, 50); 
        setBackground(Color.WHITE);
        setResizable(false);
        String path = "image/addUser.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0, this.getWidth(), this.getHeight());  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);
		
		jUsername = new JLabel("用户名:");
		jUsername.setFont(new Font("宋体", Font.PLAIN, 16));
		jUsername.setBounds(97, 93, 56, 15);
		getContentPane().add(jUsername);
		
		tfUsername = new JTextField(10);
		tfUsername.setFont(new Font("宋体", Font.PLAIN, 16));
		tfUsername.setBounds(163, 90, 120, 20);
		getContentPane().add(tfUsername);

		jpassword = new JLabel("密码:");
		jpassword.setFont(new Font("宋体", Font.PLAIN, 16));
		jpassword.setBounds(107, 130, 40, 15);
		getContentPane().add(jpassword);
		
		tfpassword = new JTextField(10);
		tfpassword.setFont(new Font("宋体", Font.PLAIN, 16));
		tfpassword.setBounds(163, 130, 120, 20);
		getContentPane().add(tfpassword);

		jAgainPassword = new JLabel("确认密码:");
		jAgainPassword.setFont(new Font("宋体", Font.PLAIN, 16));
		jAgainPassword.setBounds(73, 167, 80, 15);
		getContentPane().add(jAgainPassword);
		
		tfNewPassword = new JTextField(10);
		tfNewPassword.setFont(new Font("宋体", Font.PLAIN, 16));
		tfNewPassword.setBounds(163, 164, 120, 20);
		getContentPane().add(tfNewPassword);

		btCommit = new JButton("提交");
		btCommit.setForeground(Color.WHITE);
		btCommit.setBackground(Color.DARK_GRAY);
		btCommit.setFont(new Font("宋体", Font.PLAIN, 16));
		btCommit.setBounds(90, 202, 100, 25);
		btCommit.addActionListener(this);
		btCommit.addMouseListener(this);
		btCommit.setFocusPainted(false);
		getContentPane().add(btCommit);

		btReset = new JButton("重置");
		btReset.setForeground(Color.WHITE);
		btReset.setBackground(Color.GRAY);
		btReset.setFont(new Font("宋体", Font.PLAIN, 16));
		btReset.setBounds(190, 202, 100, 25);
		btReset.addActionListener(this);
		btReset.addMouseListener(this);
		btReset.setFocusable(false);
		getContentPane().add(btReset);

		jId = new JLabel("姓名:");
		jId.setFont(new Font("宋体", Font.PLAIN, 16));
		jId.setBounds(113, 57, 40, 15);
		getContentPane().add(jId);

		tfId = new JLabel();
		tfId.setFont(new Font("宋体", Font.PLAIN, 16));
		tfId.setBounds(163, 57, 120, 21);
		tfId.setText(user);
		getContentPane().add(tfId);
		
		imagePanel.setOpaque(false);  
	    this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
	    setVisible(true);  
	    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

	/*
	 * 当我们点击提交的时候，弹出添加成功界面，并返回管理员界面 当我们点击重置时，重置当前的界面。全部为空。
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		AddUserWinOpe aOpe = new AddUserWinOpe();
		// 提交按钮
		if (e.getSource() == btCommit) {
			try {
				//向服务器发送页面的指令
				pw = new PrintWriter(socket.getOutputStream());
				pw.print("1"+"\r");
				pw.flush();
				System.out.println("向服务器发送界面信息");
			
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			// ===================和服务器交互的功能模块========================
			// 得到文本框中的内容
			String name = tfId.getText();
			String username = tfUsername.getText();
			String password = tfpassword.getText();
			String newpassword = tfNewPassword.getText();
			System.out.println(name+"--"+username+"--"+password+"--"+newpassword);
			if (password.equals(newpassword)) {
				// 向服务器提交用户信息
				boolean flag = aOpe.addyUser(name, username, password,newpassword, socket);
				if (flag) {// 导出新界面
					TeacherSwing tSwing = new TeacherSwing(socket);
					tSwing.setVisible(true);
					this.setVisible(false);
				}
				if (!flag) {//弹出错误界面
					JOptionPane.showConfirmDialog(null,"该用户已存在");
				}				
			}
			
//			TeacherSwing tSwing = new TeacherSwing(socket);
//			tSwing.setVisible(true);
//			this.setVisible(false);

		}
		// 重置按钮
		if (e.getSource() == btReset) {
			tfUsername.setText("");
			tfpassword.setText("");
			tfNewPassword.setText("");
		}
	}
	//添加鼠标监听事件
	@Override
	public void mouseClicked(MouseEvent e) {}
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	public void mouseEntered(MouseEvent e) {
		//鼠标放到按钮上，按钮背景颜色变为黑色
		if (e.getSource() == btCommit) {
			btCommit.setBackground(Color.BLACK);
		}
		else if (e.getSource() == btReset) {
			btReset.setBackground(Color.BLACK);
		}
	}

	@Override
	public void mouseExited(MouseEvent e) {
		//鼠标移开按钮，按钮颜色恢复
		if (e.getSource() == btCommit) {
			btCommit.setBackground(Color.DARK_GRAY);
		}
		else if (e.getSource() == btReset) {
			btReset.setBackground(Color.GRAY);
		}
	}

}
