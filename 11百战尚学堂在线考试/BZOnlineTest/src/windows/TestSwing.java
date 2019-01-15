package windows;

import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JPanel;

import entity.Question;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingConstants;

public class TestSwing extends JFrame implements ActionListener,MouseListener{

	private static final ActionEvent e1 = null;
	private JRadioButton answerA;// 答案A单选按钮
	private JRadioButton answerB;// 答案B单选按钮
	private JRadioButton answerC;// 答案C单选按钮
	private JRadioButton answerD;// 答案D单选按钮
	private JButton next;// 下一题按钮
	private Socket socket; // 创建socket对象
	private ButtonGroup bGroup;
	// 选项框
	private JLabel textA;
	private JLabel textB;
	private JLabel textC;
	private JLabel textD;
	private JTextArea topic;// 问题文本
	private String sub = null;// 科目
	private String answer = ""; //答案
	
	//数据传输的流
	private PrintWriter pw = null;
	private ObjectInputStream ois = null;
	//题库
	private List<Question> list = null;

	private int num = 0;// 题目的数量
	private int num1 = 0;// 答对题的数量

	/**
	 * 答题页面
	 * 
	 * @param s
	 *            传递的Socket对象
	 * 
	 * @param sub
	 *            需要查询的科目
	 * 
	 */
	public TestSwing(Socket s, String sub) {
		setBackground(Color.WHITE);
		// 初始化
		this.socket = s;
		this.sub = sub;
		// =============界面的设计=======================
		setTitle("BZ答题");
		setSize(450, 420);   
        setLocation(200, 50); 
        setResizable(false);
        setIconImage(new ImageIcon("image/tubiao.png").getImage());
        String path = "image\\testSwing.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0, this.getWidth(), this.getHeight());  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);
		// 显示题目
		topic = new JTextArea();
		topic.setBackground(Color.LIGHT_GRAY);
		topic.setForeground(Color.BLACK);
		topic.setFont(new Font("宋体", Font.PLAIN, 16));
		topic.setEnabled(false);
		topic.setEditable(false);
		topic.setBounds(0, 0, 290, 110);
		topic.setLineWrap(true);
		topic.setWrapStyleWord(true);
		topic.setOpaque(false);
		
		// 添加面板
		JScrollPane panel = new JScrollPane(topic);
		panel.setBackground(Color.LIGHT_GRAY);
		panel.setBounds(80, 65, 290, 110);
		panel.setOpaque(false);
		getContentPane().add(panel);
		panel.add(topic);
		panel.setLayout(null);

		JPanel panel_1 = new JPanel();
		panel_1.setBounds(80, 190, 290, 150);
		panel_1.setOpaque(false);
		getContentPane().add(panel_1);
		panel_1.setLayout(null);
		
		answerA = new JRadioButton("A");
		answerA.setHorizontalAlignment(SwingConstants.CENTER);
		answerA.setFont(new Font("宋体", Font.PLAIN, 16));
		answerA.setBounds(6, 9, 53, 23);
		answerA.setContentAreaFilled(false);
		answerA.setFocusPainted(false);
		panel_1.add(answerA);

		answerB = new JRadioButton("B");
		answerB.setHorizontalAlignment(SwingConstants.CENTER);
		answerB.setFont(new Font("宋体", Font.PLAIN, 16));
		answerB.setBounds(6, 36, 53, 23);
		answerB.setContentAreaFilled(false);
		answerB.setFocusPainted(false);
		panel_1.add(answerB);

		answerC = new JRadioButton("C");
		answerC.setHorizontalAlignment(SwingConstants.CENTER);
		answerC.setFont(new Font("宋体", Font.PLAIN, 16));
		answerC.setBounds(6, 60, 53, 23);
		answerC.setContentAreaFilled(false);
		answerC.setFocusPainted(false);
		panel_1.add(answerC);

		answerD = new JRadioButton("D");
		answerD.setHorizontalAlignment(SwingConstants.CENTER);
		answerD.setFont(new Font("宋体", Font.PLAIN, 16));
		answerD.setBounds(6, 84, 53, 23);
		answerD.setContentAreaFilled(false);
		answerD.setFocusPainted(false);
		panel_1.add(answerD);

		bGroup = new ButtonGroup();
		bGroup.add(answerA);
		bGroup.add(answerB);
		bGroup.add(answerC);
		bGroup.add(answerD);

		next = new JButton("下一题");
		next.setFont(new Font("宋体", Font.PLAIN, 16));
		next.setBounds(46, 112, 192, 23);
		next.setBackground(Color.GRAY);
		next.setFocusPainted(false);
		next.addActionListener(this);
		next.addMouseListener(this);
		panel_1.add(next);

		// ===================选项面板==========================
		textA = new JLabel();
		textA.setFont(new Font("宋体", Font.PLAIN, 16));
		textA.setForeground(Color.BLACK);
		textA.setBounds(65, 8, 173, 21);
		panel_1.add(textA);

		textB = new JLabel();
		textB.setFont(new Font("宋体", Font.PLAIN, 16));
		textB.setForeground(Color.BLACK);
		textB.setBounds(65, 35, 173, 21);
		panel_1.add(textB);

		textC = new JLabel();
		textC.setFont(new Font("宋体", Font.PLAIN, 16));
		textC.setForeground(Color.BLACK);
		textC.setBounds(65, 60, 173, 21);
		panel_1.add(textC);

		textD = new JLabel();
		textD.setFont(new Font("宋体", Font.PLAIN, 16));
		textD.setForeground(Color.BLACK);
		textD.setBounds(65, 84, 173, 21);
		panel_1.add(textD);
		setResizable(false);
		
		//放到界面的最后
        imagePanel.setOpaque(false);  
        this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
        setVisible(true);  
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// ==============和服务器之间数据的交互==================

		try {
			pw = new PrintWriter(socket.getOutputStream());
			pw.println("8");
			pw.flush();
			pw.println(sub + "\r");
			pw.flush();
			// 从服务器接收到题库
			ois = new ObjectInputStream(socket.getInputStream());
		} catch (IOException e) {

			e.printStackTrace();
		}
		try {
			list = (List<Question>) ois.readObject();
			//显示第一道题
			if (num == 0) {
				//显示题的方法
				getTopic(num);
				num++;
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 在文本框中显示的第几题
	 * @param i 
	 */
	public void getTopic(int i) {
		String question = list.get(i).getQuestion();
		String aString = list.get(i).getChoicea();
		String bString = list.get(i).getChoiceb();
		String cString = list.get(i).getChoicec();
		String dString = list.get(i).getChoiced();
		//将答案放在全局变量中
		answer = list.get(i).getAnswer();
		// 给问题及选项框 添加文本
		topic.setText(question);
		textA.setText(aString);
		textB.setText(bString);
		textC.setText(cString);
		textD.setText(dString);
	}
	//判断选项
	private String isTure() {
		String num = "";
		if (answerA.isSelected()) {
			num = "1";
		} else if (answerB.isSelected()) {
			num = "2";
		} else if (answerC.isSelected()) {
			num = "3";
		} else if(answerD.isSelected()) {
			num = "4";
		}
		return num;
	}

	/**
	 * next监听器
	 * 实现答案核对操作及其
	 */
	public void actionPerformed(ActionEvent e) {
		String choose = isTure();
		if (choose.equals(answer)) {
			num1++;
		}
		if (num <list.size()) {
			bGroup.clearSelection();
			getTopic(num);
			num++;
		}else{
			JOptionPane.showMessageDialog(null, "答题完毕,答对" + num1 + "道题");
			StudentSwing ss=new StudentSwing(socket);
			this.setVisible(false);	
			ss.setVisible(true);
		} 
	}
	//添加鼠标监听事件，点击按钮可以让按钮的背景变黑
	@Override
	public void mouseClicked(MouseEvent e) {}
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	public void mouseEntered(MouseEvent e) {
		next.setBackground(Color.BLACK);
	}
	@Override
	public void mouseExited(MouseEvent e) {
		next.setBackground(Color.GRAY);
	}

}
