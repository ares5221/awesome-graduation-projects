package com.sxt.windows;


import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.Point;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import javax.swing.Icon;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
/**
 * 气泡提示框类
 * 用于提示操作失败
 */
public class CoolToolTip extends JPanel {
	private static final long serialVersionUID = 1L;
	private JLabel label = new JLabel();
	private boolean haveShowPlace;
	private Component attachedCom;	// 要显示提示气泡的组件
	private Component parentWindow;	// 要显示提示气泡的组件的窗体
	public CoolToolTip(Component parent,Component attachedComponent, Color fillColor,
			int borderWidth, int offset) {
		this.parentWindow = parent;
		this.attachedCom = attachedComponent;
		label.setBorder(new EmptyBorder(borderWidth, borderWidth, borderWidth,
				borderWidth));
		label.setBackground(fillColor);
		label.setOpaque(true);
		label.setFont(new Font("system", 0, 12));

		setOpaque(false);
		// this.setBorder(new BalloonBorder(fillColor, offset));
		this.setLayout(new BorderLayout());
		add(label);

		setVisible(false);
		// 当气泡显示时组件移动，气泡也跟着移动
		this.attachedCom.addComponentListener(new ComponentAdapter() {
			@Override
			public void componentMoved(ComponentEvent e) {
				if (isShowing()) {//悬浮提示 显示了的，重新设置位置
					determineAndSetLocation();
				}
			}
		});
	}
	private void determineAndSetLocation() {
		if(!attachedCom.isShowing()){
			return;
		}
		Point loc = attachedCom.getLocationOnScreen();	//控件相对于屏幕的位置
		Point paPoint = parentWindow.getLocationOnScreen();	//对应窗体相对于屏幕的位置
		setBounds(loc.x-paPoint.x, loc.y -paPoint.y - getPreferredSize().height,
		getPreferredSize().width, getPreferredSize().height);
	}
	public void setText(String text) {
		label.setText(text);
	}
	// 设置气泡背景图片
	public void setIcon(Icon icon) {
		label.setIcon(icon);
	}
	// 设置气泡的文字和图片间的距离
	public void setIconTextGap(int iconTextGap) {
		label.setIconTextGap(iconTextGap);
	}
	@Override
	public void setVisible(boolean show) {
		if (show) {
			determineAndSetLocation();
			findShowPlace();
		}
		super.setVisible(show);
	}
	private void findShowPlace() {
		if (haveShowPlace) {
			return;
		}
	
		JLayeredPane layeredPane = null;
		if(parentWindow instanceof JDialog){
			layeredPane = ((JDialog)parentWindow).getLayeredPane();
		}else if(parentWindow instanceof JFrame){
			layeredPane = ((JFrame)parentWindow).getLayeredPane();
		}
		
		
		if(layeredPane!=null){
			layeredPane.add(this, JLayeredPane.POPUP_LAYER);
			haveShowPlace = true;
		}
	}
	public Component getAttachedComponent() {
		return attachedCom;
	}
	public void setAttachedComponent(Component attachedComponent) {
		this.attachedCom = attachedComponent;
	}
}
