package com.imovie.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.ActivityDAO;
import com.imovie.model.Activity;

@Repository
public class ActivityDAOImpl extends BaseDAOImpl implements ActivityDAO {

	@Override
	public Integer save(Activity activity) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer id=(Integer) session.save(activity);
		return id;
	}

	@Override
	public Activity getActivityById(Integer id) {
		// TODO Auto-generated method stub
		String hql="from Activity where activityId='"+id+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		Activity activity=(Activity) q.uniqueResult();
		return activity;
	}

	@Override
	public Activity getActivityWithQuestionByPlanId(Integer planId) {
		// TODO Auto-generated method stub
		String hql="from Activity a left join fetch a.planList p where p.planId='"+planId+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		Activity activity=(Activity) q.uniqueResult();
		return activity;
	}

	@Override
	public List<Activity> getAllActivity() {
		// TODO Auto-generated method stub
		String hql="from Activity";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Activity> list=q.list();
		return list;
	}

}
