package com.imovie.dao;

import java.sql.Timestamp;
import java.util.List;

import com.imovie.model.ScreeningPlan;

public interface ScreeningPlanDAO {

	public Integer save(ScreeningPlan plan);
	
	public ScreeningPlan getScreeningPlanByIdWithMovie(Integer planId);
	
	public ScreeningPlan getScreeningPlanById(Integer planId);
	
	public List<ScreeningPlan> getAllScreeningPlan();
	
	public void updateScreeningPlan(ScreeningPlan plan);
	
	public Object getValueByColumnAndId(String column,Integer id);
	
	public boolean updateSeatByPlanId(Integer planId,String seat);
	
	public List<Object[]> activityStaticByMonth();

	public List<Object[]> dayCountStatic();
	
	public List<Object[]> monthCountStatic();
	
	public List<Object[]> videoHallStatic(String videoHall);
	
	public List<Object[]> movieStatic(Integer movieId);
	
	public boolean ifVideoHallBusy(Timestamp time,String hall,Integer planId);
}
