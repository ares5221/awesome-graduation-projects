package com.lubo4551.www;

import org.hibernate.Session;


/**
 * Data access interface for domain model
 * @author MyEclipse Persistence Tools
 */
public interface IBaseHibernateDatabaseAccessObject {
	public Session getSession();
}