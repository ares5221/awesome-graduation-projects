package common.transaction;

import org.hibernate.Session;

import common.util.HibernateSessionFactory;

public class HibernateTransaction implements Transaction {
	private org.hibernate.Transaction transaction;

	public void beginTransaction() {
		Session session = HibernateSessionFactory.getSession();
		transaction = session.beginTransaction();
	}

	public void commit() {
		if (transaction != null)
			transaction.commit();
	}

	public void rollback() {
		if (transaction != null)
			transaction.rollback();
	}
}
