package com.lubo4551.www;

/**
 * DeclareInformationId entity. @author MyEclipse Persistence Tools
 */
public class DeclareInformationId extends AbstractDeclareInformationId
		implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public DeclareInformationId() {
	}

	/** full constructor */
	public DeclareInformationId(String unitSerialNumber, String unitName,
			String ename, String cardNo, String corporation, String property,
			String trade, String investment, String stuff, String business,
			String connectman, String tel, String fax, String email,
			String address, String zipCode, String introduction) {
		super(unitSerialNumber, unitName, ename, cardNo, corporation, property,
				trade, investment, stuff, business, connectman, tel, fax,
				email, address, zipCode, introduction);
	}

}
