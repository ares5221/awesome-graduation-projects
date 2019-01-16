package com.lubo4551.www;

/**
 * AbstractAccreditationInformation entity provides the base persistence
 * definition of the AccreditationInformation entity. @author MyEclipse
 * Persistence Tools
 */

public abstract class AbstractAccreditationInformation implements
		java.io.Serializable {

	// Fields

	private AccreditationInformationId id;

	// Constructors

	/** default constructor */
	public AbstractAccreditationInformation() {
	}

	/** full constructor */
	public AbstractAccreditationInformation(AccreditationInformationId id) {
		this.id = id;
	}

	// Property accessors

	public AccreditationInformationId getId() {
		return this.id;
	}

	public void setId(AccreditationInformationId id) {
		this.id = id;
	}

}