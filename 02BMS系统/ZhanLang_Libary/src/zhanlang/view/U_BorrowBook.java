package zhanlang.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import zhanlang.DAO.UserDAO;
import zhanlang.DAO.Imple.UserDAOImple;
import zhanlang.entity.Book;

public class U_BorrowBook extends JFrame {
	
	private UserDAO ud = new UserDAOImple();
	public List<Book> bookListByType = null;

	private JPanel contentPane;
	private JLabel b1;
	private JLabel b2;
	private JLabel b3;
	private JLabel b4;
	private JLabel b5;
	private JLabel b6;
	private JLabel b7;
	private JLabel b8;
	static String bookID;
	private JButton renwen;
	private JLabel book6;
	private JLabel book8;
	private JLabel book7;
	static String count;
	/**
	 * Create the frame.
	 */
	public U_BorrowBook() {
		setTitle("浏览页面");
		/***/
		setBackground(new Color(189, 183, 107));
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		/**创建用户页面窗体，大小900*600  */
		setBounds(100, 100,900, 600);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(140, 298, 576, 2);
		contentPane.add(scrollPane);
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(140, 482, 576, 2);
		contentPane.add(scrollPane_1);
		
		b1 = new JLabel("1");
		b1.setFont(new Font("黑体", Font.BOLD, 14));
		b1.setBounds(136, 147, 16, 15);
		contentPane.add(b1);
		
		b2 = new JLabel("2");
		b2.setFont(new Font("黑体", Font.BOLD, 14));
		b2.setBounds(280, 147, 16, 15);
		contentPane.add(b2);
		
		b5 = new JLabel("5");
		b5.setFont(new Font("黑体", Font.BOLD, 14));
		b5.setBounds(136, 332, 16, 15);
		contentPane.add(b5);
		
		b6 = new JLabel("");
		b6.setFont(new Font("黑体", Font.BOLD, 14));
		b6.setBounds(280, 332, 16, 15);
		contentPane.add(b6);
		
		b3 = new JLabel("3");
		b3.setFont(new Font("黑体", Font.BOLD, 14));
		b3.setBounds(434, 147, 16, 15);
		contentPane.add(b3);
		
		b4 = new JLabel("4");
		b4.setFont(new Font("黑体", Font.BOLD, 14));
		b4.setBounds(586, 147, 16, 15);
		contentPane.add(b4);
		
		b7 = new JLabel("");
		b7.setFont(new Font("黑体", Font.BOLD, 14));
		b7.setBounds(434, 332, 16, 15);
		contentPane.add(b7);
		
		b8 = new JLabel("");
		b8.setFont(new Font("黑体", Font.BOLD, 14));
		b8.setBounds(586, 332, 16, 15);
		contentPane.add(b8);
		
		JMenuItem menu1 = new JMenuItem("");
		menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/1.png")));
		menu1.setBounds(150, 147, 95, 120);
		contentPane.add(menu1);
		
		JMenuItem menu2 = new JMenuItem("");
		menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/2.png")));
		menu2.setBounds(295, 147, 95, 120);
		contentPane.add(menu2);
		
		JMenuItem menu3 = new JMenuItem("");
		
		menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/3.png")));
		menu3.setBounds(454, 147, 95, 120);
		contentPane.add(menu3);
		
		JMenuItem menu4 = new JMenuItem("");
		
		menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/4.jpg")));
		menu4.setBounds(603, 147, 95, 120);
		contentPane.add(menu4);
		
		JMenuItem menu5 = new JMenuItem("");

		menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/5.jpg")));
		menu5.setBounds(150, 332, 95, 120);
		contentPane.add(menu5);
		
		JMenuItem menu6 = new JMenuItem("");

		menu6.setIcon(null);
		menu6.setBounds(295, 332, 95, 120);
		contentPane.add(menu6);
		
		JMenuItem menu7 = new JMenuItem("");
		menu7.setIcon(null);
		menu7.setBounds(454, 332, 95, 120);
		contentPane.add(menu7);
		
		JMenuItem menu8 = new JMenuItem("");
	
		menu8.setIcon(null);
		menu8.setBounds(596, 332, 95, 120);
		contentPane.add(menu8);
		
		JButton ertong = new JButton("");
		ertong.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/儿童读物.jpg")));
		ertong.setBackground(SystemColor.menu);
		ertong.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				bookListByType = ud.selectByType("selectByType", new Book("1","张三","儿童文学"));
				b6.setText("");
				b7.setText("");
				b8.setText("");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/1.png")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/2.png")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/3.png")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/4.jpg")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/5.jpg")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				/*System.out.println("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage());
				menu1.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage())));
				menu2.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(1).getImage())));
				menu3.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(2).getImage())));
				menu4.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(3).getImage())));
				menu5.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(4).getImage())));
				menu6.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(5).getImage())));
				menu7.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(6).getImage())));
				menu8.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(7).getImage())));		*/
			}
		});
		ertong.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		ertong.setBounds(109, 72, 83, 23);
		contentPane.add(ertong);
		
		renwen = new JButton("");
		renwen.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/人文社科.jpg")));
		renwen.setBackground(SystemColor.menu);
		renwen.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b6.setText("6");
				b7.setText("7");
				b8.setText("8");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/21.jpg")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/22.jpg")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/23.jpg")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/24.jpg")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/25.jpg")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/26.jpg")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/27.jpg")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/28.jpg")));
				/*bookListByType = ud.selectByType("selectByType", new Book("1","张三","人文社科"));
				menu1.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage())));
				menu2.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(1).getImage())));
				menu3.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(2).getImage())));
				menu4.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(3).getImage())));
				menu5.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(4).getImage())));
				menu6.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(5).getImage())));
				menu7.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(6).getImage())));
				menu8.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(7).getImage())));*/
			}
		});
		renwen.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		renwen.setBounds(208, 72, 75, 23);
		contentPane.add(renwen);
		
		JButton qingchun = new JButton("");
		qingchun.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/青春励志.jpg")));
		qingchun.setBackground(SystemColor.menu);
		qingchun.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b4.setText("4");
				b5.setText("5");
				b6.setText("6");
				b7.setText("7");
				b8.setText("");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/6.jpg")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/7.jpg")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/8.jpg")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/9.jpg")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/10.jpg")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/11.jpg")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/12.jpg")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				/*bookListByType = ud.selectByType("selectByType", new Book("1","张三","青春励志"));
				System.out.println("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage());
				menu1.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage())));
				menu2.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(1).getImage())));
				menu3.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(2).getImage())));
				menu4.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(3).getImage())));
				menu5.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(4).getImage())));
				menu6.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(5).getImage())));
				menu7.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(6).getImage())));
				menu8.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(7).getImage())));	*/
			}
		});
		qingchun.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		qingchun.setBounds(301, 72, 75, 23);
		contentPane.add(qingchun);
		
		JButton wangluo = new JButton("");
		wangluo.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/网络文学.jpg")));
		wangluo.setBackground(SystemColor.menu);
		wangluo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b1.setText("1");
				b2.setText("2");
				b3.setText("3");
				b4.setText("4");
				b5.setText("5");
				b6.setText("6");
				b7.setText("7");
				b8.setText("8");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/13.jpg")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/14.jpg")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/15.jpg")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/16.jpg")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/17.jpg")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/18.jpg")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/19.jpg")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/20.jpg")));
				/*bookListByType = ud.selectByType("selectByType", new Book("1","张三","网络文学"));
				menu1.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage())));
				menu2.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(1).getImage())));
				menu3.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(2).getImage())));
				menu4.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(3).getImage())));
				menu5.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(4).getImage())));
				menu6.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(5).getImage())));
				menu7.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(6).getImage())));
				menu8.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(7).getImage())));	*/
			}
		});
		wangluo.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		wangluo.setBounds(487, 72, 75, 23);
		contentPane.add(wangluo);
		
		JButton gudian = new JButton("");
		gudian.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/古典文学.jpg")));
		gudian.setBackground(SystemColor.menu);
		gudian.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b1.setText("1");
				b2.setText("2");
				b3.setText("3");
				b4.setText("4");
				b5.setText("5");
				b6.setText("6");
				b7.setText("7");
				b8.setText("8");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/36.jpg")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/37.jpg")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/38.jpg")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/39.jpg")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/40.jpg")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/41.jpg")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/42.jpg")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/43.jpg")));
				/*bookListByType = ud.selectByType("selectByType", new Book("1","张三","古典文学"));
				menu1.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage())));
				menu2.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(1).getImage())));
				menu3.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(2).getImage())));
				menu4.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(3).getImage())));
				menu5.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(4).getImage())));
				menu6.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(5).getImage())));
				menu7.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(6).getImage())));
				menu8.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(7).getImage())));	*/
			}
		});
		gudian.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		gudian.setBounds(572, 72, 75, 23);
		contentPane.add(gudian);
		
		JButton kongbu = new JButton("");
		kongbu.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/恐怖悬疑.jpg")));
		kongbu.setBackground(SystemColor.menu);
		kongbu.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				b1.setText("1");
				b2.setText("2");
				b3.setText("3");
				b4.setText("4");
				b5.setText("5");
				b6.setText("6");
				b7.setText("7");
				b8.setText("");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/29.jpg")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/30.jpg")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/31.jpg")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/32.jpg")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/33.jpg")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/34.jpg")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/35.jpg")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				/*bookListByType = ud.selectByType("selectByType", new Book("1","张三","恐怖悬疑"));
				menu1.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(0).getImage())));
				menu2.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(1).getImage())));
				menu3.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(2).getImage())));
				menu4.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(3).getImage())));
				menu5.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(4).getImage())));
				menu6.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(5).getImage())));
				menu7.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(6).getImage())));
				menu8.setIcon(new ImageIcon(U_BorrowBook2.class.getResource("/ZhanLang_Libary/src/"+bookListByType.get(7).getImage())));*/
			}
		});
		kongbu.setFont(new Font("微软雅黑", Font.PLAIN, 12));
		kongbu.setBounds(658, 72, 83, 23);
		contentPane.add(kongbu);
		
		book6 = new JLabel("");
		book6.setFont(new Font("楷体", Font.BOLD, 12));
		book6.setBounds(305, 456, 54, 15);
		contentPane.add(book6);
		
		book7 = new JLabel("");
		book7.setFont(new Font("楷体", Font.BOLD, 12));
		book7.setBounds(464, 456, 54, 15);
		contentPane.add(book7);
		
		book8 = new JLabel("");
		book8.setFont(new Font("楷体", Font.BOLD, 12));
		book8.setBounds(603, 462, 54, 15);
		contentPane.add(book8);
		
		JButton zhenguan = new JButton("");
		zhenguan.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				b2.setText("");
				b3.setText("");
				b4.setText("");
				b5.setText("");
				b6.setText("");
				b7.setText("");
				b8.setText("");
				menu1.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/封皮/44.jpg")));
				menu2.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu3.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu4.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu5.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu6.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu7.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				menu8.setIcon(new ImageIcon(U_BorrowBook.class.getResource("")));
				
				
			}
		});
		zhenguan.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/镇馆之宝.jpg")));
		zhenguan.setBounds(386, 72, 83, 23);
		contentPane.add(zhenguan);
		
		JLabel label = new JLabel("");
		label.setIcon(new ImageIcon(U_BorrowBook.class.getResource("/picture/text/浏览图书背景.jpg")));
		label.setBounds(0, 0, 884, 562);
		contentPane.add(label);
		
		
	}
	
}
