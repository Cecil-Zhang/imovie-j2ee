package com.imovie.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.RechargeDAO;
import com.imovie.model.Recharge;

@Repository
public class RechargeDAOImpl extends BaseDAOImpl implements RechargeDAO {

	@Override
	public Integer save(Recharge re) {
		// TODO Auto-generated method stub
		Session session=getSession();
		return (Integer) session.save(re);
	}

	@Override
	public List<Object[]> rechargeStaticByMonth() {
		// TODO Auto-generated method stub
		String hql="select monthname(rechargeTime),sum(amount) from Recharge where year(rechargeTime)=year(current_date()) group by year(rechargeTime),month(rechargeTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

}
