package com.imovie.service;

import java.math.BigDecimal;
import java.util.List;

import com.imovie.model.Level;
import com.imovie.model.User;

public interface UserService {

	public BigDecimal signupUser(String username,String age,String residence,String image,String gender,String bank,String accout,String password);
	
	public User loginUser(String userid,String password,String role);
	
	public User getRechargeRecordForUser(String userid);
	
	public boolean rechargeMemberinfo(String amount,User user);
	
	public void updateUser(User user);
	
	public User getUserByUserId(String userid);
	
	public List<User> searchUser(String search);
	
	public List<Level> getAllLevel();

	public int getMyRechargeAmount(String userId);
	
	public void checkStateForMemberinfo();
	
	public boolean stopQualifyForUser(User user);
	
	public void creditExchangeForUser(User user,String credit);
}
