package windows;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import windowOperation.LoadWinOpe;
import windowOperation.TeacherWinOpe;

import javax.swing.JLabel;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JRadioButton;

import java.awt.ScrollPane;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JTable;

public class TeacherSwing extends JFrame implements ActionListener , MouseListener{
	private JLabel subjectOrStudent;// 如果要操作的是科目就就将这个变为科目，如果要操作的是用户就变为用户
	private JTextField inputSubjectOrStudent;// 如果要操作的是科目就输入科目吗，如果操作的是用户就是输入用户名
	private JRadioButton subjectButton;// 选择操作科目单选按钮
	private JRadioButton userButton;// 选择操作用户单选按钮
	private JButton add;// 添加信息，科目或用户
	private JButton delete;// 删除信息，科目或用户
	private JButton modify;// 修改信息，科目或用户
	private JButton findPass;// 查找信息，科目或用户
	private static Socket socket;
	private PrintWriter pw;
	private JTable table;//表格显示
	private String[][] cellData = {{"ID","科目"},{"",""}};;
	private String[] columnNames = {"ID","科目"};
	private DefaultTableModel tModel = new DefaultTableModel(cellData, columnNames);

	/**
	 * 设计页面
	 */
	public TeacherSwing(Socket socket) {
		setBackground(Color.WHITE);
		this.socket = socket;

		//放到界面的开始
		
		setTitle("BZ管理员");
		setSize(470, 520);   
        setLocation(200, 50); 
        setResizable(false);
        setIconImage(new ImageIcon("image/tubiao.png").getImage());
        String path = "image\\teacherSwing.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0, this.getWidth(), this.getHeight());  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);
		

		JPanel panel = new JPanel();
		panel.setBounds(68, 41, 310, 122);
		panel.setOpaque(false);
		getContentPane().add(panel);
		panel.setLayout(null);

		subjectOrStudent = new JLabel();
		subjectOrStudent.setText("科目");
		subjectOrStudent.setFont(new Font("Dialog", Font.PLAIN, 16));
		subjectOrStudent.setBounds(54, 33, 40, 15);
		panel.add(subjectOrStudent);

		inputSubjectOrStudent = new JTextField();
		inputSubjectOrStudent.setBounds(104, 31, 186, 21);
		panel.add(inputSubjectOrStudent);
		inputSubjectOrStudent.setColumns(10);

		subjectButton = new JRadioButton("科目", true);
		subjectButton.setFont(new Font("宋体", Font.PLAIN, 16));
		subjectButton.setBounds(54, 67, 110, 23);
		subjectButton.setFocusPainted(true);
		subjectButton.addActionListener(this);
		subjectButton.setContentAreaFilled(false);
		panel.add(subjectButton);

		userButton = new JRadioButton("用户");
		userButton.setFont(new Font("宋体", Font.PLAIN, 16));
		userButton.setBounds(166, 67, 121, 23);
		userButton.addActionListener(this);
		userButton.setContentAreaFilled(false);
		panel.add(userButton);

		// 设定单选按钮组
		ButtonGroup bGroup = new ButtonGroup();
		bGroup.add(subjectButton);
		bGroup.add(userButton);

		add = new JButton("增加");
		add.setForeground(Color.WHITE);
		add.setBackground(Color.GRAY);
		add.setFont(new Font("宋体", Font.PLAIN, 16));
		add.setBounds(22, 96, 70, 24);
		add.addActionListener(this);
		add.addMouseListener(this);
		panel.add(add);

		delete = new JButton("删除");
		delete.setForeground(Color.WHITE);
		delete.setBackground(Color.DARK_GRAY);
		delete.setFont(new Font("宋体", Font.PLAIN, 16));
		delete.setBounds(90, 96, 70, 24);
		delete.addActionListener(this);
		delete.addMouseListener(this);
		panel.add(delete);

		modify = new JButton("修改");
		modify.setForeground(Color.WHITE);
		modify.setBackground(Color.GRAY);
		modify.setFont(new Font("宋体", Font.PLAIN, 16));
		modify.setBounds(151, 96, 70, 24);
		modify.addActionListener(this);
		modify.addMouseListener(this);
		panel.add(modify);

		findPass = new JButton("查看");
		findPass.setForeground(Color.WHITE);
		findPass.setBackground(Color.DARK_GRAY);
		findPass.setFont(new Font("宋体", Font.PLAIN, 16));
		findPass.setBounds(220, 96, 70, 24);
		findPass.addActionListener(this);
		findPass.addMouseListener(this);
		panel.add(findPass);
		
		ScrollPane scrollPane = new ScrollPane();
		scrollPane.setBounds(90, 181, 282, 206);
		getContentPane().add(scrollPane);
		
		table = new JTable(tModel);
		scrollPane.add(table);
		table.setBounds(130, 247, 282, 178);
		table.setGridColor(Color.BLUE);
		table.setRowHeight(20);
		
		//放到界面的最后
        imagePanel.setOpaque(false);  
        this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
        setVisible(true);  
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	/*
	 * 当我们单选按钮选择的是SubjectButton。那么我们将会对科目进行增，删，查，改
	 * 当我们单选按钮选择的是userButton。那么我们将会对用户进行增，删，查，改
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		TeacherWinOpe tOpe = new TeacherWinOpe();
		if (subjectButton.isSelected()) {
			subjectOrStudent.setText("科目");
			//添加科目的操作
			if (e.getSource() == add) {
				//向服务器发送指令，让服务器知道我们要执行哪个桌面的哪个操作
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.print("7"+"\r");
					pw.flush();
					System.out.println("7");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				//获得科目名
				String studentName = inputSubjectOrStudent.getText();
				if("".equals(studentName)){
					//科目为空弹出警告
					JOptionPane.showMessageDialog(null,"您的科目为空，不能执行操作");
					return;
				}
				//判断科目是否存在
				boolean flag = tOpe.addSubject(inputSubjectOrStudent.getText(), socket);
				//如果科目不存在
				if (flag) {
					InputSubjectSwing isSwing = new InputSubjectSwing(socket,inputSubjectOrStudent.getText());
					isSwing.setVisible(true);
					System.out.println("弹出页面");
					setVisible(false);
				}
				//如果科目存在
				if (!flag) {
					JOptionPane.showMessageDialog(this,"你要要添加的科目已经存在，请重新输入","科目已存在",JOptionPane.WARNING_MESSAGE);
				}
			}
			
			if (e.getSource() == delete) {
				// 执行方法以表示对当前科目条例的删除
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
				} catch (Exception e3) {
					e3.printStackTrace();
				}
				//下面是对当前科目的删除的操作
				//得到要删除的科目
				String studentName = inputSubjectOrStudent.getText();
				if("".equals(studentName)){
					JOptionPane.showMessageDialog(null,"您的科目为空，不能执行操作");
					return;
				}
				boolean flag = tOpe.delSubject(studentName, socket);
				if (flag) {//如果删除成功
					JOptionPane.showConfirmDialog(null,studentName+"已经删除了","科目删除",JOptionPane.INFORMATION_MESSAGE);
				}
				if (!flag) {//如果删除不成功
					JOptionPane.showMessageDialog(this,"你要要删除的科目不存在，请重新输入","科目不存在",JOptionPane.WARNING_MESSAGE);
				}
			}
			
			if (e.getSource() == findPass) {
				// 执行方法以表示对当前科目的展示
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
					cellData = tOpe.lookAllSubject(socket);//把服务器传进来的东西放入表格
					tModel.setDataVector(cellData, columnNames);//重新定义数据模型
					table.repaint();//刷新表格
				} catch (Exception e3) {
					e3.printStackTrace();
				}
			}
			//修改科目
			if (e.getSource() == modify) {
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
				} catch (Exception e3) {
					e3.printStackTrace();
				}
				String studentName = inputSubjectOrStudent.getText();
				if("".equals(studentName)){
					JOptionPane.showMessageDialog(null,"您的科目为空，不能执行操作");
					return;
				}
				boolean flag = tOpe.modifySubject(inputSubjectOrStudent.getText(), socket);
				if (flag) {//如果科目存在，就跳向修改科目的界面
					new ModifyTopicSwing(socket,inputSubjectOrStudent.getText()).setVisible(true);
					setVisible(false);
				}
				if (!flag) {//如果不存在，就弹出错误的界面
					JOptionPane.showMessageDialog(null, "你要修改的科目不存在");
				}
			}
		}
		//下面是对于用户管理的操作。
		if (userButton.isSelected()) {
			subjectOrStudent.setText("账号");
			if (e.getSource() == add) {
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
				} catch (Exception e3) {
					e3.printStackTrace();
				}
				String studentName = inputSubjectOrStudent.getText();
				if("".equals(studentName)){
					JOptionPane.showMessageDialog(null,"您的用户为空，不能执行操作");
					return;
				}
				boolean flag = tOpe.addUser(inputSubjectOrStudent.getText(), socket);
				System.out.println(flag);
				if (flag) {
					new AddUserSwing(socket,inputSubjectOrStudent.getText()).setVisible(true);
					this.setVisible(false);
				}if (!flag) {
					JOptionPane.showMessageDialog(null,"该用户已存在");
				}
			}
			if (e.getSource() == delete) {
				// 执行方法以表示对当前用户条例的删除
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
				} catch (Exception e3) {
					e3.printStackTrace();
				}

				String studentName = inputSubjectOrStudent.getText();
				if("".equals(studentName)){
					JOptionPane.showMessageDialog(null,"您的用户为空，不能执行操作");
					return;
				}
				//对于用户的删除做出处理，
				boolean flag = tOpe.delStudent(inputSubjectOrStudent.getText(), socket);
				if (flag) {
					JOptionPane.showConfirmDialog(null, "删除成功");
				}
				if (!flag) {
					JOptionPane.showConfirmDialog(null, "该用户不存在");
				}
			}
			if (e.getSource() == findPass) {
				// 执行方法以表示对当前已存在用户的展示
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
					cellData = tOpe.lookAllUser(socket);//把服务器传进来的东西放入表格
					tModel.setDataVector(cellData, columnNames);//重新定义数据模型
					table.repaint();//刷新表格
				} catch (Exception e3) {
					e3.printStackTrace();
				}
			}
			//对于用户密码的修改
			if (e.getSource() == modify) {
				try {
					pw = new PrintWriter(socket.getOutputStream());
					pw.write("7"+"\r");
					pw.flush();
					System.out.println(7);
				} catch (Exception e3) {
					e3.printStackTrace();
				}

				String studentName = inputSubjectOrStudent.getText();
				if("".equals(studentName)){
					JOptionPane.showMessageDialog(null,"您的用户为空，不能执行操作");
					return;
				}
				//判断用户是否可以修改
				boolean flag = tOpe.modifyStudent(inputSubjectOrStudent.getText(), socket);
				if (flag) {
					new ModifyUserSwing(socket).setVisible(true);
					this.setVisible(false);
				}
				if (!flag) {
					JOptionPane.showConfirmDialog(null,"该用户不存在");
				}
			}
		}
	}
	
	//添加鼠标经过的事件
	@Override
	public void mouseClicked(MouseEvent e) {}
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	//无论单击哪个按钮，该按钮背景色变为黑色
	public void mouseEntered(MouseEvent e) {
		if (e.getSource() == add) {
			add.setBackground(Color.BLACK);
		}
		else if (e.getSource() == delete) {
			delete.setBackground(Color.BLACK);
		}
		else if (e.getSource() == findPass) {
			findPass.setBackground(Color.BLACK);
        }
		else if (e.getSource() == modify) {
			modify.setBackground(Color.BLACK);
        }
	}

	@Override
	public void mouseExited(MouseEvent e) {
		if (e.getSource() == add) {
			add.setBackground(Color.GRAY);
		}
		else if (e.getSource() == delete) {
			delete.setBackground(Color.DARK_GRAY);
		}
		else if (e.getSource() == findPass) {
			findPass.setBackground(Color.DARK_GRAY);
        }
		else if (e.getSource() == modify) {
			modify.setBackground(Color.GRAY);
        }
		}
}
