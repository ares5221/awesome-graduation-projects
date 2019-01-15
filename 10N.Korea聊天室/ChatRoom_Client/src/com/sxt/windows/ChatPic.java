package com.sxt.windows;
import java.net.URL;
import javax.swing.ImageIcon;
/**
 * 将每一个表情编号以便使用
 * @author penglijun
 *
 */
public class ChatPic extends ImageIcon{
	
	
	private static final long serialVersionUID = 1L;
	int im;//图片编号
	
	public int getIm() {
		return im;
	}
	public void setIm(int im) {
		this.im = im;
	}
	public ChatPic(URL url,int im){
		super(url);
		this.im = im;
	}
}
