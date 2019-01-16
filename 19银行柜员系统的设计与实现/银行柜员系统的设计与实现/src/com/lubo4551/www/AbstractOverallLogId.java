package com.lubo4551.www;

/**
 * AbstractOverallLogId entity provides the base persistence definition of the
 * OverallLogId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOverallLogId implements java.io.Serializable {

	// Fields

	private String adminSerialNumber;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractOverallLogId() {
	}

	/** full constructor */
	public AbstractOverallLogId(String adminSerialNumber, String password) {
		this.adminSerialNumber = adminSerialNumber;
		this.password = password;
	}

	// Property accessors

	public String getAdminSerialNumber() {
		return this.adminSerialNumber;
	}

	public void setAdminSerialNumber(String adminSerialNumber) {
		this.adminSerialNumber = adminSerialNumber;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractOverallLogId))
			return false;
		AbstractOverallLogId castOther = (AbstractOverallLogId) other;

		return ((this.getAdminSerialNumber() == castOther
				.getAdminSerialNumber()) || (this.getAdminSerialNumber() != null
				&& castOther.getAdminSerialNumber() != null && this
				.getAdminSerialNumber()
				.equals(castOther.getAdminSerialNumber())))
				&& ((this.getPassword() == castOther.getPassword()) || (this
						.getPassword() != null
						&& castOther.getPassword() != null && this
						.getPassword().equals(castOther.getPassword())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getAdminSerialNumber() == null ? 0 : this
						.getAdminSerialNumber().hashCode());
		result = 37 * result
				+ (getPassword() == null ? 0 : this.getPassword().hashCode());
		return result;
	}

}