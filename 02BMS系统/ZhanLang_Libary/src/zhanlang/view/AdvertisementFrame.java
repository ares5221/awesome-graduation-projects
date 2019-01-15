package zhanlang.view;

import javax.swing.JFrame;
import java.awt.Toolkit;
import java.awt.Window.Type;
import java.awt.Dialog.ModalExclusionType;
import javax.swing.JLabel;
import java.awt.BorderLayout;
import javax.swing.ImageIcon;

public class AdvertisementFrame extends JFrame{
	public AdvertisementFrame() {
		
		//设置位置和大小
		this.setBounds(200, 200, 933, 524);
		this.setLocationRelativeTo(null);
		//设置背景图片
		
		
		//不显示标题栏
		this.setUndecorated(true); 
		this.setType(Type.UTILITY);
		getContentPane().setLayout(null);
		
		JLabel label = new JLabel("");
		label.setIcon(new ImageIcon(AdvertisementFrame.class.getResource("/advertisement/2.jpg")));
		label.setBounds(272, 188, 563, 296);
		getContentPane().add(label);
		
		JLabel label_1 = new JLabel("");
		label_1.setIcon(new ImageIcon(AdvertisementFrame.class.getResource("/advertisement/1.jpg")));
		label_1.setBounds(177, 41, 563, 118);
		getContentPane().add(label_1);
		
		JLabel label_2 = new JLabel("");
		label_2.setIcon(new ImageIcon(AdvertisementFrame.class.getResource("/advertisement/3.jpg")));
		label_2.setBounds(0, 0, 933, 524);
		getContentPane().add(label_2);
		//显示窗口
		this.setVisible(true);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.dispose();
		
	}
}
