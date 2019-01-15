package com.sxt.swing;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.EmptyBorder;

import com.sxt.serice.LoginOperate;
import com.sxt.util.HeadImage;
import com.sxt.util.Regex;

import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.Font;

import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.Color;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import java.awt.Toolkit;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.io.File;
import java.awt.event.ActionEvent;
import javax.swing.JPasswordField;
import javax.swing.JComboBox;

/**
 * 
 * 注册页面设计绘制
 * 
 * @author pengLijun
 *
 */
public class RegisterSwing extends JFrame implements FocusListener {

	private JComboBox comboBox;// 选择头像下拉框
	private JTextField idText;// 账号输入框
	private JTextField nameText;// 昵称输入框
	private JButton resetButton;// 重置按钮
	private JButton submitButton;// 提交按钮
	private boolean flag = false;

	private JPanel contentPane;// 主jpanel容器
	private JPasswordField passwordText;// 密码输入框
	private JPasswordField checkpswText;// 再次输入密码框
	private JLabel checkIdLabel; // id校验结果显示
	private JLabel checkNamelabel;// 昵称校验结果显示
	private JLabel checkPwdlabel;// 密码校验结果显示
	private JLabel reCheckPwdlabel;// 重复密码校验结果显示

	/**
	 * 注册页面绘制
	 */
	public RegisterSwing() {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException
				| UnsupportedLookAndFeelException e1) {
			e1.printStackTrace();
		}
		setIconImage(Toolkit.getDefaultToolkit()
				.getImage(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/weixiao.png")));
		setFont(new Font("微软雅黑 Light", Font.PLAIN, 18));
		setTitle("N.Korea聊天室");
		setBackground(new Color(255, 239, 213));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 457, 632);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(102, 153, 255));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel lblNewLabel = new JLabel();
		lblNewLabel.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/yhzc.jpg")));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBounds(58, 48, 329, 49);
		contentPane.add(lblNewLabel);

		JLabel idLabel = new JLabel();
		idLabel.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/zh.jpg")));
		idLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		idLabel.setBounds(22, 146, 109, 24);
		contentPane.add(idLabel);

		idText = new JTextField();
		idText.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		idText.setBounds(136, 143, 263, 27);
		idText.addFocusListener(this);
		contentPane.add(idText);
		idText.setColumns(10);

		JLabel nameLabel = new JLabel();
		nameLabel.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/nc.jpg")));
		nameLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		nameLabel.setBounds(22, 213, 109, 24);
		contentPane.add(nameLabel);

		nameText = new JTextField();
		nameText.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		nameText.setColumns(10);
		nameText.setBounds(136, 210, 263, 27);
		nameText.addFocusListener(this);
		contentPane.add(nameText);

		JLabel passwordLabel = new JLabel();
		passwordLabel.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/mm.jpg")));
		passwordLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		passwordLabel.setBounds(22, 283, 109, 24);
		contentPane.add(passwordLabel);

		JLabel checkpswLabel = new JLabel();
		checkpswLabel.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/qrmm.jpg")));
		checkpswLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		checkpswLabel.setBounds(22, 353, 109, 24);
		contentPane.add(checkpswLabel);

		passwordText = new JPasswordField();
		passwordText.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		passwordText.setBounds(136, 280, 263, 27);
		passwordText.addFocusListener(this);
		contentPane.add(passwordText);

		checkpswText = new JPasswordField();
		checkpswText.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		checkpswText.setBounds(136, 350, 263, 27);
		checkpswText.addFocusListener(this);
		contentPane.add(checkpswText);

		resetButton = new JButton();
		resetButton.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/cz.jpg")));
		resetButton.setBounds(33, 494, 100, 40);
		resetButton.setBackground(new Color(40, 96, 144));
		contentPane.add(resetButton);
		resetButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				idText.setText(null);
				nameText.setText(null);
				passwordText.setText(null);
				checkpswText.setText(null);
			}
		});

		submitButton = new JButton();
		submitButton.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/zc.jpg")));
		submitButton.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		submitButton.setBackground(new Color(40, 96, 144));
		submitButton.setBounds(174, 494, 100, 40);
		contentPane.add(submitButton);

		JButton canner = new JButton();
		canner.setIcon(new ImageIcon(RegisterSwing.class.getResource("/com/sxt/swing/images/imgp/zcqx.jpg")));
		canner.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		canner.setBounds(306, 494, 100, 40);
		canner.setBackground(new Color(40, 96, 144));
		contentPane.add(canner);
		// 点击取消按钮后跳转回登录界面
		canner.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new LoginOperate();
				setVisible(false);
			}
		});

		checkIdLabel = new JLabel("请输入正确用户名(6-8位数字或字母)");
		checkIdLabel.setForeground(new Color(255, 0, 0));
		checkIdLabel.setFont(new Font("黑体", Font.BOLD, 18));
		checkIdLabel.setBounds(103, 177, 316, 23);
		checkIdLabel.setVisible(false);
		contentPane.add(checkIdLabel);

		checkNamelabel = new JLabel("请输入正确的昵称(2-8位非数字字符)");
		checkNamelabel.setForeground(new Color(255, 0, 0));
		checkNamelabel.setFont(new Font("黑体", Font.BOLD, 18));
		checkNamelabel.setBounds(103, 243, 319, 27);
		checkNamelabel.setVisible(false);
		contentPane.add(checkNamelabel);

		checkPwdlabel = new JLabel("请输入正确的密码(3-8位)");
		checkPwdlabel.setForeground(Color.RED);
		checkPwdlabel.setFont(new Font("黑体", Font.BOLD, 18));
		checkPwdlabel.setBounds(136, 313, 289, 27);
		checkPwdlabel.setVisible(false);
		contentPane.add(checkPwdlabel);

		reCheckPwdlabel = new JLabel("两次密码输入不一致");
		reCheckPwdlabel.setForeground(Color.RED);
		reCheckPwdlabel.setFont(new Font("黑体", Font.BOLD, 18));
		reCheckPwdlabel.setBounds(136, 384, 289, 27);
		reCheckPwdlabel.setVisible(false);
		contentPane.add(reCheckPwdlabel);

		JLabel label = new JLabel();
		label.setText("选择头像");
		label.setForeground(new Color(255, 255, 255));
		label.setFont(new Font("微软雅黑 Light", Font.BOLD, 18));
		label.setHorizontalAlignment(SwingConstants.RIGHT);
		label.setBounds(10, 436, 109, 24);
		contentPane.add(label);

		comboBox = new JComboBox();
		DefaultComboBoxModel<JLabel> model = new DefaultComboBoxModel<>();
		comboBox.setFont(new Font("等线 Light", Font.BOLD, 18));
		comboBox.setBounds(147, 435, 127, 32);
		File[] files = HeadImage.getAllHead();
		for (int i = 0; i < files.length; i++) {
			comboBox.addItem(files[i].getName());
		}

		contentPane.add(comboBox);

		JButton imgButton = new JButton("头像预览");
		imgButton.setBackground(new Color(148, 0, 211));
		imgButton.setFont(new Font("微软雅黑 Light", Font.BOLD, 14));
		imgButton.setForeground(new Color(0, 0, 0));
		imgButton.setBounds(284, 435, 100, 32);
		imgButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				new SelectHeadSwing();
			}
		});
		contentPane.add(imgButton);

		setLocationRelativeTo(null);
		setResizable(false);
		setVisible(true);
	}

	public JComboBox getComboBox() {
		return comboBox;
	}

	public void setComboBox(JComboBox comboBox) {
		this.comboBox = comboBox;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public JTextField getIdText() {
		return idText;
	}

	public void setIdText(JTextField idText) {
		this.idText = idText;
	}

	public JTextField getNameText() {
		return nameText;
	}

	public void setNameText(JTextField nameText) {
		this.nameText = nameText;
	}

	public JTextField getPasswordText() {
		return passwordText;
	}

	public void setPasswordText(JPasswordField passwordText) {
		this.passwordText = passwordText;
	}

	public JTextField getCheckpswText() {
		return checkpswText;
	}

	public void setCheckpswText(JPasswordField checkpswText) {
		this.checkpswText = checkpswText;
	}

	public JButton getResetButton() {
		return resetButton;
	}

	public void setResetButton(JButton resetButton) {
		this.resetButton = resetButton;
	}

	public JButton getSubmitButton() {
		return submitButton;
	}

	public void setSubmitButton(JButton submitButton) {
		this.submitButton = submitButton;
	}

	@Override
	public void focusGained(FocusEvent e) {
	}
	
	
	@Override
	public void focusLost(FocusEvent e) {
		/**
		 * id框监听事件
		 */
		if (e.getSource() == idText) {
			if (!Regex.idRegex(idText.getText())) {
				checkIdLabel.setVisible(true);
				flag = false;
			} else {
				checkIdLabel.setVisible(false);
				flag = true;
			}
		}
		/**
		 * 姓名框事件
		 */
		if (e.getSource() == nameText) {
			if (!Regex.nameRegex(nameText.getText())) {
				checkNamelabel.setVisible(true);
				flag = false;
			} else {
				checkNamelabel.setVisible(false);
				flag = true;
			}
		}
		/**
		 * 密码框监听事件
		 */
		if (e.getSource() == passwordText) {
			if (!Regex.pwdRegex(passwordText.getText())) {
				checkPwdlabel.setVisible(true);
			} else {
				checkPwdlabel.setVisible(false);
				flag = true;
			}
		}
		/**
		 * 检查密码事件
		 */
		if (e.getSource() == checkpswText) {
			if (!passwordText.getText().equals(checkpswText.getText())) {
				reCheckPwdlabel.setVisible(true);
				flag = false;
			} else {
				reCheckPwdlabel.setVisible(false);
				flag = true;
			}
		}
	}
}
