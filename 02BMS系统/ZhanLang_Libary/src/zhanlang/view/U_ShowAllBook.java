package zhanlang.view;

import java.awt.EventQueue;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextPane;
import javax.swing.border.EmptyBorder;

import zhanlang.DAO.UserDAO;
import zhanlang.DAO.Imple.UserDAOImple;
import zhanlang.entity.Book;
import javax.swing.JTextArea;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.ImageIcon;


public class U_ShowAllBook extends JFrame {
	static List<Book> bookList = null;

	private JPanel contentPane;
	private JTextField textField;
	JTextArea textArea;
	StringBuffer sbf;
	private JTextField textName;
	private JLabel label_1;

	/**
	 * Create the frame.
	 */
	public U_ShowAllBook() {
		setTitle("可借书籍");
		getContentPane().setLayout(null);
		
		JTextArea allbook = new JTextArea();
		allbook.setBounds(75, 60, 600, 400);
		getContentPane().add(allbook);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 702, 407);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		textArea = new JTextArea();
		textArea.setEditable(false);
		textArea.setFont(new Font("微软雅黑", Font.PLAIN, 14));
		textArea.setBounds(27, 90, 630, 258);
		JScrollPane scr=new JScrollPane(textArea,
                JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		scr.setBounds(27, 90, 630, 258);
		contentPane.add(scr);
		
		textField = new JTextField();
		textField.setColumns(10);
		textField.setBounds(281, 29, 137, 21);
		contentPane.add(textField);
		
		JButton button_1 = new JButton("");
		button_1.setIcon(new ImageIcon(U_ShowAllBook.class.getResource("/picture/text/借书按钮.jpg")));
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				UserDAOImple userImple = new UserDAOImple();
				Boolean flage = userImple.borrowById("borrowById", new Book(textField.getText()));
				if(flage){
					
					//借书成功
					if(bookList != null){
						System.out.println(sbf.length());
						sbf.replace(0, sbf.length(), "");
						System.out.println(sbf.length());
						int count =1;
						for (Book book : bookList) {
							count++;
							System.out.println(count);
							sbf.append("    "+book.getID()+"\t"+book.getbName()+"\t"+book.getAuthor() +"\t"
						+book.getPress()+"\t"+book.getInTime()+ "\r\n");
							sbf.append("---------------------------------------------------------------------------------------------------\r\n");
						}
					}
					textArea.setText(sbf.toString());
					System.out.println("借书成功");
					JOptionPane.showMessageDialog(null, "借书成功");
					
				}else{
					//借书失败
					System.out.println("借书失败");
					JOptionPane.showMessageDialog(null, "借书失败");
				}
				Client.showAllBookFrame.dispose();
			}
		});
		button_1.setBounds(445, 27, 57, 23);
		contentPane.add(button_1);
	

	
		
		textName = new JTextField();
		textName.setEditable(false);
		textName.setFont(new Font("楷体", Font.BOLD, 14));
		textName.setBounds(27, 61, 630, 21);
		contentPane.add(textName);
		textName.setColumns(10);
		
		UserDAO userImple = new UserDAOImple();
		bookList = userImple.showCanAll("showCanAll", new Book());
		sbf=new StringBuffer();
		textName.setText("  编号\t     书名\t 作者\t \t类型\t    出版社\t 入库时间 \r\n");
		if(bookList != null){
			System.out.println(sbf.length());
			sbf.replace(0, sbf.length(), "");
			System.out.println(sbf.length());
			for (Book book : bookList) {
				sbf.append("    "+book.getID()+"\t"+book.getbName()+"\t"+book.getAuthor()+"\t"+book.getType() +"\t"
			+book.getPress()+"\t"+book.getInTime()+ "\r\n");
				sbf.append("---------------------------------------------------------------------------------------------------\r\n");
			}
		}
		textArea.setText(sbf.toString());
		
		JLabel label = new JLabel("请输入图书编号：");
		label.setFont(new Font("楷体", Font.BOLD, 15));
		label.setBounds(136, 32, 145, 15);
		contentPane.add(label);
		
		label_1 = new JLabel("");
		label_1.setIcon(new ImageIcon(U_ShowAllBook.class.getResource("/picture/text/借书页面背景--1.jpg")));
		label_1.setBounds(0, 0, 686, 369);
		contentPane.add(label_1);
	}
}
