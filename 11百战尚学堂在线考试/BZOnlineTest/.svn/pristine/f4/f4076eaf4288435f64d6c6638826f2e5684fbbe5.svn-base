package entity;

import java.io.Serializable;

public class Student implements Serializable{
	private String Username;
	private String password;
	private String ID;
	private String pass;
	private String unpass;


	public Student() {

	}

	public Student(String username, String password, String ID,String pass,String unpass) {

		super();
		this.Username = username;
		this.password = password;
		this.ID = ID;
		this.pass=pass;
		this.unpass=unpass;

	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	 public String getUnpass() {
		return unpass;
	}

	 public void setUnpass(String unpass) {
		this.unpass = unpass;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ID == null) ? 0 : ID.hashCode());
		result = prime * result + ((Username == null) ? 0 : Username.hashCode());
		result = prime * result + ((pass == null) ? 0 : pass.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((unpass == null) ? 0 : unpass.hashCode());
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
		Student other = (Student) obj;
		if (ID == null) {
			if (other.ID != null)
				return false;
		} else if (!ID.equals(other.ID))
			return false;
		if (Username == null) {
			if (other.Username != null)
				return false;
		} else if (!Username.equals(other.Username))
			return false;
		if (pass == null) {
			if (other.pass != null)
				return false;
		} else if (!pass.equals(other.pass))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (unpass == null) {
			if (other.unpass != null)
				return false;
		} else if (!unpass.equals(other.unpass))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Student [Username=" + Username + ", password=" + password + ", ID=" + ID + ", pass=" + pass
				+ ", unpass=" + unpass + "]";
	}



}
