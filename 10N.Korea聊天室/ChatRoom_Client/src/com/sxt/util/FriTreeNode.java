package com.sxt.util;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.swing.ImageIcon;
import javax.swing.tree.TreeNode;

/**
 * 重写TreeNode
 * 将一个节点设置成自己所需要的格式
 * @author penglijun
 *
 */
public class FriTreeNode implements TreeNode{

	private String ID;//该节点的ID号
	private ImageIcon img;//节点存放图片
	private String uName;//第一行文字（显示名字）
	private String text;//第二行文字（显示签名）

	private ArrayList<TreeNode> children;//孩子节点
	private TreeNode parent;//父亲节点
	
	public FriTreeNode(String ID) {	
		this.ID=ID;		
	}
	public FriTreeNode() {	
	
	}
	public FriTreeNode(String name,String text,ImageIcon img,String ID) {	
		this.uName=name;
		this.text=text;
		this.img=img;
		this.ID=ID;
	}
	
	/**
	 * @return the iD
	 */
	public String getID() {
		return ID;
	}
	/**
	 * @param iD the iD to set
	 */
	public void setID(String iD) {
		ID = iD;
	}
	/**
	 * @return the uName
	 */
	public String getuName() {
		return uName;
	}
	/**
	 * @param uName the uName to set
	 */
	public void setuName(String uName) {
		this.uName = uName;
	}
	/**
	 * @param parent the parent to set
	 */
	public void setParent(FriTreeNode parent) {
		this.parent = parent;
	}

	/**
	 * @return the img
	 */
	public ImageIcon getImg() {
		return img;
	}

	/**
	 * @param img the img to set
	 */
	public void setImg(ImageIcon img) {
		this.img = img;
	}
	
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	public void addchild(FriTreeNode aChild){
		
		if(children==null){
			children=new ArrayList<TreeNode>();
		}
		children.add(aChild);
		aChild.parent=this;
	}
	/***
	 * 判断是否为根节点
	 * @return
	 */
	public boolean isroot(){
		
		return (getParent()==null);
			
	}
	
	@Override
	public TreeNode getChildAt(int childIndex) {
		if (children == null) {
            throw new ArrayIndexOutOfBoundsException("node has no children");
        }
		return children.get(childIndex) ;
	}

	@Override
	public int getChildCount() {
		if (children == null) {
            return -1 ;
        }
		return children.size();
	}

	@Override
	public TreeNode getParent() {
		
		return parent;
	}	
	@Override
	public int getIndex(TreeNode aChild) {
		
		if (aChild == null) {
            throw new IllegalArgumentException("argument is null");
        }

        if (!isNodeChild(aChild)) {
            return -1;
        }
        return children.indexOf(aChild); 	
	}

	@Override
	public boolean getAllowsChildren() {
		
		return true;
	}

	/**
	 * 判断是否是叶子节点
	 */
	@Override
	public boolean isLeaf() {
		
		return (getChildCount() ==-1)&&(getParent()!=null);
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Enumeration children() {
		return null;
	}

	 public boolean isNodeChild(TreeNode aNode) {
	        boolean retval;

	        if (aNode == null) {
	            retval = false;
	        } else {
	            if (getChildCount() == 0) {
	                retval = false;
	            } else {
	                retval = (aNode.getParent() == this);
	            }
	        }

	        return retval;
	    }
	 
}