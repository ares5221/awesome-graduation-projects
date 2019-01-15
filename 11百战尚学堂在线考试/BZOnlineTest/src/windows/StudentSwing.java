package windows;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import java.awt.Color;
import java.awt.Font;

import javax.swing.JButton;

import java.awt.ScrollPane;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JTable;
import javax.swing.JTextField;

import windowOperation.StudentWinOpe;

public class StudentSwing extends JFrame implements ActionListener , MouseListener{
	private JButton unPassButton;//未考科目按钮
	private JButton passButton;//已考科目按钮
	private JTextField inputSubject;//输入考试科目
	private JButton startButton;//开始考试
	private Socket socket;
	private JTable subject;
	private String[][] cellData = {{"ID","科目"},{"",""}};
	private String[] columnNames = {"ID","科目"};
	private DefaultTableModel tModel = new DefaultTableModel(cellData, columnNames);
	/**
	 * 设计窗口
	 */
	
	PrintWriter pWriter;
	public StudentSwing(Socket socket) {
		this.socket = socket;
		setBackground(Color.WHITE);

		//放到界面的开始
		setTitle("BZ学生");
		setSize(520, 540);   
        setLocation(200, 50); 
        setResizable(false);
        setIconImage(new ImageIcon("image/tubiao.png").getImage());
        String path = "image/studebtSwing.png";  
        ImageIcon background = new ImageIcon(path);  
        JLabel label = new JLabel(background);  
        label.setBounds(0, 0, 500, 500);  
        JPanel imagePanel = (JPanel) this.getContentPane();
        getContentPane().setLayout(null);		
		
		unPassButton = new JButton("未考科目");
		unPassButton.setForeground(Color.WHITE);
		unPassButton.setBackground(Color.DARK_GRAY);
		unPassButton.setFont(new Font("宋体", Font.PLAIN, 16));
		unPassButton.setBounds(75, 60, 175, 35);
		unPassButton.setFocusPainted(false);
		unPassButton.addActionListener(this);
		unPassButton.addMouseListener(this);
		getContentPane().add(unPassButton);
		
		passButton = new JButton("已考科目");
		passButton.setForeground(Color.WHITE);
		passButton.setBackground(Color.GRAY);
		passButton.setFont(new Font("宋体", Font.PLAIN, 16));
		passButton.setBounds(250, 60, 175, 35);
		passButton.setFocusPainted(false);
		passButton.addActionListener(this);
		passButton.addMouseListener(this);
		getContentPane().add(passButton);
		
		ScrollPane scrollPane = new ScrollPane();
		scrollPane.setBounds(75, 110, 350, 250);
		getContentPane().add(scrollPane);		 
		subject = new JTable(tModel);
		subject.setGridColor(Color.BLUE);
		subject.setRowHeight(20);
		subject.getColumnModel().getColumn(0).setPreferredWidth(37);
		subject.getColumnModel().getColumn(1).setPreferredWidth(115);
		
		scrollPane.add(subject);
		
		inputSubject = new JTextField();
		inputSubject.setForeground(Color.LIGHT_GRAY);
		inputSubject.setBackground(Color.DARK_GRAY);
		inputSubject.setFont(new Font("宋体", Font.PLAIN, 16));
		inputSubject.setBounds(164, 375, 86, 25);
		getContentPane().add(inputSubject);
		inputSubject.setColumns(10);
		
		startButton = new JButton("开始考试");
		startButton.setBackground(Color.GRAY);
		startButton.setForeground(Color.WHITE);
		startButton.setFont(new Font("宋体", Font.PLAIN, 16));
		startButton.setBounds(250, 375, 175, 25);
		startButton.addActionListener(this);
		startButton.addMouseListener(this);
		getContentPane().add(startButton);
		
		JLabel lblid = new JLabel("请输入科目ID");
		lblid.setFont(new Font("宋体", Font.PLAIN, 16));
		lblid.setBounds(65, 381, 96, 15);
		getContentPane().add(lblid);
		
		imagePanel.setOpaque(false);  
        this.getLayeredPane().add(label, new Integer(Integer.MIN_VALUE));  
        setVisible(true);  
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	/*
	 * unPassButton按钮刷新表格中未通过的科目。
	 * passButton按钮就表格中的内容刷新为通过科目
	 * startButton按钮跳转到考试页面并隐藏当前页面
	 */
	@Override
	public void actionPerformed(ActionEvent e) {
		StudentWinOpe sOpe = new StudentWinOpe();
		if (e.getSource() == unPassButton) {
			try {
				pWriter = new PrintWriter(socket.getOutputStream());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			pWriter.println("6");
			pWriter.flush();
			//更改数组
			cellData = sOpe.notSelect(socket);
			//刷新表格
			tModel.setDataVector(cellData, columnNames);
			subject.repaint();
		}
		if (e.getSource() == passButton) {
			try {
				pWriter = new PrintWriter(socket.getOutputStream());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pWriter.println("6");
			pWriter.flush();
			//更改数组
			cellData = sOpe.yetSelect(socket);
			//刷新表格
			tModel.setDataVector(cellData, columnNames);
			subject.repaint();
		}
		if (e.getSource() == startButton) {
			if("".equals(inputSubject.getText())){
				//科目为空弹出警告
				JOptionPane.showMessageDialog(null,"您的科目为空，不能执行操作");
				return;
			}
			//进入考试页面
			String temp = sOpe.inputId(cellData, inputSubject.getText());
			TestSwing tSwing = new TestSwing(socket, temp);
//			TeacherSwing tSwing = new TeacherSwing();
			tSwing.setVisible(true);
			System.out.println(temp);
			this.setVisible(false);				
			
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
	//鼠标无论点击哪一个按钮，都变为黑色背景
	public void mouseEntered(MouseEvent e) {
		if (e.getSource() == unPassButton) {
			unPassButton.setBackground(Color.BLACK);
		}
		else if (e.getSource() == passButton) {
			passButton.setBackground(Color.BLACK);
		}
		else if (e.getSource() == startButton) {
			startButton.setBackground(Color.BLACK);
		}
	}
	@Override
	public void mouseExited(MouseEvent e) {
		if (e.getSource() == unPassButton) {
			unPassButton.setBackground(Color.DARK_GRAY);
		}
		else if (e.getSource() == passButton) {
			passButton.setBackground(Color.GRAY);
		}
		else if (e.getSource() == startButton) {
			startButton.setBackground(Color.DARK_GRAY);
		}
	}
}
