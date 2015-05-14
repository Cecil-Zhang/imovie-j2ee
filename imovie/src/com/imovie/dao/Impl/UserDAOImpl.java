package com.imovie.dao.Impl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imovie.dao.BaseDAO;
import com.imovie.dao.UserDAO;
import com.imovie.model.User;

@Repository
public class UserDAOImpl extends BaseDAOImpl implements UserDAO {
	
	@Override
	public BigDecimal save(User user) {
		// TODO Auto-generated method stub
		Session session=getSession();
		char[] numList=new char[7];
		int first=(int) Math.ceil(Math.random()*8);
		numList[0]=String.valueOf(first).charAt(0);
		for(int i=1;i<7;i++){
			int rand=(int) Math.floor((Math.random()*10));
			numList[i]=String.valueOf(rand).charAt(0);
		}
		String idstr=new String(numList);
		BigDecimal id=new BigDecimal(idstr);
		user.setUserId(id);
		session.save(user);
		return id;
	}

	@Override
	public User login(BigDecimal userid, String password, String role) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql1="from User u left join fetch u.information i where u.userId ='"+userid+"' and u.password ='"+password+"' and u.role='"+role+"' and i.state<>'已取消'";
		String hql2="from User u left join fetch u.information i where u.userId ='"+userid+"' and u.password ='"+password+"' and u.role='"+role+"'";
		Query query;
		if(role.equals("member")){
			query=session.createQuery(hql1);
		}else{
			query=session.createQuery(hql2);
		}
		List<User> list=query.list();
        if (list.size() == 1) {  
            return list.get(0);
        }  
        return null;
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		Session session=getSession();
		session.update(user);
	}

	@Override
	public User getUserByUserId(BigDecimal userid) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="from User u left join fetch u.information i where u.userId ='"+userid+"'";
		Query query=session.createQuery(hql);
		List<User> list=query.list();
        if (list.size() == 1) {  
            return list.get(0);
        }  
        return null;
	}

	@Override
	public List<User> searchByIdAndName(String search) {
		// TODO Auto-generated method stub
		String hql;
		try{
			BigDecimal id=new BigDecimal(search);
			hql="from User u left join fetch u.information i where (u.userId like '%"+id+"%' or i.username like '%"+search+"%') and u.role='member'";
		}catch(NumberFormatException e){
			hql="from User u left join fetch u.information i where i.username like '%"+search+"%' and u.role='member'";
		}
		Session session=getSession();
		Query query=session.createQuery(hql);
		List<User> list=query.list();
		return list;
	}

	@Override
	public User getUserRechargeListByUserId(BigDecimal userid) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="from User u left join fetch u.information left join fetch u.rechargeList where u.userId='"+userid+"'";
		Query q=session.createQuery(hql);
		User user=(User) q.uniqueResult();
		return user;
	}

}
