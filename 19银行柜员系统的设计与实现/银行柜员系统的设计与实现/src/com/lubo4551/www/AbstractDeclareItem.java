package com.lubo4551.www;

/**
 * AbstractDeclareItem entity provides the base persistence definition of the
 * DeclareItem entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareItem implements java.io.Serializable {

	// Fields

	private DeclareItemId id;

	// Constructors

	/** default constructor */
	public AbstractDeclareItem() {
	}

	/** full constructor */
	public AbstractDeclareItem(DeclareItemId id) {
		this.id = id;
	}

	// Property accessors

	public DeclareItemId getId() {
		return this.id;
	}

	public void setId(DeclareItemId id) {
		this.id = id;
	}

}