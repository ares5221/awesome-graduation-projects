package com.lubo4551.www;

/**
 * AbstractDeclareInformation entity provides the base persistence definition of
 * the DeclareInformation entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareInformation implements
		java.io.Serializable {

	// Fields

	private DeclareInformationId id;

	// Constructors

	/** default constructor */
	public AbstractDeclareInformation() {
	}

	/** full constructor */
	public AbstractDeclareInformation(DeclareInformationId id) {
		this.id = id;
	}

	// Property accessors

	public DeclareInformationId getId() {
		return this.id;
	}

	public void setId(DeclareInformationId id) {
		this.id = id;
	}

}