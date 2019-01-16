package com.lubo4551.www;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DatabaseAccessObject) providing persistence and search support for
 * Distribute entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.lubo4551.www.Distribute
 * @author MyEclipse Persistence Tools
 */
public class DistributeDatabaseAccessObject extends BaseHibernateDatabaseAccessObject {
	private static final Logger log = LoggerFactory
			.getLogger(DistributeDatabaseAccessObject.class);

	// property constants

	public void save(Distribute transientInstance) {
		log.debug("saving Distribute instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Distribute persistentInstance) {
		log.debug("deleting Distribute instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Distribute findById(com.lubo4551.www.DistributeId id) {
		log.debug("getting Distribute instance with id: " + id);
		try {
			Distribute instance = (Distribute) getSession().get(
					"com.lubo4551.www.Distribute", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Distribute instance) {
		log.debug("finding Distribute instance by example");
		try {
			List results = getSession()
					.createCriteria("com.lubo4551.www.Distribute")
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
		log.debug("finding Distribute instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Distribute as model where model."
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
		log.debug("finding all Distribute instances");
		try {
			String queryString = "from Distribute";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Distribute merge(Distribute detachedInstance) {
		log.debug("merging Distribute instance");
		try {
			Distribute result = (Distribute) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Distribute instance) {
		log.debug("attaching dirty Distribute instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Distribute instance) {
		log.debug("attaching clean Distribute instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}