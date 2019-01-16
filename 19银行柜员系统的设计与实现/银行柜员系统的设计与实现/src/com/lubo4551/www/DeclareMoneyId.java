package com.lubo4551.www;

/**
 * DeclareMoneyId entity. @author MyEclipse Persistence Tools
 */
public class DeclareMoneyId extends AbstractDeclareMoneyId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public DeclareMoneyId() {
	}

	/** full constructor */
	public DeclareMoneyId(String moneySerialNumber, String itemSerialNumber,
			String outItem, String money) {
		super(moneySerialNumber, itemSerialNumber, outItem, money);
	}

}
