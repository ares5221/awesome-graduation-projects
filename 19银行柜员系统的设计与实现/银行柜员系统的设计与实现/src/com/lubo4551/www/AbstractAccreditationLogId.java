package com.lubo4551.www;

/**
 * AbstractAccreditationLogId entity provides the base persistence definition of
 * the AccreditationLogId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAccreditationLogId implements
		java.io.Serializable {

	// Fields

	private String identitySerialNumber;
	private String expertName;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractAccreditationLogId() {
	}

	/** full constructor */
	public AbstractAccreditationLogId(String identitySerialNumber,
			String expertName, String password) {
		this.identitySerialNumber = identitySerialNumber;
		this.expertName = expertName;
		this.password = password;
	}

	// Property accessors

	public String getIdentitySerialNumber() {
		return this.identitySerialNumber;
	}

	public void setIdentitySerialNumber(String identitySerialNumber) {
		this.identitySerialNumber = identitySerialNumber;
	}

	public String getExpertName() {
		return this.expertName;
	}

	public void setExpertName(String expertName) {
		this.expertName = expertName;
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
		if (!(other instanceof AbstractAccreditationLogId))
			return false;
		AbstractAccreditationLogId castOther = (AbstractAccreditationLogId) other;

		return ((this.getIdentitySerialNumber() == castOther
				.getIdentitySerialNumber()) || (this.getIdentitySerialNumber() != null
				&& castOther.getIdentitySerialNumber() != null && this
				.getIdentitySerialNumber().equals(
						castOther.getIdentitySerialNumber())))
				&& ((this.getExpertName() == castOther.getExpertName()) || (this
						.getExpertName() != null
						&& castOther.getExpertName() != null && this
						.getExpertName().equals(castOther.getExpertName())))
				&& ((this.getPassword() == castOther.getPassword()) || (this
						.getPassword() != null
						&& castOther.getPassword() != null && this
						.getPassword().equals(castOther.getPassword())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getIdentitySerialNumber() == null ? 0 : this
						.getIdentitySerialNumber().hashCode());
		result = 37
				* result
				+ (getExpertName() == null ? 0 : this.getExpertName()
						.hashCode());
		result = 37 * result
				+ (getPassword() == null ? 0 : this.getPassword().hashCode());
		return result;
	}

}