package com.sxt.swing;


import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

import com.sxt.util.PicInfo;
import com.sxt.util.FontAndText;
import com.sxt.windows.ChatPic;
import com.sxt.windows.CoolToolTip;
import com.sxt.windows.PicsJWindow;

import java.awt.Toolkit;
import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JTextPane;
import javax.swing.JButton;
import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.BoxLayout;
import javax.swing.DefaultComboBoxModel;
import javax.swing.Icon;

import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.LinkedList;
import java.util.List;
import java.awt.event.ActionEvent;

/**
 * 私聊聊天界面绘制
 * @author pengLijun
 *
 */
public class SigleChatSwing extends JFrame implements WindowListener {

	private JPanel contentPane;

	
	private JLabel friendMsgLabel ;//好友信息
	private JPanel textPane ;//聊天内容
	private JButton fontButton ;//字体设置
	private JButton emojiButton ;//表情设置
	private JTextPane sendText ;//发送内容
	private JComboBox msgComboBox ;//历史记录等操作下拉框
	private JButton clearButton ;//清除按钮
	private JButton sendButton ;//提交按钮
	
	private PicsJWindow picsJWindow;
	
	private JScrollPane messagePane;//聊天窗口

	public JScrollPane getMessagePane() {
		return messagePane;
	}

	public void setMessagePane(JScrollPane messagePane) {
		this.messagePane = messagePane;
	}

	public PicsJWindow getPicsJWindow() {
		return picsJWindow;
	}

	public void setPicsJWindow(PicsJWindow picsJWindow) {
		this.picsJWindow = picsJWindow;
	}

	public JLabel getFriendMsgLabel() {
		return friendMsgLabel;
	}

	public void setFriendMsgLabel(JLabel friendMsgLabel) {
		this.friendMsgLabel = friendMsgLabel;
	}

	public JPanel getTextPane() {
		return textPane;
	}

	public void setTextPane(JPanel textPane) {
		this.textPane = textPane;
	}

	public JButton getFontButton() {
		return fontButton;
	}

	public void setFontButton(JButton fontButton) {
		this.fontButton = fontButton;
	}

	public JButton getEmojiButton() {
		return emojiButton;
	}

	public void setEmojiButton(JButton emojiButton) {
		this.emojiButton = emojiButton;
	}

	public JTextPane getSendText() {
		return sendText;
	}

	public void setSendText(JTextPane sendText) {
		this.sendText = sendText;
	}

	public JComboBox getMsgComboBox() {
		return msgComboBox;
	}

	public void setMsgComboBox(JComboBox msgComboBox) {
		this.msgComboBox = msgComboBox;
	}

	public JButton getClearButton() {
		return clearButton;
	}

	public void setClearButton(JButton clearButton) {
		this.clearButton = clearButton;
	}

	public JButton getSendButton() {
		return sendButton;
	}

	public void setSendButton(JButton sendButton) {
		this.sendButton = sendButton;
	}

	/**
	 * Create the frame.
	 */
	public SigleChatSwing() {
		setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		setTitle("N.Korea聊天室");
		setIconImage(Toolkit.getDefaultToolkit().getImage(SigleChatSwing.class.getResource("/com/sxt/swing/images/imgp/weixiao.png")));
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 983, 760);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(95, 158, 160));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		friendMsgLabel= new JLabel("好友名");
		friendMsgLabel.setHorizontalAlignment(SwingConstants.LEFT);
		friendMsgLabel.setFont(new Font("微软雅黑 Light", Font.BOLD, 24));
		friendMsgLabel.setBounds(28, 0, 182, 67);
		contentPane.add(friendMsgLabel);
		
		messagePane=new JScrollPane();
		messagePane.setBounds(0, 70, 978, 418);
		textPane= new JPanel();
		textPane.setLayout(new BoxLayout(textPane, BoxLayout.Y_AXIS));
		textPane.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
//		textPane.setBounds(0, 70, 978, 418);
		messagePane.setViewportView(textPane);
		contentPane.add(messagePane);
		
		sendText= new JTextPane();
		sendText.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		sendText.setBounds(0, 534, 978, 103);
		contentPane.add(sendText);
		
		fontButton= new JButton("A");
		fontButton.setFont(new Font("Consolas", Font.PLAIN, 30));
		fontButton.setBackground(new Color(95, 158, 160));
		fontButton.setBounds(0, 487, 77, 48);
		contentPane.add(fontButton);
		
		emojiButton= new JButton("");
		emojiButton.setIcon(new ImageIcon(SigleChatSwing.class.getResource("/com/sxt/swing/images/imgp/emoji.png")));
		emojiButton.setFont(new Font("Consolas", Font.PLAIN, 30));
		emojiButton.setBackground(new Color(95, 158, 160));
		emojiButton.setBounds(76, 487, 77, 48);
		contentPane.add(emojiButton);
		
		msgComboBox= new JComboBox();
		msgComboBox.setBackground(new Color(95, 158, 160));
		msgComboBox.setFont(new Font("微软雅黑 Light", Font.PLAIN, 20));
		msgComboBox.setModel(new DefaultComboBoxModel(new String[] {"消息记录", "显示消息记录", "清屏"}));
		msgComboBox.setBounds(847, 490, 131, 43);
		contentPane.add(msgComboBox);
		
		clearButton= new JButton("清空");
		clearButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				sendText.setText(null);
			}
		});
		clearButton.setFont(new Font("微软雅黑", Font.BOLD, 24));
		clearButton.setBackground(new Color(40, 96, 144));
		clearButton.setBounds(658, 645, 145, 44);
		contentPane.add(clearButton);
		
		sendButton= new JButton("发送");
		sendButton.setFont(new Font("微软雅黑", Font.BOLD, 24));
		sendButton.setBackground(new Color(40, 96, 144));
		sendButton.setBounds(818, 645, 145, 44);
		contentPane.add(sendButton);
		
		this.setVisible(true);
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		
		picsJWindow = new PicsJWindow(this);
		
		this.addComponentListener(new ComponentAdapter(){

			@Override
			public void componentResized(ComponentEvent e) {
				picsJWindow.dispose();
			}

			@Override
			public void componentMoved(ComponentEvent e) {
				picsJWindow.dispose();
			}

			@Override
			public void componentHidden(ComponentEvent e) {
				picsJWindow.dispose();
			}
			
		});
	}
	
	/**
	 * 插入图片
	 * 
	 * @param icon
	 */
	public void insertSendPic(ImageIcon imgIc) {
		//sigleChatSwing.getSendText().setCaretPosition(docChat.getLength()); // 设置插入位置
		sendText.insertIcon(imgIc); // 插入图片
		System.out.print(imgIc.toString());
		//insert(new FontAttrib()); // 这样做可以换行
	}



	@Override
	public void windowActivated(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void windowClosed(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void windowClosing(WindowEvent arg0) {
		this.setVisible(false);
		
	}



	@Override
	public void windowDeactivated(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void windowDeiconified(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void windowIconified(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void windowOpened(WindowEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	

	private List<PicInfo> receivdPicInfo = new LinkedList<PicInfo>();
	private List<PicInfo> myPicInfo = new LinkedList<PicInfo>();

	/**
	 * 重组发送的表情信息
	 * 
	 * @return 重组后的信息串 格式为 位置|代号+位置|代号+……
	 */
	private String buildPicInfo() {
		StringBuilder sb = new StringBuilder("");
		StyledDocument docMsg =getSendText().getStyledDocument();
		// 遍历jtextpane找出所有的图片信息封装成指定格式
		for (int i = 0; i < getSendText().getText().length(); i++) {
			// if(mainRoomSwing.getSendMessage().getCh){
			if (docMsg.getCharacterElement(i).getName().equals("icon")) {
				// ChatPic = (ChatPic)
				Icon icon = StyleConstants.getIcon(
						 getSendText().getStyledDocument().getCharacterElement(i).getAttributes());
				ImageIcon icon2 = (ImageIcon) icon;
				ChatPic cupic = (ChatPic) icon;
				PicInfo picInfo = new PicInfo(i, cupic.getIm() + "");
				myPicInfo.add(picInfo);
				sb.append(i + "&" + cupic.getIm() + "+");
			}
		}
		return sb.toString();

	}

	/* 错误信息气泡提示 */
	private CoolToolTip error_tip;

	/**
	 * 发送消息
	 */
	private FontAndText myFont = null;

	public String sendMsg() {
		String message = getSendText().getText();
		if (message.length() == 0) {
			error_tip.setText("请输入聊天信息！");
			error_tip.setVisible(true);
			return "";
		}
		if (message.length() > 100) {
			error_tip.setText("消息最多一百个字符！你要发送的为" + message.length() + "个字符！");
			error_tip.setVisible(true);
			return "";
		}

		myFont = getFontAttrib();

		return myFont.toString();
	}

	
	FontAndText att = new FontAndText();
	/**
	 * 获取所需要的文字设置
	 * 
	 * @return FontAttrib
	 */
	private FontAndText getFontAttrib() {
		
		att.setText(getSendText().getText() + "*" + buildPicInfo());// 文本和表情信息
		return att;
	}

	public List<PicInfo> getReceivdPicInfo() {
		return receivdPicInfo;
	}

	public void setReceivdPicInfo(List<PicInfo> receivdPicInfo) {
		this.receivdPicInfo = receivdPicInfo;
	}

	public List<PicInfo> getMyPicInfo() {
		return myPicInfo;
	}

	public void setMyPicInfo(List<PicInfo> myPicInfo) {
		this.myPicInfo = myPicInfo;
	}

	public FontAndText getMyFont() {
		return myFont;
	}

	public void setMyFont(FontAndText myFont) {
		this.myFont = myFont;
	}

	/*
	 * 重组收到的表情信息串
	 */
	public void receivedPicInfo(String picInfos) {
		
		String[] infos = picInfos.split("[+]");
		for (int i = 0; i < infos.length; i++) {
			
			String[] tem = infos[i].split("[&]");
			if (tem.length == 2) {
				PicInfo pic = new PicInfo(Integer.parseInt(tem[0]), tem[1]);
				receivdPicInfo.add(pic);
			}
		}
	}

	/**
	 * 将收到的消息转化为自定义的字体类对象
	 * 
	 * @param message
	 *            收到的聊天信息
	 * @return 字体类对象
	 */
	public FontAndText getRecivedFont(String message) {
		String[] msgs = message.split("[|]");
		String fontName = "";
		int fontSize = 0;
		String[] color;
		String text = message;
		Color fontC = new Color(222, 222, 222);
		if (msgs.length >= 4) {/* 这里简单处理，表示存在字体信息 */
			fontName = msgs[0];
			fontSize = Integer.parseInt(msgs[1]);
			color = msgs[2].split("[-]");
			if (color.length == 3) {
				int r = Integer.parseInt(color[0]);
				int g = Integer.parseInt(color[1]);
				int b = Integer.parseInt(color[2]);
				fontC = new Color(r, g, b);
			}
			text = "";
			for (int i = 3; i < msgs.length; i++) {
				text = text + msgs[i];
			}
		}
		FontAndText attr = new FontAndText();

		attr.setName(fontName);
		attr.setSize(fontSize);
		attr.setColor(fontC);

		attr.setText(text);
	
		return attr;
	}

}
