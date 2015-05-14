package com.imovie.service;

import java.util.List;

import com.imovie.model.Movie;
import com.imovie.model.ScreeningPlan;

public interface MovieService {
	
	public Integer saveMovie(String name,String poster,String type,String duration,String description);
	
	public boolean offMovie(String movieId);
	
	public List<Movie> getAllMovie();
	
	public Movie getMovieByMovieId(String movieId);
	
	public Integer saveScreeningPlan(String movieId,String language,String screeningTime,String screeningHall,String price,String planState);
	
	public ScreeningPlan getScreeningPlanByPlanIdWithMovie(String planId);
	
	public ScreeningPlan getScreeningPlanByPlanId(String planId);
	
	public List<ScreeningPlan> getAllValidScreeningPlan();
	
	public List<ScreeningPlan> getAllValidScreeningPlanByMovieId(String movieId);
	
	public ScreeningPlan editScreeningPlan(String planId,String movieId,String language,String screeningTime,String screeningHall,String price,String planState);
	
	public boolean acceptScreeningPlan(String planId);
	
	public void updateScreeningPlan(ScreeningPlan plan);
	
	public int getPriceByPlanId(String planId);

	public List<Movie> getAllValidMovie();
	
	public boolean checkTimeFreeForScreeningPlan(String time,String hall,String planId);
}
