package com.lubo4551.www;

/**
 * AbstractAccreditationInformationId entity provides the base persistence
 * definition of the AccreditationInformationId entity. @author MyEclipse
 * Persistence Tools
 */

public abstract class AbstractAccreditationInformationId implements
		java.io.Serializable {

	// Fields

	private String identitySerialNumber;
	private String expertName;
	private String sex;
	private String birthdayDate;
	private String unitSerialNumber;
	private String unitName;
	private String grade;
	private String domain;
	private String sortOne;
	private String sortTwo;
	private String email;
	private String address;
	private String zipCode;
	private String telephone;
	private String introduction;
	private String pass;
	private String name;

	// Constructors

	/** default constructor */
	public AbstractAccreditationInformationId() {
	}

	/** full constructor */
	public AbstractAccreditationInformationId(String identitySerialNumber,
			String expertName, String sex, String birthdayDate,
			String unitSerialNumber, String unitName, String grade,
			String domain, String sortOne, String sortTwo, String email,
			String address, String zipCode, String telephone,
			String introduction, String pass, String name) {
		this.identitySerialNumber = identitySerialNumber;
		this.expertName = expertName;
		this.sex = sex;
		this.birthdayDate = birthdayDate;
		this.unitSerialNumber = unitSerialNumber;
		this.unitName = unitName;
		this.grade = grade;
		this.domain = domain;
		this.sortOne = sortOne;
		this.sortTwo = sortTwo;
		this.email = email;
		this.address = address;
		this.zipCode = zipCode;
		this.telephone = telephone;
		this.introduction = introduction;
		this.pass = pass;
		this.name = name;
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

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthdayDate() {
		return this.birthdayDate;
	}

	public void setBirthdayDate(String birthdayDate) {
		this.birthdayDate = birthdayDate;
	}

	public String getUnitSerialNumber() {
		return this.unitSerialNumber;
	}

	public void setUnitSerialNumber(String unitSerialNumber) {
		this.unitSerialNumber = unitSerialNumber;
	}

	public String getUnitName() {
		return this.unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDomain() {
		return this.domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getSortOne() {
		return this.sortOne;
	}

	public void setSortOne(String sortOne) {
		this.sortOne = sortOne;
	}

	public String getSortTwo() {
		return this.sortTwo;
	}

	public void setSortTwo(String sortTwo) {
		this.sortTwo = sortTwo;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipCode() {
		return this.zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractAccreditationInformationId))
			return false;
		AbstractAccreditationInformationId castOther = (AbstractAccreditationInformationId) other;

		return ((this.getIdentitySerialNumber() == castOther
				.getIdentitySerialNumber()) || (this.getIdentitySerialNumber() != null
				&& castOther.getIdentitySerialNumber() != null && this
				.getIdentitySerialNumber().equals(
						castOther.getIdentitySerialNumber())))
				&& ((this.getExpertName() == castOther.getExpertName()) || (this
						.getExpertName() != null
						&& castOther.getExpertName() != null && this
						.getExpertName().equals(castOther.getExpertName())))
				&& ((this.getSex() == castOther.getSex()) || (this.getSex() != null
						&& castOther.getSex() != null && this.getSex().equals(
						castOther.getSex())))
				&& ((this.getBirthdayDate() == castOther.getBirthdayDate()) || (this
						.getBirthdayDate() != null
						&& castOther.getBirthdayDate() != null && this
						.getBirthdayDate().equals(castOther.getBirthdayDate())))
				&& ((this.getUnitSerialNumber() == castOther
						.getUnitSerialNumber()) || (this.getUnitSerialNumber() != null
						&& castOther.getUnitSerialNumber() != null && this
						.getUnitSerialNumber().equals(
								castOther.getUnitSerialNumber())))
				&& ((this.getUnitName() == castOther.getUnitName()) || (this
						.getUnitName() != null
						&& castOther.getUnitName() != null && this
						.getUnitName().equals(castOther.getUnitName())))
				&& ((this.getGrade() == castOther.getGrade()) || (this
						.getGrade() != null && castOther.getGrade() != null && this
						.getGrade().equals(castOther.getGrade())))
				&& ((this.getDomain() == castOther.getDomain()) || (this
						.getDomain() != null && castOther.getDomain() != null && this
						.getDomain().equals(castOther.getDomain())))
				&& ((this.getSortOne() == castOther.getSortOne()) || (this
						.getSortOne() != null && castOther.getSortOne() != null && this
						.getSortOne().equals(castOther.getSortOne())))
				&& ((this.getSortTwo() == castOther.getSortTwo()) || (this
						.getSortTwo() != null && castOther.getSortTwo() != null && this
						.getSortTwo().equals(castOther.getSortTwo())))
				&& ((this.getEmail() == castOther.getEmail()) || (this
						.getEmail() != null && castOther.getEmail() != null && this
						.getEmail().equals(castOther.getEmail())))
				&& ((this.getAddress() == castOther.getAddress()) || (this
						.getAddress() != null && castOther.getAddress() != null && this
						.getAddress().equals(castOther.getAddress())))
				&& ((this.getZipCode() == castOther.getZipCode()) || (this
						.getZipCode() != null && castOther.getZipCode() != null && this
						.getZipCode().equals(castOther.getZipCode())))
				&& ((this.getTelephone() == castOther.getTelephone()) || (this
						.getTelephone() != null
						&& castOther.getTelephone() != null && this
						.getTelephone().equals(castOther.getTelephone())))
				&& ((this.getIntroduction() == castOther.getIntroduction()) || (this
						.getIntroduction() != null
						&& castOther.getIntroduction() != null && this
						.getIntroduction().equals(castOther.getIntroduction())))
				&& ((this.getPass() == castOther.getPass()) || (this.getPass() != null
						&& castOther.getPass() != null && this.getPass()
						.equals(castOther.getPass())))
				&& ((this.getName() == castOther.getName()) || (this.getName() != null
						&& castOther.getName() != null && this.getName()
						.equals(castOther.getName())));
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
				+ (getSex() == null ? 0 : this.getSex().hashCode());
		result = 37
				* result
				+ (getBirthdayDate() == null ? 0 : this.getBirthdayDate()
						.hashCode());
		result = 37
				* result
				+ (getUnitSerialNumber() == null ? 0 : this
						.getUnitSerialNumber().hashCode());
		result = 37 * result
				+ (getUnitName() == null ? 0 : this.getUnitName().hashCode());
		result = 37 * result
				+ (getGrade() == null ? 0 : this.getGrade().hashCode());
		result = 37 * result
				+ (getDomain() == null ? 0 : this.getDomain().hashCode());
		result = 37 * result
				+ (getSortOne() == null ? 0 : this.getSortOne().hashCode());
		result = 37 * result
				+ (getSortTwo() == null ? 0 : this.getSortTwo().hashCode());
		result = 37 * result
				+ (getEmail() == null ? 0 : this.getEmail().hashCode());
		result = 37 * result
				+ (getAddress() == null ? 0 : this.getAddress().hashCode());
		result = 37 * result
				+ (getZipCode() == null ? 0 : this.getZipCode().hashCode());
		result = 37 * result
				+ (getTelephone() == null ? 0 : this.getTelephone().hashCode());
		result = 37
				* result
				+ (getIntroduction() == null ? 0 : this.getIntroduction()
						.hashCode());
		result = 37 * result
				+ (getPass() == null ? 0 : this.getPass().hashCode());
		result = 37 * result
				+ (getName() == null ? 0 : this.getName().hashCode());
		return result;
	}

}