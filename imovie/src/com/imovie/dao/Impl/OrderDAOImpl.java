package com.imovie.dao.Impl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.OrderDAO;
import com.imovie.model.Order;

@Repository
public class OrderDAOImpl extends BaseDAOImpl implements OrderDAO {

	@Override
	public Integer save(Order order) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer id=(Integer) session.save(order);
		return id;
	}

	@Override
	public Order getOrderWithPlanByOrderId(Integer id) {
		// TODO Auto-generated method stub
		String hql="from Order o left join fetch o.purchaseMovie where orderId='"+id+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		Order order=(Order) q.uniqueResult();
		return order;
	}

	@Override
	public List<Order> getOrderByUserid(BigDecimal id) {
		// TODO Auto-generated method stub
		String hql="from Order o left join fetch o.purchaseMovie m left join fetch m.movie where userId='"+id+"' order by o.purchaseTime desc";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Order> list=(List<Order>) q.list();
		return list;
	}

	@Override
	public Order getOrderByOrderId(Integer id) {
		// TODO Auto-generated method stub
		String hql="from Order o where orderId="+id;
		Session session=getSession();
		Query q=session.createQuery(hql);
		Order order=(Order) q.uniqueResult();
		return order;
	}

	@Override
	public List<Object[]> orderStaticByMonth() {
		// TODO Auto-generated method stub
		String hql="select monthname(purchaseTime),sum(orderPrice) from Order where year(purchaseTime)=year(current_date()) group by year(purchaseTime),month(purchaseTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> activityJoinStaticByMonth() {
		// TODO Auto-generated method stub
		String hql="select monthname(purchaseTime),count(*) from Order where year(purchaseTime)=year(current_date()) and orderState=true group by year(purchaseTime),month(purchaseTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> purchaseWithCardStatic() {
		// TODO Auto-generated method stub
		String hql="select monthname(purchaseTime),sum(orderPrice) from Order where year(purchaseTime)=year(current_date()) and userId is not null group by year(purchaseTime),month(purchaseTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> purchaseWithCashStatic() {
		// TODO Auto-generated method stub
		String hql="select monthname(purchaseTime),sum(orderPrice) from Order where year(purchaseTime)=year(current_date()) and userId is null group by year(purchaseTime),month(purchaseTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

}
