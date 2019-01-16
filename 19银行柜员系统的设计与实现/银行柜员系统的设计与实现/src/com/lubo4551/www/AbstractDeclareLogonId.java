package com.lubo4551.www;

/**
 * AbstractDeclareLogonId entity provides the base persistence definition of the
 * DeclareLogonId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareLogonId implements java.io.Serializable {

	// Fields

	private String unitSerialNumber;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractDeclareLogonId() {
	}

	/** full constructor */
	public AbstractDeclareLogonId(String unitSerialNumber, String password) {
		this.unitSerialNumber = unitSerialNumber;
		this.password = password;
	}

	// Property accessors

	public String getUnitSerialNumber() {
		return this.unitSerialNumber;
	}

	public void setUnitSerialNumber(String unitSerialNumber) {
		this.unitSerialNumber = unitSerialNumber;
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
		if (!(other instanceof AbstractDeclareLogonId))
			return false;
		AbstractDeclareLogonId castOther = (AbstractDeclareLogonId) other;

		return ((this.getUnitSerialNumber() == castOther.getUnitSerialNumber()) || (this
				.getUnitSerialNumber() != null
				&& castOther.getUnitSerialNumber() != null && this
				.getUnitSerialNumber().equals(castOther.getUnitSerialNumber())))
				&& ((this.getPassword() == castOther.getPassword()) || (this
						.getPassword() != null
						&& castOther.getPassword() != null && this
						.getPassword().equals(castOther.getPassword())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getUnitSerialNumber() == null ? 0 : this
						.getUnitSerialNumber().hashCode());
		result = 37 * result
				+ (getPassword() == null ? 0 : this.getPassword().hashCode());
		return result;
	}

}