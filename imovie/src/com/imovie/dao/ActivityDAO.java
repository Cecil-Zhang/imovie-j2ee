package com.imovie.dao;

import java.util.List;

import com.imovie.model.Activity;

public interface ActivityDAO{

	public Integer save(Activity activity);
	
	public Activity getActivityById(Integer id);
	
	public Activity getActivityWithQuestionByPlanId(Integer planId);
	
	public List<Activity> getAllActivity();
}
