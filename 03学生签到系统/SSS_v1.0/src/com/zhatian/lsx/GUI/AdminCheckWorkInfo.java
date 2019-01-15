package com.zhatian.lsx.GUI;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import com.zhatian.Tinner.entity.Sign;
import com.zhatian.Tinner.entity.Student;
import com.zhatian.kraken.control.AdminAction;

public class AdminCheckWorkInfo extends JFrame implements ActionListener {

	private JButton select;
	private JButton return1;
	private JTextField idField;
	private JPanel panel;

	private Vector<Vector<String>> rowData;
	private JTable table;
	private JScrollPane scrollPane;

	/***
	 * 
	 * 管理员查看指定同学的所有的工作梗概的功能 管理员通过输入指定同学的ID识别号，进行检索 系统将会以画面的形式将该同学的工作梗概信息显示出来
	 *
	 * 如果该同学的梗概信息为空的话，则显示空界面 唯一失败的原因：管理员输入的同学的ID号不存在
	 */
	public AdminCheckWorkInfo() {

		this.setLayout(null);
		this.setTitle("炸天学生签到系统_查看学生日志信息");
		this.setSize(500, 500);
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// 选择图标文件
		ImageIcon liftIicon = new ImageIcon("resource\\admin_resouces\\ico1.jpg");
		// 将左上角图标换做自定义图标
		this.setIconImage(liftIicon.getImage());
		// 获得矿建的窗体信息
		Container c = this.getContentPane();
		c.setLayout(null);
		c.setBackground(Color.WHITE);

		JLabel idLabel = new JLabel("请输入学生ID：");
		idLabel.setFont(new Font("", Font.BOLD, 18));
		idLabel.setBounds(25, 20, 140, 25);
		c.add(idLabel);
		idField = new JTextField(10);
		idField.setBounds(160, 20, 100, 30);
		c.add(idField);

		select = new JButton("检索");
		select.setFont(new Font("", Font.BOLD, 13));
		select.setBounds(300, 20, 80, 30);
		select.addActionListener(this);
		c.add(select);

		return1 = new JButton("返回");
		return1.setFont(new Font("", Font.BOLD, 13));
		return1.setBounds(400, 20, 80, 30);
		return1.addActionListener(this);
		c.add(return1);

		// 设置盛放表格的容器面板
		JPanel p1 = new JPanel();
		p1.setBounds(0, 70, 500, 470 - 35);
		p1.setBorder(new EmptyBorder(5, 5, 5, 5));
		c.add(p1);
		p1.setBackground(Color.red);
		p1.setLayout(null);

		// 设置表头
		Vector<String> columnNames = new Vector<>();
		columnNames.add("日期");
		columnNames.add("工作梗概");

		// 设置表格体,即每一行的数据
		rowData = new Vector<>();
		// 初始化界面
		initTable();
		// 设置表格
		table = new JTable(rowData, columnNames);
		scrollPane = new JScrollPane(table);
		scrollPane.setBounds(0, 0, 500, 470);
		p1.add(scrollPane);
	
		this.setVisible(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == select) {
			rowData.clear();
			String id = idField.getText();
			int id1 = Integer.parseInt(id);
			Student stu = AdminAction.adminFindStudentById(id1);
			if (stu == null) {
				JOptionPane.showMessageDialog(panel, "系统并无此ID用户！请检查！");
				idField.setText("");
				
				initTable();
				table.repaint();
				
			} else {
				List<Sign> signs = AdminAction.findAllSignByStudentId(stu);
				//传递给服务器一个存在的stu对象之后，那么返回回来的signs可能为空吗？
				//在这里的情况下怎么样才会出现失败呢？
				if (signs == null || signs.isEmpty() || signs.size() == 0) {
					JOptionPane pane = new JOptionPane("该同学未留下工作日志信息！");
					pane.setBounds(500,500,100,100);
					JOptionPane.showMessageDialog(panel, "该同学未留下工作日志信息！");
					idField.setText("");
					
					initTable();
					table.repaint();
			
				} else {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					for (int i = 0; i < signs.size(); i++) {
						Vector<String> cellData = new Vector<>();
						Date signDate = signs.get(i).getSign_Date();

						cellData.add(format.format(signDate));

						cellData.add("" + (signs.get(i).getSign_DateLog()));
						rowData.add(cellData);
					}
					// 表格刷新以显示数据
					 table.repaint();
					//scrollPane.updateUI();
					//this.revalidate();
				}
			}
		} else if (e.getSource() == return1) {
			new AdminLogicOpera();
			this.dispose();
		}
	}
	
	
	private void initTable(){
		for (int i = 0; i < 25; i++) {
			// 这个celldata是每一行中的所有列的信息
			Vector<String> cellData = new Vector<>();
			// 先将表格初始化出来，要不会很难看
			cellData.add("");
			cellData.add("");

			rowData.add(cellData);
		}
	}
	public static void main(String[] args) {
		new AdminCheckWorkInfo();
	}
}
