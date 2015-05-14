package com.imovie.dao.Impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.QuestionareDAO;
import com.imovie.model.Questionare;

@Repository
public class QuestionareDAOImpl extends BaseDAOImpl implements QuestionareDAO{

	@Override
	public Integer save(Questionare questionare) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer id=(Integer) session.save(questionare);
		return id;
	}

	@Override
	public Questionare getQuestionareById(Integer id) {
		// TODO Auto-generated method stub
		String hql="from Questionare where questionId='"+id+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		Questionare question=(Questionare) q.uniqueResult();
		return question;
	}

}
