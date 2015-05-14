package com.imovie.dao;

import java.util.List;

import com.imovie.model.Recharge;

public interface RechargeDAO {

	public Integer save(Recharge re);
	
	public List<Object[]> rechargeStaticByMonth();
}
