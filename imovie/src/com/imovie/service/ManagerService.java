package com.imovie.service;

import java.util.HashMap;


public interface ManagerService {

	public HashMap<String,Integer> ageStatic();
	
	public HashMap<String,Integer> genderStatic();
	
	public HashMap<String,Integer> residenceStatic();
	
	public HashMap<String,Integer> consumptionStatic();
	
	public HashMap<String,Integer> rechargeStatic();
	
	public HashMap<String,Integer> activityStatic();
	
	public HashMap<String,Integer> activityJoinStatic();
	
	public HashMap<String,Integer> monthCountStatic();
	
	public HashMap<String,Integer> dayCountStatic();
	
	public HashMap<String,Double> videoHallStatic(String videoHall);
	
	public HashMap<String,Double> movieStatic(String movieId);
	
	public HashMap<String,Integer> purchaseWithCardStatic();
	
	public HashMap<String,Integer> purchaseWithCashStatic();
	
	public HashMap<String,Integer> cardStatic();
	
	public HashMap<String,Integer> userStateStatic();
}
