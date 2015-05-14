package com.imovie.dao;

import java.util.List;

import com.imovie.model.Movie;

public interface MovieDAO {
	
	public Integer save(Movie movie);
	
	public void update(Movie movie);
	
	public Movie getMovieByMovieId(Integer movieId);
	
	public List<Movie> getAllMovie();
}
