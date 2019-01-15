package zhanlang.view;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import zhanlang.DAO.ManagerDAO;
import zhanlang.DAO.Imple.DataExchange;
import zhanlang.DAO.Imple.ManagerDAOImple;
import zhanlang.DAO.Imple.UserDAOImple;
import zhanlang.entity.User;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import java.awt.Color;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.awt.event.ActionEvent;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.SwingConstants;

public class U_RegesterUser extends JFrame {

	private JPanel contentPane;
	private JTextField username;
	private JPasswordField pass;
	private JPasswordField repeatpass;
	private JTextField codein;
	private JLabel code;
	private JLabel codeinInfo;
	private JTextField name;
	private JRadioButton boy;
	private JRadioButton girl;
	private JComboBox city;
	private JLabel label_7;
	private JTextField age;
	private JTextField tel;

	public static Socket socket;
	private JLabel label_8;
	/**
	 * Create the frame.
	 */
	public U_RegesterUser() {
		setTitle("BMS注册");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 482, 554);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(0, 0, 0, 0));
		contentPane.setBackground(Color.LIGHT_GRAY);
		contentPane.setForeground(new Color(255, 255, 255));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel label_1 = new JLabel("");
		label_1.setIcon(new ImageIcon(U_RegesterUser.class.getResource("/picture/text/注册按钮.jpg")));
		label_1.setFont(new Font("黑体", Font.PLAIN, 24));
		label_1.setBounds(187, 10, 166, 54);
		contentPane.add(label_1);
		
		JLabel label = new JLabel("用户名：");
		label.setFont(new Font("楷体", Font.BOLD, 15));
		label.setBounds(100, 77, 99, 18);
		contentPane.add(label);
		
		JLabel label_2 = new JLabel("输入密码：");
		label_2.setFont(new Font("楷体", Font.BOLD, 15));
		label_2.setBounds(100, 318, 85, 18);
		contentPane.add(label_2);
		
		username = new JTextField();
		username.setBounds(195, 76, 129, 21);
		contentPane.add(username);
		username.setColumns(10);
		
		JButton button = new JButton("");
		button.setIcon(new ImageIcon(U_RegesterUser.class.getResource("/picture/text/提交.jpg")));
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					socket = new Socket(InetAddress.getLocalHost().getHostName(), 8888);
					Client.os = socket.getOutputStream();
					Client.is = socket.getInputStream();
				} catch (UnknownHostException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
				String userName=username.getText();
				String uname=name.getText();
				String sex;
				if(boy.isSelected()){
					sex="男";
				}else{
					sex="女";
				}
				String uage=age.getText();
				String ucity=(String) city.getSelectedItem();
				String utel=tel.getText();
				String password=pass.getText();
				String urepeatpass=repeatpass.getText();
				
				//判断密码两次提交是否相同
				if(!password.equals(urepeatpass)){
					JOptionPane.showMessageDialog(null, "两次密码输入不一致！");
					return;
				}
				
				
				//验证码判断
				String c=code.getText();
				String ci=codein.getText();
				if(!c.equalsIgnoreCase(ci)){
					codeinInfo.setText("验证码输入错误，请重新输入！");
					return;
				}
				codeinInfo.setText("");
				String command=new String("addUser");
				User user=new User(uname, sex, utel, uage, ucity, userName, password);
				
				DataExchange dataChange=new DataExchange();
				try {
					if(dataChange.doWork(command, user)){
						JOptionPane.showMessageDialog(null, "注册成功！");
					}else{
						JOptionPane.showMessageDialog(null, "用户已经存在，请重新注册！");
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}finally{
					try {
						Client.os.close();
						Client.is.close();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				
				
			
				
				
			}
		});
		button.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		button.setBackground(new Color(211, 211, 211));
		button.setBounds(105, 448, 66, 23);
		contentPane.add(button);
		
		JLabel lblima = new JLabel("重复密码：");
		lblima.setFont(new Font("楷体", Font.BOLD, 15));
		lblima.setBounds(100, 361, 99, 18);
		contentPane.add(lblima);
		
		JButton reset = new JButton("");
		reset.setIcon(new ImageIcon(U_RegesterUser.class.getResource("/picture/text/重置按钮.jpg")));
		reset.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				username.setText("");
				name.setText("");
				tel.setText("");
				pass.setText("");
				age.setText("");
				repeatpass.setText("");
				codein.setText("");
			}
		});
		reset.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		reset.setBackground(new Color(211, 211, 211));
		reset.setBounds(182, 448, 66, 23);
		contentPane.add(reset);
		
		JButton button_2 = new JButton("");
		button_2.setIcon(new ImageIcon(U_RegesterUser.class.getResource("/picture/text/返回.jpg")));
		button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Client.loginMenuFrame= new LoginMenu();	
				Client.loginMenuFrame.setVisible(true);	
				Client.uRegesterFrame.dispose();
			}
		});
		button_2.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		button_2.setBackground(new Color(211, 211, 211));
		button_2.setBounds(258, 448, 66, 23);
		contentPane.add(button_2);
		
		pass = new JPasswordField();
		pass.setBounds(195, 318, 129, 21);
		contentPane.add(pass);
		
		repeatpass = new JPasswordField();
		repeatpass.setBounds(195, 361, 129, 21);
		contentPane.add(repeatpass);
		
		JLabel label_3 = new JLabel("姓名：");
		label_3.setFont(new Font("楷体", Font.BOLD, 15));
		label_3.setBounds(100, 118, 99, 18);
		contentPane.add(label_3);
		
		name = new JTextField();
		name.setColumns(10);
		name.setBounds(195, 117, 129, 21);
		contentPane.add(name);
		
		JLabel label_4 = new JLabel("性别：");
		label_4.setFont(new Font("楷体", Font.BOLD, 15));
		label_4.setBounds(100, 157, 99, 18);
		contentPane.add(label_4);
		
		boy = new JRadioButton("男");
		boy.setFont(new Font("楷体", Font.BOLD, 14));
		boy.setBounds(195, 156, 42, 23);
		contentPane.add(boy);
		
		girl = new JRadioButton("女");
		girl.setFont(new Font("楷体", Font.BOLD, 14));
		girl.setBounds(282, 156, 42, 23);
		contentPane.add(girl);
		
		JLabel label_5 = new JLabel("城市：");
		label_5.setFont(new Font("楷体", Font.BOLD, 15));
		label_5.setBounds(100, 243, 99, 18);
		contentPane.add(label_5);
		
		city = new JComboBox();
		city.setModel(new DefaultComboBoxModel(new String[] {"北京市 ", "天津市", "上海市", "重庆市", "河北省", "山西省", "辽宁省", "吉林省", "黑龙江省", "江苏省", "浙江省", "安徽省", "福建省", "江西省", "山东省", "河南省", "湖北省", "湖南省", "广东省", "海南省", "四川省", "贵州省", "云南省", "陕西省", "甘肃省", "青海省", "台湾省", "内蒙古自治区", "广西壮族自治区", "西藏自治区", "宁夏回族自治区", "新疆维吾尔自治区", "香港特别行政区", "澳门特别行政区"}));
		city.setBounds(195, 243, 124, 21);
		contentPane.add(city);
		
		JLabel lblQq = new JLabel("联系方式：");
		lblQq.setFont(new Font("楷体", Font.BOLD, 15));
		lblQq.setBounds(100, 281, 85, 18);
		contentPane.add(lblQq);
		
		JLabel label_6 = new JLabel("验证码：");
		label_6.setFont(new Font("楷体", Font.BOLD, 15));
		label_6.setBounds(100, 399, 75, 18);
		contentPane.add(label_6);
		
		code = new JLabel("");
		code.setHorizontalAlignment(SwingConstants.LEFT);
		code.setIcon(null);
		code.setFont(new Font("楷体", Font.BOLD, 16));
		code.setBounds(282, 399, 56, 18);
		
		String t=getCode();
		code.setText(t);
		contentPane.add(code);
		
		codein = new JTextField();
		codein.setBounds(195, 399, 66, 21);
		contentPane.add(codein);
		codein.setColumns(10);
		
		codeinInfo = new JLabel("");
		codeinInfo.setForeground(Color.RED);
		codeinInfo.setBounds(195, 427, 232, 15);
		contentPane.add(codeinInfo);
		
		label_7 = new JLabel("年龄：");
		label_7.setFont(new Font("楷体", Font.BOLD, 15));
		label_7.setBounds(100, 200, 99, 18);
		contentPane.add(label_7);
		
		age = new JTextField();
		age.setColumns(10);
		age.setBounds(195, 199, 129, 21);
		contentPane.add(age);
		
		tel = new JTextField();
		tel.setColumns(10);
		tel.setBounds(195, 281, 129, 21);
		contentPane.add(tel);
		
		label_8 = new JLabel("");
		label_8.setIcon(new ImageIcon(U_RegesterUser.class.getResource("/picture/text/注册页面背景.jpg")));
		label_8.setBounds(0, 0, 466, 516);
		contentPane.add(label_8);
	}
	public static String getCode(){
		String s="zxcvbnmqwertyuiopasdfghjklZXCVBNMQWERTYUIOPASDFGHJKL0123456789";
		String code="";
		for(int i=1;i<=4;i++){
			int index=(int)(Math.random()*s.length());
			code+=s.charAt(index);
		}
		return code;
	}
}
