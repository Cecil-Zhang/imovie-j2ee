package com.imovie.dao;

import com.imovie.model.Questionare;

public interface QuestionareDAO {

	public Integer save(Questionare questionare);
	
	public Questionare getQuestionareById(Integer id);
}
