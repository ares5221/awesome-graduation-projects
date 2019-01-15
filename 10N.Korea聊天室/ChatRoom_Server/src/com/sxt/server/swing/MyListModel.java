package com.sxt.server.swing;

import java.util.ArrayList;

import javax.swing.AbstractListModel;

import com.sxt.vo.Users;
/**
 * 自动定义 ListModel
 * @author gabriel
 *
 */
public class MyListModel extends AbstractListModel{
	ArrayList<Users> uArray;//好友类表；
    
	public MyListModel(ArrayList<Users> uArray){
		 this.uArray=uArray;		
	}
	@Override
	public int getSize() {  
		return uArray.size();
	}
	@Override
	public Object getElementAt(int index) {
		return   uArray.get(index) ;
	}
	
}
