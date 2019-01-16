package com.lubo4551.www;

/**
 * AbstractOverallLog entity provides the base persistence definition of the
 * OverallLog entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractOverallLog implements java.io.Serializable {

	// Fields

	private OverallLogId id;

	// Constructors

	/** default constructor */
	public AbstractOverallLog() {
	}

	/** full constructor */
	public AbstractOverallLog(OverallLogId id) {
		this.id = id;
	}

	// Property accessors

	public OverallLogId getId() {
		return this.id;
	}

	public void setId(OverallLogId id) {
		this.id = id;
	}

}