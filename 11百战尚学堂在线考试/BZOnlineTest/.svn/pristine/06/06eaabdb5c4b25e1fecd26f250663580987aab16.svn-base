package windows;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;


import javax.swing.JLabel;

import java.awt.Font;

import javax.swing.JTextField;
import javax.swing.JTextArea;

import java.awt.ScrollPane;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JRadioButton;
import javax.swing.JButton;

import windowOperation.ModifySubWinOpe;

import javax.swing.JScrollPane;
import java.awt.Color;

public class ModifyTopicSwing extends JFrame implements ActionListener,MouseListener{

	private JTextField answerA;//答案A内容输入框
	private JTextField answerB;//答案B内容输入框
	private JTextField answerC;//答案C内容输入框
	private JTextField answerD;//答案D内容输入框
	private ButtonGroup bGroup;
	private JButton submit;//当我们做完以后，点击确定完成对题库的更新
	private JButton reset;//清空当前页面，进行下一题的修改
	private JTextField id;//输入题目Id以用来查找题目
	private JTextArea testInput;//题目输入框
	private Socket socket;
	private String subject;
	private JRadioButton A;
	private JRadioButton B;
	private JRadioButton C;
	private JRadioButton D;
	/**
	 * Create the frame.
	 */
	public ModifyTopicSwing(Socket socket,String subject) {
		setBackground(Color.WHITE);
		this.socket = socket;
		this.subject = subject;
		
		setTitle("BZ修改科目");
		setSize(400,440);   
        setLocation(200, 50); 
        setResizable(false);
        setIconImage(new ImageIcon("image/tubiao.png").getImage());
        String path = "image/modifySubject.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0, this.getWidth(), this.getHeight());  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("\u9898\u76EE:");
		lblNewLabel.setFont(new Font("宋体", Font.PLAIN, 16));
		lblNewLabel.setBounds(87, 93, 52, 29);
		getContentPane().add(lblNewLabel);
		
		A = new JRadioButton("A");
		A.setFont(new Font("宋体", Font.PLAIN, 16));
		A.setBounds(99, 178, 40, 23);
		A.setFocusPainted(false);
		A.setOpaque(false);
		getContentPane().add(A);
		
		answerA = new JTextField();
		answerA.setBounds(140, 179, 164, 23);
		getContentPane().add(answerA);
		answerA.setColumns(10);
		
		answerB = new JTextField();
		answerB.setColumns(10);
		answerB.setBounds(140, 212, 164, 23);
		getContentPane().add(answerB);
		
		B = new JRadioButton("B");
		B.setFont(new Font("宋体", Font.PLAIN, 16));
		B.setBounds(99, 211, 40, 23);
		B.setFocusPainted(false);
		B.setOpaque(false);
		getContentPane().add(B);
		
		answerC = new JTextField();
		answerC.setColumns(10);
		answerC.setBounds(140, 245, 164, 23);
		getContentPane().add(answerC);
		
		C = new JRadioButton("C");
		C.setFont(new Font("宋体", Font.PLAIN, 16));
		C.setBounds(99, 244, 40, 23);
		C.setFocusPainted(false);
		C.setOpaque(false);
		getContentPane().add(C);
		
		answerD = new JTextField();
		answerD.setColumns(10);
		answerD.setBounds(140, 281, 164, 23);
		getContentPane().add(answerD);
		
		D = new JRadioButton("D");
		D.setFont(new Font("宋体", Font.PLAIN, 16));
		D.setBounds(99, 280, 40, 23);
		D.setFocusPainted(false);
		D.setOpaque(false);
		getContentPane().add(D);
		
		bGroup = new ButtonGroup();
		bGroup.add(A);
		bGroup.add(B);
		bGroup.add(C);
		bGroup.add(D);
		
		submit = new JButton("提交");
		submit.setForeground(Color.WHITE);
		submit.setBackground(Color.DARK_GRAY);
		submit.setFont(new Font("宋体", Font.PLAIN, 16));
		submit.setBounds(100, 336, 110, 35);
		submit.setFocusPainted(false);
		submit.addActionListener(this);
		submit.addMouseListener(this);
		getContentPane().add(submit);
		
		reset = new JButton("重置");
		reset.setForeground(Color.WHITE);
		reset.setBackground(Color.GRAY);
		reset.setFont(new Font("宋体", Font.PLAIN, 16));
		reset.setBounds(210, 336, 110, 35);
		reset.setFocusPainted(false);
		reset.addActionListener(this);
		reset.addMouseListener(this);
		getContentPane().add(reset);
		
		testInput = new JTextArea();
		testInput.setBounds(69, 57, 170, 75);
		
		JScrollPane scrollPane = new JScrollPane(testInput);
		scrollPane.setBounds(135, 97, 170, 75);
		getContentPane().add(scrollPane);
		
		JLabel lblId = new JLabel("ID:");
		lblId.setFont(new Font("宋体", Font.PLAIN, 16));
		lblId.setBounds(99, 63, 24, 15);
		getContentPane().add(lblId);
		
		id = new JTextField();
		id.setFont(new Font("宋体", Font.PLAIN, 16));
		id.setBounds(135, 61, 164, 21);
		getContentPane().add(id);
		id.setColumns(10);
		
		imagePanel.setOpaque(false);  
        this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
        setVisible(true);  
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	/*
	 *submit当我们做完以后，点击确定完成对题库的更新
	 *reset;//清空当前页面，进行下一题的修改
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		PrintWriter pw;
		try {
			pw = new PrintWriter(socket.getOutputStream());
		pw.print("4"+"\r");
		pw.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		ModifySubWinOpe mOpe = new ModifySubWinOpe();
		if (e.getSource() == submit) {
			//将修改的题目更新到题库的方法,将所有的数据转换为字符串
			String ID = id.getText();
			String topic = testInput.getText();
			String AI = answerA.getText();
			String BI = answerB.getText();
			String CI = answerC.getText();
			String DI = answerD.getText();
			String trueAnswer;
			if (A.isSelected()) {
				trueAnswer = "1";
			}else if (B.isSelected()) {
				trueAnswer = "2";
			}else if (C.isSelected()) {
				trueAnswer = "3";
			}else if (D.isSelected()) {
				trueAnswer = "4";
			}else {
				trueAnswer =null;
			}
			//判断是否修改成功
			boolean flag = mOpe.modifyTopic(subject,ID, topic, AI, BI, CI, DI, trueAnswer, socket);
			if (flag) {
				JOptionPane.showMessageDialog(null, "以完成对题库的更新","成功更新",JOptionPane.INFORMATION_MESSAGE);
				new TeacherSwing(socket).setVisible(true);
				this.setVisible(false);
			}if (!flag) {
				JOptionPane.showConfirmDialog(null,"没有该题目");
			}
		}
		if (e.getSource() == reset) {
			//完成对当前题目的修改。并清空输入框
			id.setText("");
			answerA.setText("");
			answerB.setText("");
			answerC.setText("");
			answerD.setText("");
			testInput.setText("");
		}
	}
	//添加鼠标事件，点击按钮背景变黑
	@Override
	public void mouseClicked(MouseEvent e) {}
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	public void mouseEntered(MouseEvent e) {
		if (e.getSource() == submit) {
			submit.setBackground(Color.BLACK);
		}
		else if (e.getSource() == reset) {
			reset.setBackground(Color.BLACK);
		}
	}

	@Override
	public void mouseExited(MouseEvent e) {
		if (e.getSource() == submit) {
			submit.setBackground(Color.DARK_GRAY);
		}
		else if (e.getSource() == reset) {
			reset.setBackground(Color.GRAY);
		}
	}
}

