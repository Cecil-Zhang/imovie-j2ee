package com.imovie.dao;

import java.util.List;

import com.imovie.model.Level;

public interface LevelDAO {

	public float getDiscountByCredit(Integer credit);
	
	public List<Level> getAllLevel();
}
