package com.lubo4551.www;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DatabaseAccessObject) providing persistence and search support for
 * DeclareMoney entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.lubo4551.www.DeclareMoney
 * @author MyEclipse Persistence Tools
 */
public class DeclareMoneyDatabaseAccessObject extends BaseHibernateDatabaseAccessObject {
	private static final Logger log = LoggerFactory
			.getLogger(DeclareMoneyDatabaseAccessObject.class);

	// property constants

	public void save(DeclareMoney transientInstance) {
		log.debug("saving DeclareMoney instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(DeclareMoney persistentInstance) {
		log.debug("deleting DeclareMoney instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public DeclareMoney findById(com.lubo4551.www.DeclareMoneyId id) {
		log.debug("getting DeclareMoney instance with id: " + id);
		try {
			DeclareMoney instance = (DeclareMoney) getSession().get(
					"com.lubo4551.www.DeclareMoney", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(DeclareMoney instance) {
		log.debug("finding DeclareMoney instance by example");
		try {
			List results = getSession()
					.createCriteria("com.lubo4551.www.DeclareMoney")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding DeclareMoney instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from DeclareMoney as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all DeclareMoney instances");
		try {
			String queryString = "from DeclareMoney";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public DeclareMoney merge(DeclareMoney detachedInstance) {
		log.debug("merging DeclareMoney instance");
		try {
			DeclareMoney result = (DeclareMoney) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(DeclareMoney instance) {
		log.debug("attaching dirty DeclareMoney instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(DeclareMoney instance) {
		log.debug("attaching clean DeclareMoney instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}