package com.imovie.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.MovieDAO;
import com.imovie.model.Movie;

@Repository
public class MovieDAOImpl extends BaseDAOImpl implements MovieDAO {

	@Override
	public Integer save(Movie movie) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer movieId=(Integer) session.save(movie);
		return movieId;
	}

	@Override
	public Movie getMovieByMovieId(Integer movieId) {
		// TODO Auto-generated method stub
		String hql="from Movie where movieId='"+movieId+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Movie> list=q.list();
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public List<Movie> getAllMovie() {
		// TODO Auto-generated method stub
		String hql="from Movie";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Movie> list=q.list();
		return list;
	}

	@Override
	public void update(Movie movie) {
		// TODO Auto-generated method stub
		Session session=getSession();
		session.update(movie);
	}

}
