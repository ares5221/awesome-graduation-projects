package com.lubo4551.www;

/**
 * AbstractDeclareInformationId entity provides the base persistence definition
 * of the DeclareInformationId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareInformationId implements
		java.io.Serializable {

	// Fields

	private String unitSerialNumber;
	private String unitName;
	private String ename;
	private String cardNo;
	private String corporation;
	private String property;
	private String trade;
	private String investment;
	private String stuff;
	private String business;
	private String connectman;
	private String tel;
	private String fax;
	private String email;
	private String address;
	private String zipCode;
	private String introduction;

	// Constructors

	/** default constructor */
	public AbstractDeclareInformationId() {
	}

	/** full constructor */
	public AbstractDeclareInformationId(String unitSerialNumber,
			String unitName, String ename, String cardNo, String corporation,
			String property, String trade, String investment, String stuff,
			String business, String connectman, String tel, String fax,
			String email, String address, String zipCode, String introduction) {
		this.unitSerialNumber = unitSerialNumber;
		this.unitName = unitName;
		this.ename = ename;
		this.cardNo = cardNo;
		this.corporation = corporation;
		this.property = property;
		this.trade = trade;
		this.investment = investment;
		this.stuff = stuff;
		this.business = business;
		this.connectman = connectman;
		this.tel = tel;
		this.fax = fax;
		this.email = email;
		this.address = address;
		this.zipCode = zipCode;
		this.introduction = introduction;
	}

	// Property accessors

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

	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCorporation() {
		return this.corporation;
	}

	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}

	public String getProperty() {
		return this.property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public String getTrade() {
		return this.trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public String getInvestment() {
		return this.investment;
	}

	public void setInvestment(String investment) {
		this.investment = investment;
	}

	public String getStuff() {
		return this.stuff;
	}

	public void setStuff(String stuff) {
		this.stuff = stuff;
	}

	public String getBusiness() {
		return this.business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getConnectman() {
		return this.connectman;
	}

	public void setConnectman(String connectman) {
		this.connectman = connectman;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
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

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractDeclareInformationId))
			return false;
		AbstractDeclareInformationId castOther = (AbstractDeclareInformationId) other;

		return ((this.getUnitSerialNumber() == castOther.getUnitSerialNumber()) || (this
				.getUnitSerialNumber() != null
				&& castOther.getUnitSerialNumber() != null && this
				.getUnitSerialNumber().equals(castOther.getUnitSerialNumber())))
				&& ((this.getUnitName() == castOther.getUnitName()) || (this
						.getUnitName() != null
						&& castOther.getUnitName() != null && this
						.getUnitName().equals(castOther.getUnitName())))
				&& ((this.getEname() == castOther.getEname()) || (this
						.getEname() != null && castOther.getEname() != null && this
						.getEname().equals(castOther.getEname())))
				&& ((this.getCardNo() == castOther.getCardNo()) || (this
						.getCardNo() != null && castOther.getCardNo() != null && this
						.getCardNo().equals(castOther.getCardNo())))
				&& ((this.getCorporation() == castOther.getCorporation()) || (this
						.getCorporation() != null
						&& castOther.getCorporation() != null && this
						.getCorporation().equals(castOther.getCorporation())))
				&& ((this.getProperty() == castOther.getProperty()) || (this
						.getProperty() != null
						&& castOther.getProperty() != null && this
						.getProperty().equals(castOther.getProperty())))
				&& ((this.getTrade() == castOther.getTrade()) || (this
						.getTrade() != null && castOther.getTrade() != null && this
						.getTrade().equals(castOther.getTrade())))
				&& ((this.getInvestment() == castOther.getInvestment()) || (this
						.getInvestment() != null
						&& castOther.getInvestment() != null && this
						.getInvestment().equals(castOther.getInvestment())))
				&& ((this.getStuff() == castOther.getStuff()) || (this
						.getStuff() != null && castOther.getStuff() != null && this
						.getStuff().equals(castOther.getStuff())))
				&& ((this.getBusiness() == castOther.getBusiness()) || (this
						.getBusiness() != null
						&& castOther.getBusiness() != null && this
						.getBusiness().equals(castOther.getBusiness())))
				&& ((this.getConnectman() == castOther.getConnectman()) || (this
						.getConnectman() != null
						&& castOther.getConnectman() != null && this
						.getConnectman().equals(castOther.getConnectman())))
				&& ((this.getTel() == castOther.getTel()) || (this.getTel() != null
						&& castOther.getTel() != null && this.getTel().equals(
						castOther.getTel())))
				&& ((this.getFax() == castOther.getFax()) || (this.getFax() != null
						&& castOther.getFax() != null && this.getFax().equals(
						castOther.getFax())))
				&& ((this.getEmail() == castOther.getEmail()) || (this
						.getEmail() != null && castOther.getEmail() != null && this
						.getEmail().equals(castOther.getEmail())))
				&& ((this.getAddress() == castOther.getAddress()) || (this
						.getAddress() != null && castOther.getAddress() != null && this
						.getAddress().equals(castOther.getAddress())))
				&& ((this.getZipCode() == castOther.getZipCode()) || (this
						.getZipCode() != null && castOther.getZipCode() != null && this
						.getZipCode().equals(castOther.getZipCode())))
				&& ((this.getIntroduction() == castOther.getIntroduction()) || (this
						.getIntroduction() != null
						&& castOther.getIntroduction() != null && this
						.getIntroduction().equals(castOther.getIntroduction())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getUnitSerialNumber() == null ? 0 : this
						.getUnitSerialNumber().hashCode());
		result = 37 * result
				+ (getUnitName() == null ? 0 : this.getUnitName().hashCode());
		result = 37 * result
				+ (getEname() == null ? 0 : this.getEname().hashCode());
		result = 37 * result
				+ (getCardNo() == null ? 0 : this.getCardNo().hashCode());
		result = 37
				* result
				+ (getCorporation() == null ? 0 : this.getCorporation()
						.hashCode());
		result = 37 * result
				+ (getProperty() == null ? 0 : this.getProperty().hashCode());
		result = 37 * result
				+ (getTrade() == null ? 0 : this.getTrade().hashCode());
		result = 37
				* result
				+ (getInvestment() == null ? 0 : this.getInvestment()
						.hashCode());
		result = 37 * result
				+ (getStuff() == null ? 0 : this.getStuff().hashCode());
		result = 37 * result
				+ (getBusiness() == null ? 0 : this.getBusiness().hashCode());
		result = 37
				* result
				+ (getConnectman() == null ? 0 : this.getConnectman()
						.hashCode());
		result = 37 * result
				+ (getTel() == null ? 0 : this.getTel().hashCode());
		result = 37 * result
				+ (getFax() == null ? 0 : this.getFax().hashCode());
		result = 37 * result
				+ (getEmail() == null ? 0 : this.getEmail().hashCode());
		result = 37 * result
				+ (getAddress() == null ? 0 : this.getAddress().hashCode());
		result = 37 * result
				+ (getZipCode() == null ? 0 : this.getZipCode().hashCode());
		result = 37
				* result
				+ (getIntroduction() == null ? 0 : this.getIntroduction()
						.hashCode());
		return result;
	}

}