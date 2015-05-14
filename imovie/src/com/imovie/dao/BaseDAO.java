package com.imovie.dao;

import java.util.List;

import org.hibernate.Session;


public interface BaseDAO {

	public Session getSession();

	public Session getNewSession();
	
	public void flush();

	public void clear() ;

}
