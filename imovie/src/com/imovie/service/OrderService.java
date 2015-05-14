package com.imovie.service;

import java.util.List;

import com.imovie.model.Activity;
import com.imovie.model.Answer;
import com.imovie.model.Order;
import com.imovie.model.ScreeningPlan;
import com.imovie.model.User;

public interface OrderService {

	public List<Order> getMyOrderByUserid(String userid);
	
	public List<ScreeningPlan> getPlanWatchedByUserid(String userid);
	
	public List<ScreeningPlan> getPlanAnsweredByUserid(String userid);
	
	public List<Integer> saveAnswer(List<Answer> list);
	
	public Integer saveOrder(String seats,String price,User user,ScreeningPlan plan);
	
	public Order getOrderByOrderId(String orderid);
	
	public boolean saveActivity(Activity activity);
	
	public Integer createActivity(String[] questions,String[] types,String[] credits,String[] answerA,String[] answerB,String[] answerC);
	
	public Activity getActivityByActivityId(String activityId);
	
	public Activity getActivityByPlanId(String planId);
	
	public float getDiscountPricebyMemberId(String memberId,int total);
	
	public float getBalanceByMemberId(String memberId);
	
	public void saveAnswer(String orderId,Integer[] questionIds,String[] answers);
	
	public Order getOrderWithAnswerByOrderId(String orderId);
	
	public List<Activity> getValidActivity();
}
