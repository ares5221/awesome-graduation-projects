package com.wy.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class ObjectDao extends HibernateDaoSupport {

	// condition为条件，查询一组数据，该方法的返回类型为Object
	public Object getObjectForm(String condition) {
		List list = null;
		Object object = null;
		try {
			list = getHibernateTemplate().find(condition);
			if (list.size() == 1) {
				object = (Object) list.get(0);
			}
		} catch (DataAccessException ex) {
			ex.printStackTrace();
		}
		return object;
	}

	// condition为条件，查询多组数据，该方法的返回类型为List
	public List getObjectList(String condition) {
		List list = null;
		try {
			list = getHibernateTemplate().find(condition);		
		} catch (DataAccessException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	// 修改一组数据，该方法的返回类型为boolean
	public boolean updateObjectForm(Object object) {
		boolean flag = false;
		try {
			getHibernateTemplate().update(object);
			flag = true;
		} catch (DataAccessException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	// 添加一组数据，该方法的返回类型为boolean
	public void insertObjectForm(Object object) {
		try {
		
			getHibernateTemplate().save(object);	
			
		} catch (DataAccessException ex) {
			ex.printStackTrace();

		}
		
	}

	// 删除一组数据，该方法的返回类型为boolean
	public boolean deleteObjectForm(Object object) {
		try {
			getHibernateTemplate().delete(object);
			return true;
		} catch (DataAccessException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
