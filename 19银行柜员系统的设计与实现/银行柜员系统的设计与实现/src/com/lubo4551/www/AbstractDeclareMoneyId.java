package com.lubo4551.www;

/**
 * AbstractDeclareMoneyId entity provides the base persistence definition of the
 * DeclareMoneyId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareMoneyId implements java.io.Serializable {

	// Fields

	private String moneySerialNumber;
	private String itemSerialNumber;
	private String outItem;
	private String money;

	// Constructors

	/** default constructor */
	public AbstractDeclareMoneyId() {
	}

	/** full constructor */
	public AbstractDeclareMoneyId(String moneySerialNumber,
			String itemSerialNumber, String outItem, String money) {
		this.moneySerialNumber = moneySerialNumber;
		this.itemSerialNumber = itemSerialNumber;
		this.outItem = outItem;
		this.money = money;
	}

	// Property accessors

	public String getMoneySerialNumber() {
		return this.moneySerialNumber;
	}

	public void setMoneySerialNumber(String moneySerialNumber) {
		this.moneySerialNumber = moneySerialNumber;
	}

	public String getItemSerialNumber() {
		return this.itemSerialNumber;
	}

	public void setItemSerialNumber(String itemSerialNumber) {
		this.itemSerialNumber = itemSerialNumber;
	}

	public String getOutItem() {
		return this.outItem;
	}

	public void setOutItem(String outItem) {
		this.outItem = outItem;
	}

	public String getMoney() {
		return this.money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractDeclareMoneyId))
			return false;
		AbstractDeclareMoneyId castOther = (AbstractDeclareMoneyId) other;

		return ((this.getMoneySerialNumber() == castOther
				.getMoneySerialNumber()) || (this.getMoneySerialNumber() != null
				&& castOther.getMoneySerialNumber() != null && this
				.getMoneySerialNumber()
				.equals(castOther.getMoneySerialNumber())))
				&& ((this.getItemSerialNumber() == castOther
						.getItemSerialNumber()) || (this.getItemSerialNumber() != null
						&& castOther.getItemSerialNumber() != null && this
						.getItemSerialNumber().equals(
								castOther.getItemSerialNumber())))
				&& ((this.getOutItem() == castOther.getOutItem()) || (this
						.getOutItem() != null && castOther.getOutItem() != null && this
						.getOutItem().equals(castOther.getOutItem())))
				&& ((this.getMoney() == castOther.getMoney()) || (this
						.getMoney() != null && castOther.getMoney() != null && this
						.getMoney().equals(castOther.getMoney())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getMoneySerialNumber() == null ? 0 : this
						.getMoneySerialNumber().hashCode());
		result = 37
				* result
				+ (getItemSerialNumber() == null ? 0 : this
						.getItemSerialNumber().hashCode());
		result = 37 * result
				+ (getOutItem() == null ? 0 : this.getOutItem().hashCode());
		result = 37 * result
				+ (getMoney() == null ? 0 : this.getMoney().hashCode());
		return result;
	}

}