package com.lubo4551.www;

/**
 * ItemSetupId entity. @author MyEclipse Persistence Tools
 */
public class ItemSetupId extends AbstractItemSetupId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ItemSetupId() {
	}

	/** full constructor */
	public ItemSetupId(String dateSerialNumber, String declareBeginDate,
			String declareFinishDate, String accreditationBeginDate,
			String accreditationFinishDate) {
		super(dateSerialNumber, declareBeginDate, declareFinishDate,
				accreditationBeginDate, accreditationFinishDate);
	}

}
