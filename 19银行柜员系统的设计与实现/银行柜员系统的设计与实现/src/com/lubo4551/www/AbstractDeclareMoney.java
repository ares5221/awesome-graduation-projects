package com.lubo4551.www;

/**
 * AbstractDeclareMoney entity provides the base persistence definition of the
 * DeclareMoney entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareMoney implements java.io.Serializable {

	// Fields

	private DeclareMoneyId id;

	// Constructors

	/** default constructor */
	public AbstractDeclareMoney() {
	}

	/** full constructor */
	public AbstractDeclareMoney(DeclareMoneyId id) {
		this.id = id;
	}

	// Property accessors

	public DeclareMoneyId getId() {
		return this.id;
	}

	public void setId(DeclareMoneyId id) {
		this.id = id;
	}

}