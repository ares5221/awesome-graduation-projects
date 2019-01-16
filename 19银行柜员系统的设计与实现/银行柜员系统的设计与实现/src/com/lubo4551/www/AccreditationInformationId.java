package com.lubo4551.www;

/**
 * AccreditationInformationId entity. @author MyEclipse Persistence Tools
 */
public class AccreditationInformationId extends
		AbstractAccreditationInformationId implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public AccreditationInformationId() {
	}

	/** full constructor */
	public AccreditationInformationId(String identitySerialNumber,
			String expertName, String sex, String birthdayDate,
			String unitSerialNumber, String unitName, String grade,
			String domain, String sortOne, String sortTwo, String email,
			String address, String zipCode, String telephone,
			String introduction, String pass, String name) {
		super(identitySerialNumber, expertName, sex, birthdayDate,
				unitSerialNumber, unitName, grade, domain, sortOne, sortTwo,
				email, address, zipCode, telephone, introduction, pass, name);
	}

}
