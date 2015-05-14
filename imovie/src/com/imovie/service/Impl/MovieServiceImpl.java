package com.imovie.service.Impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imovie.dao.AnswerDAO;
import com.imovie.dao.LevelDAO;
import com.imovie.dao.MemberinfoDAO;
import com.imovie.dao.MovieDAO;
import com.imovie.dao.ScreeningPlanDAO;
import com.imovie.model.Activity;
import com.imovie.model.Answer;
import com.imovie.model.Movie;
import com.imovie.model.Order;
import com.imovie.model.Questionare;
import com.imovie.model.ScreeningPlan;
import com.imovie.model.User;
import com.imovie.service.MovieService;

@Service("movieService")
public class MovieServiceImpl implements MovieService {
	private final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private MovieDAO movieDao;
	
	@Autowired
	private ScreeningPlanDAO screeningPlanDao;
	
	@Autowired
	private MemberinfoDAO memberinfoDao;
	
	@Autowired
	private AnswerDAO answerDao;

	@Override
	public List<Movie> getAllValidMovie() {
		// TODO Auto-generated method stub
		List<Movie> list=movieDao.getAllMovie();
		for(int i=0;i<list.size();i++){
			if(!list.get(i).getMovieState().equals("已生效")){
				list.remove(i);
				i--;
			}
		}
		return list;
	}
	
	@Override
	public List<Movie> getAllMovie() {
		// TODO Auto-generated method stub
		return movieDao.getAllMovie();
	}

	@Override
	public Integer saveScreeningPlan( String movieId, String language, String screeningTime,
			String screeningHall, String price, String planState) {
		// TODO Auto-generated method stub
		ScreeningPlan plan=new ScreeningPlan();
		Movie movie=movieDao.getMovieByMovieId(Integer.parseInt(movieId));
		plan.setLanguage(language);
		Timestamp time=Timestamp.valueOf(screeningTime);
		plan.setScreeningTime(time);
		plan.setScreeningHall(screeningHall);
		plan.setSeatPrice(Integer.parseInt(price));
		plan.setPlanState(planState);
		plan.setMovie(movie);
		plan.setSeatSaled(0);
		return screeningPlanDao.save(plan);
	}

	@Override
	public ScreeningPlan getScreeningPlanByPlanIdWithMovie(String planId) {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(planId);
		ScreeningPlan plan=screeningPlanDao.getScreeningPlanByIdWithMovie(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
		String time = df.format(plan.getScreeningTime());
		plan.setScreeningTimeInString(time);
		return plan;
	}

	@Override
	public ScreeningPlan editScreeningPlan(String planId, String movieId,
			String language, String screeningTime, String screeningHall,
			String price, String planState) {
		// TODO Auto-generated method stub
		ScreeningPlan plan=screeningPlanDao.getScreeningPlanByIdWithMovie(Integer.parseInt(planId));
		if(plan.getPlanState().equals("已生效")){
			return null;
		}else{
			plan.setMovie(movieDao.getMovieByMovieId(Integer.parseInt(movieId)));
			plan.setLanguage(language);
			plan.setScreeningHall(screeningHall);
			plan.setScreeningTime(Timestamp.valueOf(screeningTime));
			plan.setSeatPrice(Integer.parseInt(price));
			screeningPlanDao.save(plan);
			return plan;
		}
	}

	@Override
	public List<ScreeningPlan> getAllValidScreeningPlan() {
		// TODO Auto-generated method stub
		Timestamp now = new Timestamp(System.currentTimeMillis());
		List<ScreeningPlan> list=screeningPlanDao.getAllScreeningPlan();
		for(int i=0;i<list.size();i++){
			ScreeningPlan plan=list.get(i);
			if(now.after(plan.getScreeningTime())){
				list.remove(plan);
				i=i-1;
			}
		}
		return list;
	}

	@Override
	public boolean acceptScreeningPlan(String planId) {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(planId);
		ScreeningPlan plan=screeningPlanDao.getScreeningPlanByIdWithMovie(id);
		if(plan.getPlanState().equals("待批准")){
			plan.setPlanState("已生效");
			if(screeningPlanDao.save(plan)!=null){
				logger.info("成功保存");
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}

	@Override
	public List<ScreeningPlan> getAllValidScreeningPlanByMovieId(String movieId) {
		// 用于工作人员制定活动
		Integer id=Integer.parseInt(movieId);
		Timestamp now = new Timestamp(System.currentTimeMillis());
		List<ScreeningPlan> list=screeningPlanDao.getAllScreeningPlan();
		for(int i=0;i<list.size();i++){
			ScreeningPlan plan=list.get(i);
			//删掉过时的计划
			if(now.after(plan.getScreeningTime())){
				list.remove(plan);
				i=i-1;
				continue;
			}
			//删掉不同电影的计划
			if(plan.getMovie().getMovieId()!=id){
				list.remove(plan);
				i=i-1;
				continue;
			}
			//过滤无效的计划
			if(!plan.getPlanState().equals("已生效")){
				list.remove(plan);
				i=i-1;
				continue;
			}
			//过滤已经参与活动的计划
			if(plan.getActivity()!=null){
				list.remove(plan);
				i=i-1;
			}
		}
		return list;
	}

	@Override
	public Movie getMovieByMovieId(String movieId) {
		// TODO Auto-generated method stub
		Integer movieid=Integer.parseInt(movieId);
		return movieDao.getMovieByMovieId(movieid);
	}

	@Override
	public void updateScreeningPlan(ScreeningPlan plan) {
		// TODO Auto-generated method stub
		screeningPlanDao.updateScreeningPlan(plan);
	}

	@Override
	public ScreeningPlan getScreeningPlanByPlanId(String planId) {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(planId);
		return screeningPlanDao.getScreeningPlanById(id);
	}

	@Override
	public int getPriceByPlanId(String planId) {
		// TODO Auto-generated method stub
		Integer price=(Integer) screeningPlanDao.getValueByColumnAndId("seatPrice", Integer.parseInt(planId));
		return price.intValue();
	}

	@Override
	public Integer saveMovie(String name,String poster,String type,String duration,String description) {
		// TODO Auto-generated method stub
		Movie movie=new Movie();
		movie.setName(name);
		movie.setPoster(poster);
		movie.setType(type);
		movie.setDuration(Integer.parseInt(duration));
		movie.setDescription(description);
		movie.setMovieState("已生效");
		return movieDao.save(movie);
	}

	@Override
	public boolean offMovie(String movieId) {
		// TODO Auto-generated method stub
		Movie movie=movieDao.getMovieByMovieId(Integer.parseInt(movieId));
		if(movie.getMovieState().equals("已生效")){
			logger.info("\n下线电影:"+movie.getName()+"\n");
			//得到电影的所有放映计划
			List<ScreeningPlan> planList=movie.getPlanList();
			for(ScreeningPlan plan:planList){
				logger.info("\n  处理放映计划:"+plan.getPlanId()+"\n");
				//得到该放映计划参与的活动
				Activity activity=plan.getActivity();
				if(activity!=null && activity.getActivityState().equals("进行中")){
					logger.info("\n    处理活动:"+activity.getActivityId()+"\n");
					//统计所有开放试题答案
					List<Questionare> questionList=activity.getQuestions();
					for(Questionare q:questionList){
						logger.info("\n      处理问题:"+q.getTitle()+"\n");
						if(!q.getQuestionType()){
							//开放试题
							List<Answer> ans=answerDao.getAnswersByQuestionId(q.getQuestionId());
							int countA=0;
							int countB=0;
							int countC=0;
							for(Answer a:ans){
								if(a.getAnswer().equals("A")){
									countA++;
								}else if(a.getAnswer().equals("B")){
									countB++;
								}else if(a.getAnswer().equals("C")){
									countC++;
								}
							}
							if(countA>=countB && countA>=countC){
								q.setCorrect("A");
							}else if(countB>=countA && countB>=countC){
								q.setCorrect("B");
							}else if(countC>=countA && countC>=countB){
								q.setCorrect("C");
							}
							logger.info("\n        开放式问题答案为:"+q.getCorrect()+"\n");
						}
					}
					activity.setActivityState("已结束");
					logger.info("\n    活动:"+activity.getActivityId()+activity.getActivityState()+"\n");
				}
				
				//处理每个放映计划的所有订单
				List<Order> orderList=plan.getOrderList();
				for(Order order:orderList){
					logger.info("\n    处理订单:"+order.getOrderId()+"\n");
					//对每个订单，对于参与活动的，进行答案的判断并进行积分的加减
					if(order.getOrderState()){
						//用户已经进行答题
						User user=order.getOwner();
						List<Answer> answerList=order.getAnswerList();
						for(Answer answer:answerList){
							//对每个答案，判断对错
							logger.info("\n      处理答案:"+answer.getAnswerId()+"\n");
							Questionare question=answer.getQuestionare();
							if(question.getCorrect().equals(answer.getAnswer())){
								//正确,为该用户增加积分
								memberinfoDao.increaseCreditByMemberId(user.getInformation().getMemberId(), question.getQuestionCredit());
								answer.setPrizeCredit(question.getQuestionCredit());
								logger.info("\n        答案对:"+answer.getPrizeCredit()+"\n");
							}else{
								//错误
								answer.setPrizeCredit(0);
								logger.info("\n        答案错\n");
							}
						}
					}
				}
				logger.info("******************************************");
				plan.setPlanState("已结束");
				screeningPlanDao.updateScreeningPlan(plan);
			}
			movie.setMovieState("已下线");
			movieDao.update(movie);
			logger.info("\n"+movie.getName()+"处理结束:"+movie.getMovieState()+"\n");
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean checkTimeFreeForScreeningPlan(String time, String hall,String planId) {
		// TODO Auto-generated method stub
		Timestamp times=Timestamp.valueOf(time);
		Integer id=null;
		if(planId!=null && (!planId.equals(""))){
			id=Integer.parseInt(planId);
		}
		boolean flag=screeningPlanDao.ifVideoHallBusy(times, hall,id);
		System.out.println("service "+flag);
		return flag;
	}


}
