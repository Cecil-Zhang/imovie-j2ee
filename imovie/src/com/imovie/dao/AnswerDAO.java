package com.imovie.dao;

import java.util.List;

import com.imovie.model.Answer;

public interface AnswerDAO {

	public Integer save(Answer answer);
	
	public Answer getAnswerById(Integer id);
	
	public List<Answer> getAnswersByQuestionId(Integer qId);
}
