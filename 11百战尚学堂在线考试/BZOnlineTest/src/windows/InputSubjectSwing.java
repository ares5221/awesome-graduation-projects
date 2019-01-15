package windows;

import javax.swing.JFrame;
import javax.swing.JPanel;

import entity.Question;
import entity.Subject;

import javax.swing.JLabel;

import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JTextPane;

import java.awt.ScrollPane;
import java.awt.Color;

public class InputSubjectSwing extends JFrame implements ActionListener ,MouseListener{

	private JTextField subjectNum;// 输入课程编号
	private JLabel subject;// 科目框
	private JButton addSubject;// 确定添加新科目按钮
	private JButton back;// 返回上一个管理员界面按钮
	private JTextField answerAIn;// 答案A输入框
	private JTextField answerBIn;// 答案B输入框
	private JTextField answerCIn;// 答案C输入框
	private JTextField answerDIn;// 答案D输入框
	private JTextField pass;// 输入正确答案的选项
	private JButton next;// 添加下一题
	private JTextArea inputTest;// 对于题目的添加
	private Socket socket;// 设置socket对象
	private String addsub;//传入的科目
	// 设置map集合，将新增题目放入集合
	private static Map<Question, Subject> map = new HashMap<>();
	private JScrollPane scrollPane;
	
	// ====================增加科目及其题目界面======================
	public InputSubjectSwing(Socket socket,String s) {
		// 建立socket连接
		this.socket = socket;
		this.addsub=s;
		
		setTitle("BZ增加科目");
		setBackground(Color.WHITE);
		setSize(450,490);   
        setLocation(200, 50); 
        setResizable(false);
        setIconImage(new ImageIcon("image/tubiao.png").getImage());
        String path = "image/inputSubject.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0,450,500);  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);

		subjectNum = new JTextField();
		subjectNum.setFont(new Font("宋体", Font.PLAIN, 16));
		subjectNum.setColumns(10);
		subjectNum.setBounds(135, 60, 74, 21);
		getContentPane().add(subjectNum);

		JLabel subNum = new JLabel("课程号");
		subNum.setHorizontalAlignment(SwingConstants.CENTER);
		subNum.setFont(new Font("宋体", Font.PLAIN, 16));
		subNum.setBounds(75, 63, 56, 15);
		getContentPane().add(subNum);

		JLabel subjectLabel = new JLabel("科目");
		subjectLabel.setHorizontalAlignment(SwingConstants.CENTER);
		subjectLabel.setFont(new Font("宋体", Font.PLAIN, 16));
		subjectLabel.setBounds(219, 64, 43, 15);
		getContentPane().add(subjectLabel);

		subject = new JLabel();
		subject.setFont(new Font("宋体", Font.PLAIN, 16));
		subject.setBounds(272, 61, 80, 21);
		getContentPane().add(subject);
		subject.setText(addsub);

		addSubject = new JButton("完成添加");
		addSubject.setForeground(Color.WHITE);
		addSubject.setBackground(Color.DARK_GRAY);
		addSubject.setFont(new Font("宋体", Font.PLAIN, 16));
		addSubject.setBounds(75, 355, 103, 23);
		addSubject.setFocusPainted(false);
		addSubject.addActionListener(this);
		addSubject.addMouseListener(this);
		getContentPane().add(addSubject);

		back = new JButton("返回");
		back.setForeground(Color.WHITE);
		back.setBackground(Color.GRAY);
		back.setFont(new Font("宋体", Font.PLAIN, 16));
		back.setBounds(178, 355, 88, 23);
		back.addActionListener(this);
		back.addMouseListener(this);
		back.setFocusPainted(false);
		getContentPane().add(back);

		JLabel label2 = new JLabel("请添加试题");
		label2.setFont(new Font("宋体", Font.PLAIN, 16));
		label2.setBounds(75, 89, 80, 15);
		getContentPane().add(label2);

		inputTest = new JTextArea();
		inputTest.setFont(new Font("宋体", Font.PLAIN, 16));
		inputTest.setBounds(10, 73, 290, 80);
		inputTest.setLineWrap(true);
		inputTest.setWrapStyleWord(true);

		scrollPane = new JScrollPane(inputTest);
		scrollPane.setBounds(75, 115, 290, 80);
		getContentPane().add(scrollPane);

		JLabel answerA = new JLabel("答案A: ");
		answerA.setFont(new Font("宋体", Font.PLAIN, 16));
		answerA.setBounds(75, 208, 56, 15);
		getContentPane().add(answerA);

		JLabel answerB = new JLabel("答案B: ");
		answerB.setFont(new Font("宋体", Font.PLAIN, 16));
		answerB.setBounds(75, 237, 56, 15);
		getContentPane().add(answerB);

		JLabel answerC = new JLabel("答案C: ");
		answerC.setFont(new Font("宋体", Font.PLAIN, 16));
		answerC.setBounds(75, 266, 56, 15);
		getContentPane().add(answerC);

		JLabel answerD = new JLabel("答案D: ");
		answerD.setFont(new Font("宋体", Font.PLAIN, 16));
		answerD.setBounds(75, 293, 56, 15);
		getContentPane().add(answerD);

		answerAIn = new JTextField();
		answerAIn.setFont(new Font("宋体", Font.PLAIN, 16));
		answerAIn.setBounds(125, 206, 213, 21);
		getContentPane().add(answerAIn);
		answerAIn.setColumns(20);

		answerBIn = new JTextField();
		answerBIn.setFont(new Font("宋体", Font.PLAIN, 16));
		answerBIn.setBounds(125, 233, 213, 21);
		getContentPane().add(answerBIn);
		answerBIn.setColumns(20);

		answerCIn = new JTextField();
		answerCIn.setFont(new Font("宋体", Font.PLAIN, 16));
		answerCIn.setBounds(125, 262, 213, 21);
		getContentPane().add(answerCIn);
		answerCIn.setColumns(20);

		answerDIn = new JTextField();
		answerDIn.setFont(new Font("宋体", Font.PLAIN, 16));
		answerDIn.setBounds(125, 291, 213, 21);
		getContentPane().add(answerDIn);
		answerDIn.setColumns(20);

		JLabel label_1 = new JLabel("正确答案：");
		label_1.setFont(new Font("宋体", Font.PLAIN, 16));
		label_1.setBounds(75, 322, 80, 15);
		getContentPane().add(label_1);

		pass = new JTextField();
		pass.setFont(new Font("宋体", Font.PLAIN, 16));
		pass.setBounds(149, 320, 189, 21);
		getContentPane().add(pass);
		pass.setColumns(10);

		next = new JButton("添加下题");
		next.setForeground(Color.WHITE);
		next.setBackground(Color.DARK_GRAY);
		next.setFont(new Font("宋体", Font.PLAIN, 16));
		next.setBounds(266, 355, 103, 23);
		next.setFocusPainted(false);
		next.addActionListener(this);
		next.addMouseListener(this);
		getContentPane().add(next);
		
		 imagePanel.setOpaque(false);  
	     this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
	     setVisible(true);  
	     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	/*
	 * 点击addSubject完成对于新科目的添加 点击back返回上一个管理员页面 点击next继续添加下一题
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		// 完成对新科目的添加并返回成功的信息
		if (e.getSource() == addSubject) {
			// 最后一次得到题目信息，并放入集合
			getQuestion();
			// 提示界面
			JOptionPane.showMessageDialog(null, "成功添加科目及试题", "成功添加", JOptionPane.INFORMATION_MESSAGE);
			// 通知服务器接收信息
			try {
				PrintWriter pw = new PrintWriter(socket.getOutputStream());
				pw.println("2");
				pw.flush();
			} catch (IOException e2) {
				e2.printStackTrace();
			}
			// 将map集合传回服务器,利用对象流传输map
			ObjectOutputStream oos = null;
			try {
				oos = new ObjectOutputStream(socket.getOutputStream());
				oos.writeObject(map);
				oos.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			// 传输后返回管理员页面
			TeacherSwing tSwing = new TeacherSwing(socket);
			tSwing.setVisible(true);
			this.setVisible(false);
		}
		// 返回管理员页面
		if (e.getSource() == back) {
			TeacherSwing tSwing = new TeacherSwing(socket);
			tSwing.setVisible(true);
			this.setVisible(false);
		}
		// 完成对当前题目的保存，并把当前页面清空。以便进行下一题的录入
		if (e.getSource() == next) {
			// 得到题目信息，并放入集合
			getQuestion();
			// 将页面清空
			
			answerAIn.setText("");
			answerBIn.setText("");
			answerCIn.setText("");
			answerDIn.setText("");
			pass.setText("");
			inputTest.setText("");
		}
	}

	//获取题目信息并放入集合中
	public void getQuestion() {
		// 得到课程号
		String num = subjectNum.getText();
		// 得到题目
		String topic = inputTest.getText();
		// 得到四个选项
		String ansA = answerAIn.getText();
		String ansB = answerBIn.getText();
		String ansC = answerCIn.getText();
		String ansD = answerDIn.getText();
		String answer = pass.getText();
		// 将科目及其题目放入map集合中
		map.put(new Question(topic, ansA, ansB, ansC, ansD, answer),new Subject(num,addsub));
	}
	//添加鼠标监听事件，当鼠标移到按钮上。按钮背景变为黑色，离开按钮颜色恢复  
	@Override
	public void mouseClicked(MouseEvent e) {}
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	public void mouseEntered(MouseEvent e) {
		if (e.getSource() == addSubject) {
			addSubject.setBackground(Color.BLACK);
		}
		else if (e.getSource() == back) {
			back.setBackground(Color.BLACK);
		}
		else if (e.getSource() == next) {
			next.setBackground(Color.BLACK);
		}
	}

	@Override
	public void mouseExited(MouseEvent e) {
		if (e.getSource() == addSubject) {
			addSubject.setBackground(Color.DARK_GRAY);
		}
		else if (e.getSource() == back) {
			back.setBackground(Color.GRAY);
		}
		else if (e.getSource() == next) {
			next.setBackground(Color.DARK_GRAY);
		}
	}
}
