package zhanlang.view;

import java.awt.EventQueue;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.border.EmptyBorder;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import zhanlang.DAO.UserDAO;
import zhanlang.DAO.Imple.UserDAOImple;
import zhanlang.entity.Book;
import javax.swing.JButton;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.ImageIcon;

public class U_ShowAlready extends JFrame {
	UserDAO userImple = new UserDAOImple();
	List<Book> bookList = null;

	private JPanel contentPane;
	private JTextField inputId;
	private JTextField textField;
	private JLabel label;

	/**
	 * Create the frame.
	 */
	public U_ShowAlready() {
		setTitle("已借书籍");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 655, 400);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		//创建框框
		JTextArea canBook = new JTextArea();
		canBook.setColumns(7);
		canBook.setEditable(false);
		canBook.setFont(new Font("楷体", Font.BOLD, 14));
		canBook.setBounds(10, 82, 619, 241);
		JScrollPane scr=new JScrollPane(canBook,
                JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		scr.setBounds(10, 82, 619, 241);
		contentPane.add(scr);
		
		inputId = new JTextField();
		inputId.setFont(new Font("楷体", Font.BOLD, 13));
		inputId.setBounds(136, 18, 218, 21);
		contentPane.add(inputId);
		inputId.setColumns(10);
		
		JButton btnNewButton = new JButton("");
		btnNewButton.setIcon(new ImageIcon(U_ShowAlready.class.getResource("/picture/text/还书按钮.jpg")));
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				boolean flage = userImple.returnById("returnById",new Book(inputId.getText(),new LoginMenu().userlogin.getUserName()));
				if(flage){
					JOptionPane.showMessageDialog(null, "还书成功");
				}else{
					JOptionPane.showMessageDialog(null, "还书失败");
				}
				Client.showCanAllFrame.dispose();
			}
		});

		btnNewButton.setBounds(384, 17, 93, 23);
		contentPane.add(btnNewButton);
		
		textField = new JTextField();
		textField.setEditable(false);
		textField.setText("    编号\t\t书名\t作者\t出版社\t借书时间\r\n");
		textField.setFont(new Font("楷体", Font.BOLD, 14));
		textField.setColumns(10);
		textField.setBounds(10, 49, 619, 21);
		contentPane.add(textField);
		//添加
		
		UserDAO userImple = new UserDAOImple();
		bookList = userImple.showAlready("showAlready", new LoginMenu().userlogin);
		StringBuffer sbf=new StringBuffer();
		textField.setText("    编号\t\t书名\t作者\t出版社\t\t借书时间\r\n");
		if(bookList != null){
			System.out.println(sbf.length());
			sbf.replace(0, sbf.length(), "");
			System.out.println(sbf.length());
			for (Book book : bookList) {
				sbf.append("    "+book.getID()+"\t"+book.getbName()+"\t"+book.getAuthor() +"\t"
						+book.getPress()+"\t"+book.getOutTime()+ "\r\n");
				sbf.append("---------------------------------------------------------------------------------------------------\r\n");
			}
		}
		canBook.setText(sbf.toString());
		
		label = new JLabel("");
		label.setIcon(new ImageIcon(U_ShowAlready.class.getResource("/picture/text/借书页面背景.jpg")));
		label.setBounds(0, 0, 639, 362);
		contentPane.add(label);
	}
}
