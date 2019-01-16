package com.lubo4551.www;

/**
 * AbstractDistribute entity provides the base persistence definition of the
 * Distribute entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDistribute implements java.io.Serializable {

	// Fields

	private DistributeId id;

	// Constructors

	/** default constructor */
	public AbstractDistribute() {
	}

	/** full constructor */
	public AbstractDistribute(DistributeId id) {
		this.id = id;
	}

	// Property accessors

	public DistributeId getId() {
		return this.id;
	}

	public void setId(DistributeId id) {
		this.id = id;
	}

}