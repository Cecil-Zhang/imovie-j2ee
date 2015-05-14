package com.imovie.dao;

import java.math.BigDecimal;
import java.util.List;

import com.imovie.model.Order;

public interface OrderDAO {

	public Integer save(Order order);
	
	public Order getOrderWithPlanByOrderId(Integer id);
	
	public List<Order> getOrderByUserid(BigDecimal id);
	
	public Order getOrderByOrderId(Integer id);
	
	public List<Object[]> orderStaticByMonth();
	
	public List<Object[]> activityJoinStaticByMonth();
	
	public List<Object[]> purchaseWithCardStatic();
	
	public List<Object[]> purchaseWithCashStatic();
	
}
