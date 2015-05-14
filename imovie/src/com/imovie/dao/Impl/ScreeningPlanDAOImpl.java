package com.imovie.dao.Impl;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.imovie.dao.ScreeningPlanDAO;
import com.imovie.model.ScreeningPlan;

@Repository
public class ScreeningPlanDAOImpl extends BaseDAOImpl implements
		ScreeningPlanDAO {

	@Override
	public Integer save(ScreeningPlan plan) {
		// TODO Auto-generated method stub
		Session session=getSession();
		Integer planId=(Integer) session.save(plan);
		return planId;
	}

	@Override
	public ScreeningPlan getScreeningPlanByIdWithMovie(Integer planId) {
		// TODO Auto-generated method stub
		String hql="from ScreeningPlan p left join fetch p.movie where planId='"+planId+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<ScreeningPlan> list=q.list();
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public List<ScreeningPlan> getAllScreeningPlan() {
		// TODO Auto-generated method stub
		String hql="from ScreeningPlan p left join fetch p.movie order by p.screeningTime";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<ScreeningPlan> list=q.list();
		return list;
	}

	@Override
	public void updateScreeningPlan(ScreeningPlan plan) {
		// TODO Auto-generated method stub
		Session session=getSession();
		session.update(plan);;
	}

	@Override
	public ScreeningPlan getScreeningPlanById(Integer planId) {
		// TODO Auto-generated method stub
		String hql="from ScreeningPlan where planId='"+planId+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<ScreeningPlan> list=q.list();
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public Object getValueByColumnAndId(String column, Integer id) {
		// TODO Auto-generated method stub
		String hql="select "+column+" from ScreeningPlan where planId='"+id+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		return q.uniqueResult();
	}

	@Override
	public boolean updateSeatByPlanId(Integer planId, String seat) {
		// TODO Auto-generated method stub
		String hql="update ScreeningPlan set "+seat+"=true, seatSaled=seatSaled+1 where planId='"+planId+"'";
		Session session=getSession();
		Query q=session.createQuery(hql);
		if(q.executeUpdate()>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Object[]> activityStaticByMonth() {
		// TODO Auto-generated method stub
		String hql="select monthname(screeningTime),count(*) from ScreeningPlan p right join p.activity a where year(screeningTime)=year(current_date()) and planState!='待批准' group by year(screeningTime),month(screeningTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> dayCountStatic() {
		// TODO Auto-generated method stub
		String hql="select date_format(from_days(to_days(screeningTime)),'%M %D'),sum(seatSaled) from ScreeningPlan where abs((to_days(screeningTime)-to_days(curdate())))<11 and planState!='待批准' group by to_days(screeningTime) order by to_days(screeningTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> monthCountStatic() {
		// TODO Auto-generated method stub
		String hql="select monthname(screeningTime),sum(seatSaled) from ScreeningPlan where year(screeningTime)=year(current_date()) and planState!='待批准' group by month(screeningTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> videoHallStatic(String videoHall) {
		// TODO Auto-generated method stub
		String hql="select monthname(screeningTime),(sum(seatSaled)/count(*)/0.8) from ScreeningPlan where screeningHall='"+videoHall+"' and year(screeningTime)=year(current_date()) and planState!='待批准' group by month(screeningTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public List<Object[]> movieStatic(Integer movieId) {
		// TODO Auto-generated method stub
		String hql="select monthname(p.screeningTime),(sum(p.seatSaled)/count(*)/0.8) from ScreeningPlan p left join p.movie m where m.movieId='"+movieId+"' and p.planState!='待批准' group by month(p.screeningTime)";
		Session session=getSession();
		Query q=session.createQuery(hql);
		List<Object[]> result=q.list();
		return result;
	}

	@Override
	public boolean ifVideoHallBusy(Timestamp time, String hall,Integer planId) {
		// TODO Auto-generated method stub
		Long interval=new Long(10800);  //3个小时 
		String hql="from ScreeningPlan where screeningHall='"+hall+"' and abs(time_to_sec(timediff(screeningTime,'"+time+"')))<"+interval;
		String hql2="from ScreeningPlan where screeningHall='"+hall+"' and abs(time_to_sec(timediff(screeningTime,'"+time+"')))<"+interval+" and planId<>"+planId;
		Session session=getSession();
		Query q;
		if(planId==null){
			q=session.createQuery(hql);
		}else{
			q=session.createQuery(hql2);
		}
		int size=q.list().size();
		if(size==0){
			return false;
		}else{
			return true;
		}
	}

	
}
