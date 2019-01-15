package com.sxt.util;

import java.awt.Color;
import java.util.LinkedList;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;

import com.sxt.swing.OneChatPanel;

/**
 * 字体辅助类
 * @author penglijun
 *
 */
public class FontAndText {
	
	
	public static final int GENERAL = 0; // 常规
	private String msg = "", name = "宋体"; // 要输入的文本和字体名称
	
	private int size = 20; //字号

	private Color color = new Color(0,0,0); // 文字颜色

	private SimpleAttributeSet attrSet = null; // 属性集
	/**
	 * 一个空的构造（可当做换行使用）
	 */
	
	
	
	public FontAndText() {
	}
	public FontAndText(String msg,String fontName,int fontSize,Color color){
		this.msg = msg;
		this.name = fontName;
		this.size = fontSize;
		this.color = color;
	}


	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setAttrSet(SimpleAttributeSet attrSet) {
		this.attrSet = attrSet;
	}
	/**
	 * 返回属性集
	 * 
	 * @return
	 */
	public SimpleAttributeSet getAttrSet() {
		
		attrSet = new SimpleAttributeSet();
		if (name != null){
			StyleConstants.setFontFamily(attrSet, name);
		}
		StyleConstants.setBold(attrSet, true);
		StyleConstants.setItalic(attrSet, false);
		StyleConstants.setFontSize(attrSet, size);
		if (color != null)
			StyleConstants.setForeground(attrSet, color);
		return attrSet;
	}
	
	
	public String toString(){
		return name+"|"
				+size+"|"
				+color.getRed()+"-"+color.getGreen()+"-"+color.getBlue()+"|"
				+msg;
	}
	public String getText() {
		return msg;
	}

	public void setText(String text) {
		this.msg = text;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	
	
	
}
