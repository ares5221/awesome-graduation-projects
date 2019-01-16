package com.lubo4551.www;

/**
 * AbstractItemSetupId entity provides the base persistence definition of the
 * ItemSetupId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractItemSetupId implements java.io.Serializable {

	// Fields

	private String dateSerialNumber;
	private String declareBeginDate;
	private String declareFinishDate;
	private String accreditationBeginDate;
	private String accreditationFinishDate;

	// Constructors

	/** default constructor */
	public AbstractItemSetupId() {
	}

	/** full constructor */
	public AbstractItemSetupId(String dateSerialNumber,
			String declareBeginDate, String declareFinishDate,
			String accreditationBeginDate, String accreditationFinishDate) {
		this.dateSerialNumber = dateSerialNumber;
		this.declareBeginDate = declareBeginDate;
		this.declareFinishDate = declareFinishDate;
		this.accreditationBeginDate = accreditationBeginDate;
		this.accreditationFinishDate = accreditationFinishDate;
	}

	// Property accessors

	public String getDateSerialNumber() {
		return this.dateSerialNumber;
	}

	public void setDateSerialNumber(String dateSerialNumber) {
		this.dateSerialNumber = dateSerialNumber;
	}

	public String getDeclareBeginDate() {
		return this.declareBeginDate;
	}

	public void setDeclareBeginDate(String declareBeginDate) {
		this.declareBeginDate = declareBeginDate;
	}

	public String getDeclareFinishDate() {
		return this.declareFinishDate;
	}

	public void setDeclareFinishDate(String declareFinishDate) {
		this.declareFinishDate = declareFinishDate;
	}

	public String getAccreditationBeginDate() {
		return this.accreditationBeginDate;
	}

	public void setAccreditationBeginDate(String accreditationBeginDate) {
		this.accreditationBeginDate = accreditationBeginDate;
	}

	public String getAccreditationFinishDate() {
		return this.accreditationFinishDate;
	}

	public void setAccreditationFinishDate(String accreditationFinishDate) {
		this.accreditationFinishDate = accreditationFinishDate;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractItemSetupId))
			return false;
		AbstractItemSetupId castOther = (AbstractItemSetupId) other;

		return ((this.getDateSerialNumber() == castOther.getDateSerialNumber()) || (this
				.getDateSerialNumber() != null
				&& castOther.getDateSerialNumber() != null && this
				.getDateSerialNumber().equals(castOther.getDateSerialNumber())))
				&& ((this.getDeclareBeginDate() == castOther
						.getDeclareBeginDate()) || (this.getDeclareBeginDate() != null
						&& castOther.getDeclareBeginDate() != null && this
						.getDeclareBeginDate().equals(
								castOther.getDeclareBeginDate())))
				&& ((this.getDeclareFinishDate() == castOther
						.getDeclareFinishDate()) || (this
						.getDeclareFinishDate() != null
						&& castOther.getDeclareFinishDate() != null && this
						.getDeclareFinishDate().equals(
								castOther.getDeclareFinishDate())))
				&& ((this.getAccreditationBeginDate() == castOther
						.getAccreditationBeginDate()) || (this
						.getAccreditationBeginDate() != null
						&& castOther.getAccreditationBeginDate() != null && this
						.getAccreditationBeginDate().equals(
								castOther.getAccreditationBeginDate())))
				&& ((this.getAccreditationFinishDate() == castOther
						.getAccreditationFinishDate()) || (this
						.getAccreditationFinishDate() != null
						&& castOther.getAccreditationFinishDate() != null && this
						.getAccreditationFinishDate().equals(
								castOther.getAccreditationFinishDate())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getDateSerialNumber() == null ? 0 : this
						.getDateSerialNumber().hashCode());
		result = 37
				* result
				+ (getDeclareBeginDate() == null ? 0 : this
						.getDeclareBeginDate().hashCode());
		result = 37
				* result
				+ (getDeclareFinishDate() == null ? 0 : this
						.getDeclareFinishDate().hashCode());
		result = 37
				* result
				+ (getAccreditationBeginDate() == null ? 0 : this
						.getAccreditationBeginDate().hashCode());
		result = 37
				* result
				+ (getAccreditationFinishDate() == null ? 0 : this
						.getAccreditationFinishDate().hashCode());
		return result;
	}

}