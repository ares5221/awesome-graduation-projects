package common.transaction;

public interface Transaction {
	void beginTransaction();

	void commit();

	void rollback();
}
