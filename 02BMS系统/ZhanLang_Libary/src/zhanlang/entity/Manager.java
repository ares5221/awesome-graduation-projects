package zhanlang.entity;


import java.io.Serializable;

public class Manager extends Person implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6313290633956306352L;

	public Manager(String userName, String password){
		super(userName,password);
	}
}
