package com.lubo4551.www;

/**
 * AbstractAccreditationLog entity provides the base persistence definition of
 * the AccreditationLog entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAccreditationLog implements java.io.Serializable {

	// Fields

	private AccreditationLogId id;

	// Constructors

	/** default constructor */
	public AbstractAccreditationLog() {
	}

	/** full constructor */
	public AbstractAccreditationLog(AccreditationLogId id) {
		this.id = id;
	}

	// Property accessors

	public AccreditationLogId getId() {
		return this.id;
	}

	public void setId(AccreditationLogId id) {
		this.id = id;
	}

}