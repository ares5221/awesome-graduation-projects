package windows;


import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;

import windowOperation.ModifyUserWinOpe;

import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

public class ModifyUserSwing extends JFrame implements ActionListener,MouseListener{

	private JTextField nameText;//用户名文本框
	private JTextField oldPassText;//旧密码文本框
	private JTextField newPassText;//新密码文本框
	private JTextField reNewPassText;//新密码重复输入文本框
	private JButton yes;//确定修改，并返回管理员界面
	private JButton no;//取消，功能暂定为清空页面
	private JLabel LabelInfo;
	private Socket socket;

	/**
	 * Create the frame.
	 */
	public ModifyUserSwing(Socket socket) {
		this.socket = socket;
		
		setTitle("BZ修改用户");
		setSize(430, 360);   
        setLocation(200, 50); 
        setResizable(false);
        setIconImage(new ImageIcon("image/tubiao.png").getImage());
        String path = "image/modifyUser.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0, this.getWidth(), this.getHeight());  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);
		
		JLabel Label1 = new JLabel("账 号：");
		Label1.setFont(new Font("宋体", Font.PLAIN, 16));
		Label1.setHorizontalAlignment(SwingConstants.RIGHT);
		Label1.setBounds(108, 70, 59, 23);
		getContentPane().add(Label1);
		
		JLabel label2 = new JLabel("原密码：");
		label2.setFont(new Font("宋体", Font.PLAIN, 16));
		label2.setHorizontalAlignment(SwingConstants.RIGHT);
		label2.setBounds(97, 117, 70, 23);
		getContentPane().add(label2);
		
		JLabel label_1 = new JLabel("新密码：");
		label_1.setFont(new Font("宋体", Font.PLAIN, 16));
		label_1.setHorizontalAlignment(SwingConstants.RIGHT);
		label_1.setBounds(97, 164, 70, 23);
		getContentPane().add(label_1);
		
		JLabel label_2 = new JLabel("重复密码：");
		label_2.setFont(new Font("宋体", Font.PLAIN, 16));
		label_2.setHorizontalAlignment(SwingConstants.RIGHT);
		label_2.setBounds(74, 212, 93, 23);
		getContentPane().add(label_2);
		
		nameText = new JTextField();
		nameText.setBounds(177, 71, 157, 21);
		getContentPane().add(nameText);
		nameText.setColumns(10);
		
		oldPassText = new JTextField();
		oldPassText.setColumns(10);
		oldPassText.setBounds(177, 118, 157, 21);
		getContentPane().add(oldPassText);
		
		newPassText = new JTextField();
		newPassText.setColumns(10);
		newPassText.setBounds(177, 165, 157, 21);
		getContentPane().add(newPassText);
		
		reNewPassText = new JTextField();
		reNewPassText.setColumns(10);
		reNewPassText.setBounds(177, 213, 157, 21);
		getContentPane().add(reNewPassText);
		
		yes = new JButton("确 定");
		yes.setForeground(Color.WHITE);
		yes.setBackground(Color.DARK_GRAY);
		yes.setFont(new Font("宋体", Font.PLAIN, 16));
		yes.setBounds(110, 260, 110, 25);
		yes.addActionListener(this);
		yes.addMouseListener(this);
		yes.setFocusPainted(false);
		getContentPane().add(yes);
		
		no = new JButton("取 消");
		no.setForeground(Color.WHITE);
		no.setBackground(Color.GRAY);
		no.setFont(new Font("宋体", Font.PLAIN, 16));
		no.setBounds(220, 260, 110, 25);
		no.addActionListener(this);
		no.addMouseListener(this);
		no.setFocusPainted(false);
		getContentPane().add(no);
		
		LabelInfo = new JLabel("");
		LabelInfo.setBounds(344, 74, 70, 15);
		getContentPane().add(LabelInfo);
		
		imagePanel.setOpaque(false);  
        this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
        setVisible(true);  
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	/*
	 * yes按钮完成对数据的提交，以及回到管理员页面
	 * no按钮完成对当前的内容的修改（功能暂定）
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		PrintWriter pw;
		try {//向服务器传送页面信息
		pw = new PrintWriter(socket.getOutputStream());
		pw.print("5"+"\r");
		pw.flush();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ModifyUserWinOpe w=new ModifyUserWinOpe();
		if (e.getSource() == yes) {//向服务器发送修改信息，并返回是否修改成功
			boolean flag = w.modifyUser(nameText.getText(), oldPassText.getText(), newPassText.getText(), reNewPassText.getText(),socket);
			if (flag) {
				new TeacherSwing(socket).setVisible(true);
				this.setVisible(false);
			}
			if (!flag) {
				JOptionPane.showMessageDialog(null, "修改用户失败");
			}	
		}
		if (e.getSource() == no) {
			nameText.setText("");
			oldPassText.setText("");
			newPassText.setText("");
			reNewPassText.setText("");
		}
	}
	//增加鼠标点击事件。点击按钮背景变为黑色。
	@Override
	public void mouseClicked(MouseEvent e) {}
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	public void mouseEntered(MouseEvent e) {
		if (e.getSource() == yes) {
			yes.setBackground(Color.BLACK);
		}
		else if (e.getSource() == no) {
			no.setBackground(Color.BLACK);
		}
	}

	@Override
	public void mouseExited(MouseEvent e) {
		if (e.getSource() == yes) {
			yes.setBackground(Color.DARK_GRAY);
		}
		else if (e.getSource() == no) {
			no.setBackground(Color.GRAY);
		}
	}
}
