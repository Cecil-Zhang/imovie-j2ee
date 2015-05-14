package com.imovie.dao.Impl;

import java.sql.Timestamp;
import java.util.List;







import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.MemberinfoDAO;
import com.imovie.model.Memberinfo;

@Repository
public class MemberinfoDAOImpl extends BaseDAOImpl implements MemberinfoDAO {

	@Override
	public Integer save(Memberinfo member) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer id=(Integer) session.save(member);
		return id;
	}

	@Override
	public Memberinfo getMemberinfoByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="from Memberinfo where memberId='"+memberId+"'";
		Query q=session.createQuery(hql);
		List<Memberinfo> list=q.list();
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public int decreaseCreditByMemberId(Integer memberId,Integer decreasement){
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="update Memberinfo set credit=credit-"+decreasement+" where memberId='"+memberId+"'";
		Query q=session.createQuery(hql);
		return q.executeUpdate();
	}

	@Override
	public int increaseCreditByMemberId(Integer memberId, Integer increment) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="update Memberinfo set credit=credit+"+increment+" where memberId='"+memberId+"'";
		Query q=session.createQuery(hql);
		return q.executeUpdate();
	}

	@Override
	public int decreaseBalanceByMemberId(Integer memberId, Float decreasement) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="update Memberinfo set balance=balance-"+decreasement+" where memberId='"+memberId+"'";
		Query q=session.createQuery(hql);
		return q.executeUpdate();
	}

	@Override
	public int increaseBalanceByMemberId(Integer memberId, Float increment) {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="from Memberinfo where memberId='"+memberId+"'";
		Query q=session.createQuery(hql);
		Memberinfo info=(Memberinfo) q.uniqueResult();
		if(info.getState().equals("已取消")){
			return 0;
		}
		Float balance=info.getBalance()+increment;
		info.setBalance(balance);
		Timestamp now=new Timestamp(System.currentTimeMillis());
		info.setLastRecharge(now);
		if(info.getState().equals("未激活")){
			if(increment>=200){
				info.setState("已激活");
				
			}
		}
		if(info.getState().equals("已暂停")){
			info.setState("已激活");
		}
		session.update(info);
		return 1;
	}

	@Override
	public List<Memberinfo> getAllMemberinfo() {
		// TODO Auto-generated method stub
		Session session=getSession();
		String hql="from Memberinfo";
		Query q=session.createQuery(hql);
		return q.list();
	}

	@Override
	public void update(Memberinfo member) {
		// TODO Auto-generated method stub
		Session session=getSession();
		session.update(member);
		
	}

	@Override
	public List<Memberinfo> getPastYearMember() {
		// TODO Auto-generated method stub
		String hql="from Memberinfo where datediff(now(),lastRecharge)>365";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Memberinfo> list=q.list();
		return list;
	}

}
