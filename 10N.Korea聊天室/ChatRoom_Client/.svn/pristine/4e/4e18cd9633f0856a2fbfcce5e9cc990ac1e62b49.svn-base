package com.sxt.swing;

import java.awt.Container;
import java.awt.Image;
import java.io.File;

import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ScrollPaneConstants;

import com.sxt.util.HeadImage;

public class SelectHeadSwing extends JFrame{
	Container c;
	JPanel jPanel;
	JScrollPane scrollPane;
	
	public SelectHeadSwing() {
		this.setLayout(null);
		setDefaultCloseOperation(HIDE_ON_CLOSE);
		setSize(400, 300);
		jPanel =new JPanel();
		
		jPanel.setBounds(0, 0,500, 100);
		jPanel.setLayout(new BoxLayout(jPanel, BoxLayout.Y_AXIS));
		init();
		 scrollPane =new JScrollPane();
		
		 scrollPane.setViewportView(jPanel);
		 scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
		 scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		 scrollPane.setBounds(0, 0, 380, 280);
		add(scrollPane);
		setLocationRelativeTo(null);
		setResizable(false);
		setVisible(true);
	}
	void init(){
		File[] files=HeadImage.getAllHead();
		for(int i=0;i<files.length;i++){
//			JLabel jLabel=new JLabel();
//			ImageIcon icon =new ImageIcon("res/headimg/"+files[i].getName());
//			icon.setImage(icon.getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT));
//			jLabel.setIcon(icon);
//			jLabel.setText(files[i].getName());
			
			if(i%4==3){
				JLabel jLabel1=new JLabel();
				ImageIcon icon1 =new ImageIcon("res/headimg/"+files[i-2].getName());
				icon1.setImage(icon1.getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT));
				jLabel1.setIcon(icon1);
				jLabel1.setText(files[i-2].getName());
				JLabel jLabel2=new JLabel();
				ImageIcon icon2 =new ImageIcon("res/headimg/"+files[i-1].getName());
				icon2.setImage(icon2.getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT));
				jLabel2.setIcon(icon2);
				jLabel2.setText(files[i-1].getName());
				JLabel jLabel3=new JLabel();
				ImageIcon icon3 =new ImageIcon("res/headimg/"+files[i].getName());
				icon3.setImage(icon3.getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT));
				jLabel3.setIcon(icon3);
				jLabel3.setText(files[i].getName());
				JPanel j =new JPanel();
				j.add(jLabel3);j.add(jLabel2);j.add(jLabel1);
				jPanel.add(j);
			}
		}
	}
	
}
