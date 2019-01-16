package com.lubo4551.www;

/**
 * AbstractDeclareLogon entity provides the base persistence definition of the
 * DeclareLogon entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareLogon implements java.io.Serializable {

	// Fields

	private DeclareLogonId id;

	// Constructors

	/** default constructor */
	public AbstractDeclareLogon() {
	}

	/** full constructor */
	public AbstractDeclareLogon(DeclareLogonId id) {
		this.id = id;
	}

	// Property accessors

	public DeclareLogonId getId() {
		return this.id;
	}

	public void setId(DeclareLogonId id) {
		this.id = id;
	}

}