package com.imovie.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imovie.dao.BaseDAO;

@Repository
public class BaseDAOImpl implements BaseDAO {
	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Session getNewSession() {
		// TODO Auto-generated method stub
		return sessionFactory.openSession();
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		getSession().flush();
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		getSession().clear();
	}

}
