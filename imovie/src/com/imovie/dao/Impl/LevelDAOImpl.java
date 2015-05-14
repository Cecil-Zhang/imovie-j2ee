package com.imovie.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.LevelDAO;
import com.imovie.model.Level;

@Repository
public class LevelDAOImpl extends BaseDAOImpl implements LevelDAO {

	@Override
	public float getDiscountByCredit(Integer credit) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="select l.discount from Level l where l.upperLimit>"+credit+" and l.lowerLimit<="+credit;
		Query q=session.createQuery(hql);
		Float discount=(Float) q.uniqueResult();
		return discount.floatValue();
	}

	@Override
	public List<Level> getAllLevel() {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="from Level";
		Query q=session.createQuery(hql);
		List<Level> list=q.list();
		return list;
	}

}
