package com.imovie.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.AnswerDAO;
import com.imovie.model.Answer;

@Repository
public class AnswerDAOImpl extends BaseDAOImpl implements AnswerDAO {

	@Override
	public Integer save(Answer answer) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer id=(Integer) session.save(answer);
		return id;
	}

	@Override
	public Answer getAnswerById(Integer id) {
		// TODO Auto-generated method stub
		String hql="from Answer where answerId='"+id+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		Answer answer=(Answer) q.uniqueResult();
		return answer;
	}

	@Override
	public List<Answer> getAnswersByQuestionId(Integer qId) {
		// TODO Auto-generated method stub
		String hql="from Answer where questionId='"+qId+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Answer> list=q.list();
		return list;
	}


}
