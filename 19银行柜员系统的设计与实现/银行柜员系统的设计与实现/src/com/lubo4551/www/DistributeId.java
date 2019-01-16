package com.lubo4551.www;

/**
 * DistributeId entity. @author MyEclipse Persistence Tools
 */
public class DistributeId extends AbstractDistributeId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public DistributeId() {
	}

	/** minimal constructor */
	public DistributeId(String itemSerialNumber) {
		super(itemSerialNumber);
	}

	/** full constructor */
	public DistributeId(String itemSerialNumber, String itemName,
			String identitySerialNumber, String expertName, String scoreZero,
			String scoreOne, String scoreTwo, String scoreThree,
			String scoreFour, String scoreFive, String scoreSix, String mind,
			String expertMind) {
		super(itemSerialNumber, itemName, identitySerialNumber, expertName,
				scoreZero, scoreOne, scoreTwo, scoreThree, scoreFour,
				scoreFive, scoreSix, mind, expertMind);
	}

}
