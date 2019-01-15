package com.sxt.server.swing;



import java.awt.EventQueue;
import java.awt.FlowLayout;
import java.awt.Image;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;

import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JWindow;
import javax.swing.ScrollPaneConstants;


import java.awt.Color;
import java.awt.Container;
/**
 * 头像显示Window
 * @author gabriel
 *
 */
public class HeadWindow extends JWindow implements MouseListener{
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					HeadWindow window = new HeadWindow();
					window.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	Container c;
	JPanel jPanel;
	JScrollPane scrollPane;
	public   HeadWindow() {
		this.addMouseListener(this);
		this.setLayout(new FlowLayout());
		init();
		setLocationRelativeTo(null);
		setVisible(true);
	}
	void init(){
	//得到全部头像文件
		File[] files=com.sxt.service.HeadImage.getAllHead();
		setSize(480, (int)(files.length/6)*45);
		for(int i=0;i<files.length;i++){
			JLabel jLabel=new JLabel();
			ImageIcon icon =new ImageIcon("res/headimg/"+files[i].getName());
			icon.setImage(icon.getImage().getScaledInstance(30, 30, Image.SCALE_DEFAULT));
			jLabel.setIcon(icon);
			jLabel.setText(files[i].getName());
				this.getContentPane().add(jLabel);
			
		}
	}
	@Override
	public void mouseClicked(MouseEvent e) {
		this.dispose();
	}
	@Override
	public void mousePressed(MouseEvent e) {
		this.dispose();		
	}
	@Override
	public void mouseReleased(MouseEvent e) {
		this.dispose();
	}
	@Override
	public void mouseEntered(MouseEvent e) {
		getContentPane().setBackground(new Color(255, 228, 196));		
	}
	@Override
	public void mouseExited(MouseEvent e) {
		getContentPane().setBackground(new Color(211, 211, 211));
	}
}

