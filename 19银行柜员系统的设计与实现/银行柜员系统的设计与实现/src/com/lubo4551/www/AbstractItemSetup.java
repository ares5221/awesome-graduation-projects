package com.lubo4551.www;

/**
 * AbstractItemSetup entity provides the base persistence definition of the
 * ItemSetup entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractItemSetup implements java.io.Serializable {

	// Fields

	private ItemSetupId id;

	// Constructors

	/** default constructor */
	public AbstractItemSetup() {
	}

	/** full constructor */
	public AbstractItemSetup(ItemSetupId id) {
		this.id = id;
	}

	// Property accessors

	public ItemSetupId getId() {
		return this.id;
	}

	public void setId(ItemSetupId id) {
		this.id = id;
	}

}