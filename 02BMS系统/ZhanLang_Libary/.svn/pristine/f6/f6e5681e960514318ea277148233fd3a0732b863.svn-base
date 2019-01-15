package zhanlang.view;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import javax.swing.JTextArea;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JTable;
import java.awt.Font;
import javax.swing.ImageIcon;
import java.awt.Color;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;

public class U_ShowMessage extends JFrame {

	private JPanel contentPane;

	/**
	 * Create the frame.
	 */
	public U_ShowMessage(){
		setTitle("个人信息");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 485, 351);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel label = new JLabel("");
		label.setBounds(676, 10, 93, 77);
		contentPane.add(label);
		
		JLabel label_1 = new JLabel("用户名：");
		label_1.setFont(new Font("楷体", Font.BOLD, 15));
		label_1.setBounds(167, 24, 65, 24);
		contentPane.add(label_1);
		
		JButton button_4 = new JButton("");
		button_4.setIcon(new ImageIcon(U_ShowMessage.class.getResource("/picture/text/修改按钮.jpg")));
		button_4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Client.uModifyMessageFrame = new U_ModifyMessage();
				Client.uModifyMessageFrame.setVisible(true);
				Client.uModifyMessageFrame.setLocationRelativeTo(null);
			    Client.showMessageFrame.dispose();
			}
		});
		button_4.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		button_4.setBackground(new Color(211, 211, 211));
		button_4.setBounds(120, 245, 93, 23);
		contentPane.add(button_4);
		
		JLabel label_2 = new JLabel("昵称：");
		label_2.setFont(new Font("楷体", Font.BOLD, 15));
		label_2.setBounds(167, 58, 65, 24);
		contentPane.add(label_2);
		
		JLabel label_3 = new JLabel("性别：");
		label_3.setFont(new Font("楷体", Font.BOLD, 15));
		label_3.setBounds(167, 92, 65, 24);
		contentPane.add(label_3);
		
		JButton button = new JButton("");
		button.setIcon(new ImageIcon(U_ShowMessage.class.getResource("/picture/text/返回.jpg")));
		button.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Client.showMessageFrame.dispose();
			}
		});
		button.setBounds(266, 245, 93, 23);
		contentPane.add(button);
		
		JLabel label_4 = new JLabel("");
		label_4.setIcon(new ImageIcon(U_ShowMessage.class.getResource("/img/333.jpg")));
		label_4.setBounds(22, 39, 104, 121);
		contentPane.add(label_4);
		
		JLabel uname = new JLabel(new LoginMenu().userlogin.getUserName());
	//	uname.setText(LoginMenu.user.getUserName());
		uname.setFont(new Font("黑体", Font.BOLD, 14));
		uname.setBounds(266, 24, 104, 24);
		contentPane.add(uname);
		
		JLabel name = new JLabel(new LoginMenu().userlogin.getName());
	//	name.setText(LoginMenu.user.getName());
		name.setFont(new Font("楷体", Font.BOLD, 14));
		name.setBounds(266, 58, 104, 25);
		contentPane.add(name);
		
		JLabel sex = new JLabel(new LoginMenu().userlogin.getSex());
	//	sex.setText(LoginMenu.user.getSex());
		sex.setFont(new Font("楷体", Font.BOLD, 14));
		sex.setBounds(266, 92, 104, 27);
		contentPane.add(sex);
		
		JLabel label_7 = new JLabel((String) null);
		label_7.setFont(new Font("微软雅黑", Font.PLAIN, 13));
		label_7.setBounds(448, 145, 85, 15);
		contentPane.add(label_7);
		
		JLabel label_6 = new JLabel("联系方式：");
		label_6.setFont(new Font("楷体", Font.BOLD, 15));
		label_6.setBounds(167, 195, 89, 24);
		contentPane.add(label_6);
		
		JLabel lblXxx = new JLabel(new LoginMenu().userlogin.getTel());
		lblXxx.setFont(new Font("楷体", Font.BOLD, 15));
		lblXxx.setBounds(266, 195, 179, 24);
		contentPane.add(lblXxx);
		
		JLabel label_9 = new JLabel("城市：");
		label_9.setFont(new Font("楷体", Font.BOLD, 15));
		label_9.setBounds(167, 160, 65, 24);
		contentPane.add(label_9);
		
		JLabel city = new JLabel(new LoginMenu().userlogin.getAddress());
		city.setFont(new Font("楷体", Font.BOLD, 15));
		city.setBounds(266, 160, 104, 24);
		contentPane.add(city);
		
		JLabel label_8 = new JLabel("年龄：");
		label_8.setFont(new Font("楷体", Font.BOLD, 15));
		label_8.setBounds(167, 126, 65, 24);
		contentPane.add(label_8);
		
		JLabel label_10 = new JLabel(new LoginMenu().userlogin.getAge());
		label_10.setFont(new Font("楷体", Font.BOLD, 15));
		label_10.setBounds(266, 126, 104, 27);
		contentPane.add(label_10);
		
		JLabel label_5 = new JLabel("");
		label_5.setIcon(new ImageIcon(U_ShowMessage.class.getResource("/picture/text/用户个人信息背景.jpg")));
		label_5.setBounds(0, 0, 469, 313);
		contentPane.add(label_5);
	}
}
