package com.imovie.dao;

import java.math.BigDecimal;
import java.util.List;

import com.imovie.model.User;

public interface UserDAO {

	public BigDecimal save(User user);
	
	public User getUserByUserId(BigDecimal userid);
	
	public User getUserRechargeListByUserId(BigDecimal userid);
	
	public User login(BigDecimal userid,String password,String role);
	
	public void update(User user);
	
	public List<User> searchByIdAndName(String search);
}
