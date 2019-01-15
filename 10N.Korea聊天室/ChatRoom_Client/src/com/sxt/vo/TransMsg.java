package com.sxt.vo;

import java.io.Serializable;

/**
 * 用于承载传输信息的类
 * 服务器和客户端都有且一摸一样
 * @author penglijun
 *
 */
public class TransMsg implements Serializable{
	private static final long serialVersionUID = 1L;
	private String function; //判断传输数据的作用
	private Object Msg;//传输数据
	private String content;//传输聊天记录
	
	public TransMsg(String function, Object msg, String chatContent) {
		super();
		this.function = function;
		Msg = msg;
		this.content = chatContent;
	}
	
	
	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	/**
	 * 无参构造
	 */
	public TransMsg(){}
	/**
	 * 有参构造
	 * @param function
	 * @param Msg
	 */
	public TransMsg(String function,Object Msg) {
		this.function=function;
		this.Msg=Msg;
	}
	/**
	 * 得到对应的功能
	 * @return
	 */
	public String getFunction() {
		return function;
	}
	/**
	 * 建立对应的功能
	 * @param function
	 */
	public void setFunction(String function) {
		this.function = function;
	}
	/**
	 * 得到数据包
	 * @return
	 */
	public Object getMsg() {
		return Msg;
	}
	/**
	 * 建立数据包
	 * @param msg
	 */
	public void setMsg(Object msg) {
		Msg = msg;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Msg == null) ? 0 : Msg.hashCode());
		result = prime * result + ((function == null) ? 0 : function.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TransMsg other = (TransMsg) obj;
		if (Msg == null) {
			if (other.Msg != null)
				return false;
		} else if (!Msg.equals(other.Msg))
			return false;
		if (function == null) {
			if (other.function != null)
				return false;
		} else if (!function.equals(other.function))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "TransMsg [function=" + function + ", Msg=" + Msg + ", content=" + content + "]";
	}
	
}
