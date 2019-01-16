package com.lubo4551.www;

import org.hibernate.Session;


/**
 * Data access object (DatabaseAccessObject) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDatabaseAccessObject implements IBaseHibernateDatabaseAccessObject {
	
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
}