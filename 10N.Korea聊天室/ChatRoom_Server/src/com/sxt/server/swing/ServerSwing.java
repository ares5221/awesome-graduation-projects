package com.sxt.server.swing;

import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import com.sxt.dao.Parse;
import com.sxt.server.Server;
import com.sxt.service.HeadImage;
import com.sxt.vo.Users;

import javax.swing.JLabel;
import java.awt.Color;
import javax.swing.ScrollPaneConstants;
import javax.swing.JPanel;
import java.awt.Font;
import java.awt.Label;
import java.awt.Component;
import javax.swing.JTextField;
import javax.swing.JComboBox;

/**
 * 服务器主界面
 * 
 * @author Administrator
 */
public class ServerSwing extends JFrame implements ActionListener{

	private JButton jbt_start; // 启动服务器按钮
	private JButton jbt_stop; // 停止服务器按钮
	private JButton jbt_exit; // 退出服务器按钮
	private JTextArea chatMess; // 聊天消息
	private JList jlt_onlineUsers; // 在线用户
	private JTextArea commandMsg; //模拟用户发送聊天消息文本框
	private JButton sendButton; //模拟用户发送按钮
	private JTextArea smName;	//模拟用户昵称
	private JComboBox smComboBox;//模拟用户选择头像

	private Server server;

	public List<String> online_usernames; // 在线用户名集合
	public List<Integer> online_usernameids; // 在线用户ID集合

	public ServerSwing() {
		getContentPane().setBackground(new Color(255, 99, 71));
		setBackground(new Color(255, 99, 71));
		online_usernames = new ArrayList<String>();
		online_usernameids = new ArrayList<Integer>();
		try {
			// 把外观设置成你所使用的平台的外观,也就是你这个程序在哪个平台运行,
			// 显示的窗口,对话框外观将是哪个平台的外观.
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (ClassNotFoundException e) {// 加载类的时候发现类不存在在类路径的时候报出的
			e.printStackTrace();
		} catch (InstantiationException e) {// 实例化异常。当试图通过newInstance()方法创建某个类的实例,而该类是一个抽象类或接口时,抛出该异常。
			e.printStackTrace();
		} catch (IllegalAccessException e) {// 非法访问异常
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			e.printStackTrace();
		}
		setTitle("聊天室服务器");
		setIconImage(Toolkit.getDefaultToolkit().getImage(ServerSwing.class.getResource("/resource/hmbb.png")));
		setSize(888, 911);
		setResizable(false);
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent arg0) {
				jbt_exit.doClick();// 调用Windows中的窗口关闭事件
			}
		});
		getContentPane().setLayout(null);

		jbt_start = new JButton("启动服务器");
		jbt_start.setBounds(20, 23, 103, 34);// 位置大小
		jbt_start.addActionListener(this);// 按钮监听
		getContentPane().add(jbt_start);
		jbt_start.setEnabled(false);

		jbt_stop = new JButton("停止服务器");
		jbt_stop.setBounds(133, 23, 103, 34);
		
		jbt_stop.addActionListener(this);
		getContentPane().add(jbt_stop);

		jbt_exit = new JButton("退出服务器");
		jbt_exit.setBounds(246, 23, 103, 34);
		jbt_exit.addActionListener(this);
		getContentPane().add(jbt_exit);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 64, 549, 302);
		scrollPane.setWheelScrollingEnabled(true);
		scrollPane.setBorder(BorderFactory.createTitledBorder("聊天消息"));
		getContentPane().add(scrollPane);
		// 聊天消息显示框
		chatMess = new JTextArea();
		chatMess.setFont(new Font("微软雅黑 Light", Font.BOLD, 14));
		chatMess.setBackground(new Color(102, 205, 170));
		scrollPane.setViewportView(chatMess);

		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(569, 64, 307, 302);
		scrollPane_1.setBorder(BorderFactory.createTitledBorder("在线用户"));
		getContentPane().add(scrollPane_1);
		// 在线人数显示
		jlt_onlineUsers = new JList<>();
//		MyListModel model=new MyListModel((ArrayList<Users>)Parse.getUser());
//		MyCellRenderer cellRenderer=new MyCellRenderer();
//		jlt_onlineUsers.setCellRenderer(cellRenderer);
//		jlt_onlineUsers.setModel(model);
		
		
		
		jlt_onlineUsers.setDragEnabled(true);
		jlt_onlineUsers.setFocusTraversalKeysEnabled(false);
		jlt_onlineUsers.setFocusable(false);
		jlt_onlineUsers.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		jlt_onlineUsers.setBackground(new Color(102, 205, 170));
		jlt_onlineUsers.setVisibleRowCount(5);
		scrollPane_1.setViewportView(jlt_onlineUsers);
		
		JPanel panel = new JPanel();
		panel.setBounds(10, 522, 866, 345);
		
		panel.setLayout(null);
		
		cmdLabel = new JLabel("控制台消息：");
		cmdLabel.setBounds(0, 0, 76, 22);
		panel.add(cmdLabel);
		
		scrollPane_2 = new JScrollPane();
		scrollPane_2.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane_2.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPane_2.setBounds(0, 32, 856, 313);
		 commandMsg=new JTextArea("");
		 commandMsg.setSelectionColor(new Color(255, 20, 147));
		 commandMsg.setToolTipText("");
		 commandMsg.setForeground(new Color(255, 255, 255));
		 commandMsg.setFont(new Font("微软雅黑 Light", Font.BOLD, 16));
		 commandMsg.setBackground(new Color(95, 158, 160));
		scrollPane_2.setViewportView(commandMsg);
		panel.add(scrollPane_2);
		getContentPane().add(panel);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(169, 169, 169));
		panel_1.setBounds(10, 376, 591, 136);
		getContentPane().add(panel_1);
		panel_1.setLayout(null);
		
		lblNewLabel = new JLabel("模拟用户");
		lblNewLabel.setOpaque(true);
		lblNewLabel.setBounds(0, 0, 866, 15);
		panel_1.add(lblNewLabel);
		
		label = new JLabel("用户名：");
		label.setForeground(new Color(240, 255, 255));
		label.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		label.setBounds(0, 28, 83, 21);
		panel_1.add(label);
		
		 smName = new JTextArea();
		smName.setBounds(79, 25, 77, 24);
		panel_1.add(smName);
		
		JLabel lblId = new JLabel("ID：");
		lblId.setForeground(new Color(255, 255, 255));
		lblId.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		lblId.setBounds(180, 29, 54, 15);
		panel_1.add(lblId);
		
		smID = new JTextField();
		smID.setBounds(220, 25, 93, 27);
		panel_1.add(smID);
		smID.setColumns(10);
		
		JLabel label_1 = new JLabel("头像：");
		label_1.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		label_1.setForeground(new Color(255, 255, 255));
		label_1.setBounds(340, 26, 57, 24);
		panel_1.add(label_1);
		
		 smComboBox = new JComboBox();
		smComboBox.setBounds(407, 28, 70, 27);
		File[] files = HeadImage.getAllHead();
		for (int i = 0; i < files.length; i++) {
			smComboBox.addItem(files[i].getName());
		}
		panel_1.add(smComboBox);
		
		msgText = new JTextField();
		msgText.setForeground(new Color(255, 0, 0));
		msgText.setFont(new Font("宋体", Font.PLAIN, 14));
		msgText.setBounds(68, 66, 354, 38);
		panel_1.add(msgText);
		msgText.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("消息：");
		lblNewLabel_1.setForeground(new Color(255, 255, 255));
		lblNewLabel_1.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		lblNewLabel_1.setBounds(0, 72, 70, 30);
		panel_1.add(lblNewLabel_1);
		
		 sendButton = new JButton("发送");
		sendButton.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		sendButton.setBackground(new Color(0, 139, 139));
		sendButton.setBounds(450, 63, 102, 39);
		panel_1.add(sendButton);
		
		button = new JButton("预览头像");
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				new HeadWindow().setVisible(true);
			}
		});
		button.setFont(new Font("微软雅黑 Light", Font.PLAIN, 9));
		button.setBounds(498, 29, 70, 27);
		panel_1.add(button);
		
		timelable1 = new JLabel("13:10:20");
		timelable1.setFont(new Font("华文彩云", Font.BOLD | Font.ITALIC, 46));
		timelable1.setBounds(641, 429, 231, 74);
	//时间显示
		new Thread(new Runnable() {
			@Override
			public void run() {
				while(true){
					SimpleDateFormat dateFormat1=new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat dateFormat2=new SimpleDateFormat("HH:mm:ss");
					timelable0.setText(dateFormat1.format(new Date()));
					timelable1.setText(dateFormat2.format(new Date()));
					try {
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}).start();
		getContentPane().add(timelable1);
		
		timelable0 = new JLabel("207-08-31");
		timelable0.setFont(new Font("华文琥珀", Font.BOLD, 26));
		timelable0.setBounds(611, 376, 156, 43);
		getContentPane().add(timelable0);
		setVisible(true);
	}

	/**
	 * 鼠标点击事件
	 */
	private static final long serialVersionUID = 1L;
	private JLabel cmdLabel;
	private JScrollPane scrollPane_2;
	private JLabel lblNewLabel;
	private JLabel label;
	private JTextField smID;
	private JTextField msgText;
	private JButton button;
	private JLabel timelable1;
	private JLabel timelable0;

	@Override
	public void actionPerformed(ActionEvent e) {
		// 启动服务器
		if (e.getSource() == jbt_start) {
			jbt_start.setEnabled(false);
			jbt_stop.setEnabled(true);
			
		}
		// 停止服务器
		if (e.getSource() == jbt_stop) {
			// 停止服务器确认对话框
			int flag = JOptionPane.showConfirmDialog(this, "是否要停止服务器？", "",
					JOptionPane.OK_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE);
			if (flag == JOptionPane.OK_OPTION) {
				jbt_start.setEnabled(true);
				jbt_stop.setEnabled(false);
				System.exit(0);
			}
		}
		// 退出服务器
		if (e.getSource() == jbt_exit) {
			if (jbt_stop.isEnabled()) {
				jbt_stop.doClick();
			}
		}
	}

	// 在线用户名，ID的显示
	public void setOnlineUsers(String userNames) {
		if (userNames.equals("@userlist")) {
			jlt_onlineUsers.removeAll();
			String[] user_null = new String[] {};
		//	jlt_onlineUsers.setListData(user_null);
		} else {
			if (userNames.contains("@userlist")) {
				String[] online = userNames.split("@userlist");
				String[] OnlineUsers = new String[online.length / 2];
				int j = 0;
				for (int i = 0; i < online.length; i++) {
					OnlineUsers[j++] = online[i++];
				}
				jlt_onlineUsers.removeAll();
			//	jlt_onlineUsers.setListData(OnlineUsers);
			}
			
			if (userNames.contains("#exit")) {
				String[] dis = {};
			//	jlt_onlineUsers.setListData(dis);
			}
		}
	}

	//聊天消息的显示
	public void setChatMess(String message) {
		if (message.contains("@chat")) {
			int local = message.indexOf("@chat");
			chatMess.append(message.substring(0, local) + "\n");
			chatMess.setCaretPosition(chatMess.getText().length());
		}
		if (message.contains("@exit")) {
			chatMess.setText("");
		}
	}

	public void setStartAndStopUnable() {
		JOptionPane.showMessageDialog(this, "不能同时开启两个服务器");
		jbt_start.setEnabled(false);
		jbt_stop.setEnabled(false);
	}

	public JTextArea getCommandMsg() {
		return commandMsg;
	}

	public void setCommandMsg(JTextArea commandMsg) {
		this.commandMsg = commandMsg;
	}

	public JList getJlt_onlineUsers() {
		return jlt_onlineUsers;
	}

	public void setJlt_onlineUsers(JList jlt_onlineUsers) {
		this.jlt_onlineUsers = jlt_onlineUsers;
	}

	public JTextArea getChatMess() {
		return chatMess;
	}

	public void setChatMess(JTextArea chatMess) {
		this.chatMess = chatMess;
	}

	public JButton getSendButton() {
		return sendButton;
	}

	public JTextArea getSmName() {
		return smName;
	}

	public JComboBox getSmComboBox() {
		return smComboBox;
	}

	public JTextField getSmID() {
		return smID;
	}

	public JTextField getMsgText() {
		return msgText;
	}
	
	
	
}

