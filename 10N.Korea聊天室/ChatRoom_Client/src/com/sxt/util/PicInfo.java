package com.sxt.util;

/**
 * 表情信息辅助类
 * @author penglijun
 *
 */
public class PicInfo {
	/* 图片信息 */
	int pos;  //位置
	String val;  //值（每个表情的代号）

	public PicInfo(int pos, String val) {
		this.pos = pos;
		this.val = val;
	}

	public int getPos() {
		return pos;
	}

	public void setPos(int pos) {
		this.pos = pos;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

}
