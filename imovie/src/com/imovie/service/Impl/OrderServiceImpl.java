package com.imovie.service.Impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imovie.dao.ActivityDAO;
import com.imovie.dao.AnswerDAO;
import com.imovie.dao.LevelDAO;
import com.imovie.dao.MemberinfoDAO;
import com.imovie.dao.OrderDAO;
import com.imovie.dao.QuestionareDAO;
import com.imovie.dao.ScreeningPlanDAO;
import com.imovie.model.Activity;
import com.imovie.model.Answer;
import com.imovie.model.Memberinfo;
import com.imovie.model.Order;
import com.imovie.model.Questionare;
import com.imovie.model.ScreeningPlan;
import com.imovie.model.User;
import com.imovie.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private ActivityDAO activityDao;
	@Autowired
	private AnswerDAO answerDao;
	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private QuestionareDAO questionareDao;
	@Autowired
	private MemberinfoDAO memberinfoDao;
	@Autowired
	private LevelDAO levelDao;
	@Autowired
	private ScreeningPlanDAO screeningPlanDao;

	@Override
	public List<Order> getMyOrderByUserid(String userid) {
		// TODO Auto-generated method stub
		BigDecimal userId=new BigDecimal(userid);
		return orderDao.getOrderByUserid(userId);
	}

	@Override
	public List<Integer> saveAnswer(List<Answer> list) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public Integer saveOrder(String seats,String price,User user,ScreeningPlan plan) {
		// TODO Auto-generated method stub
		Order order=new Order();
		order.setOrderSeat(seats);
		order.setOrderPrice(Float.parseFloat(price));
		order.setOwner(user);
		order.setPurchaseMovie(plan);
		int temp=(int) Math.ceil(Double.parseDouble(price));
		order.setOrderCredit(temp);
		order.setOrderState(false);
		if(user!=null){
			//如果是会员购买，进行积分和余额的加减
			//增加积分
			memberinfoDao.increaseCreditByMemberId(user.getInformation().getMemberId(), temp);
			//减去余额
			memberinfoDao.decreaseBalanceByMemberId(user.getInformation().getMemberId(), Float.parseFloat(price));
		}
		//设置放映计划已订座位
		String[] list=seats.split(",");
		for(String s:list){
			String row=s.substring(0, 1);
			Integer r=Integer.parseInt(row)-1;
			String seat=s.substring(2, 3);
			String column="seat"+r+seat;
			screeningPlanDao.updateSeatByPlanId(plan.getPlanId(), column);
		}
		return orderDao.save(order);
	}

	@Override
	public Order getOrderByOrderId(String orderid) {
		// TODO Auto-generated method stub
		return orderDao.getOrderWithPlanByOrderId(Integer.parseInt(orderid));
	}

	@Override
	public boolean saveActivity(Activity activity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Integer createActivity(String[] questions, String[] types, String[] credits,
			String[] answerA, String[] answerB, String[] answerC) {
		// TODO Auto-generated method stub
		Activity activity=new Activity();
		activity.setActivityState("进行中");
		Integer activityId=activityDao.save(activity);
		for(int i=0;i<questions.length;i++){
			Questionare questionare=new Questionare();
			String question=questions[i];
			questionare.setTitle(question);
			String ansA=answerA[i];
			String ansB=answerB[i];
			String ansC=answerC[i];
			String type=types[i];
			if(type.equals("open")){
				//开放试题
				questionare.setAnswerA(ansA);
				questionare.setAnswerB(ansB);
				questionare.setAnswerC(ansC);
				questionare.setCorrect("无");
				questionare.setQuestionType(false);
			}else{
				//标准试题，打乱答案顺序
				int correct=(int) Math.round(Math.random()*2);
				switch(correct){
				case 0:
					questionare.setAnswerA(ansA);
					questionare.setAnswerB(ansB);
					questionare.setAnswerC(ansC);
					questionare.setCorrect("A");
					break;
				case 1:
					questionare.setAnswerA(ansB);
					questionare.setAnswerB(ansA);
					questionare.setAnswerC(ansC);
					questionare.setCorrect("B");
					break;
				case 2:
					questionare.setAnswerA(ansC);
					questionare.setAnswerB(ansB);
					questionare.setAnswerC(ansA);
					questionare.setCorrect("C");
				}
				questionare.setQuestionType(true);
			}
			Integer c=Integer.parseInt(credits[i]);
			questionare.setQuestionCredit(c);
			questionare.setBelongActivity(activity);
			questionareDao.save(questionare);
		}
		return activityId;
	}

	@Override
	public Activity getActivityByActivityId(String activityId) {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(activityId);
		Activity activity=activityDao.getActivityById(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");   
		for(ScreeningPlan plan:activity.getPlanList()){
		    String time = df.format(plan.getScreeningTime());		    
		    plan.setScreeningTimeInString(time);
		}
		return activity;
	}

	@Override
	public float getDiscountPricebyMemberId(String memberId, int total) {
		// TODO Auto-generated method stub
		Memberinfo info=memberinfoDao.getMemberinfoByMemberId(Integer.parseInt(memberId));
		int credit=info.getCredit().intValue();
		float discount=levelDao.getDiscountByCredit(credit);
		float result=total*discount;
		return result;
	}

	@Override
	public float getBalanceByMemberId(String memberId) {
		// TODO Auto-generated method stub
		Integer user=Integer.parseInt(memberId);
		return memberinfoDao.getMemberinfoByMemberId(user).getBalance();
	}

	@Override
	public List<ScreeningPlan> getPlanWatchedByUserid(String userid) {
		// TODO Auto-generated method stub
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
		
		ArrayList<ScreeningPlan> planList=new ArrayList<ScreeningPlan>();
		List<Order> list=this.getOrderListWithPlanByUserid(userid);
		for(Order o:list){
			if(!o.getOrderState() && o.getPurchaseMovie().getPlanState().equals("已生效")){
				ScreeningPlan plan=o.getPurchaseMovie();
				String time = df.format(plan.getScreeningTime());
				plan.setScreeningTimeInString(time);
				plan.setOrderId(o.getOrderId());
				planList.add(plan);
			}
		}
		return planList;
	}

	private List<Order> getOrderListWithPlanByUserid(String userid){
		BigDecimal usrId=new BigDecimal(userid);
		List<Order> list=orderDao.getOrderByUserid(usrId);
		return list;
	}

	@Override
	public List<ScreeningPlan> getPlanAnsweredByUserid(String userid) {
		// TODO Auto-generated method stub
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
		ArrayList<ScreeningPlan> planList=new ArrayList<ScreeningPlan>();
		List<Order> list=this.getOrderListWithPlanByUserid(userid);
		for(Order o:list){
			if(o.getOrderState()){
				ScreeningPlan plan=o.getPurchaseMovie();
				String time = df.format(plan.getScreeningTime());
				plan.setScreeningTimeInString(time);
				plan.setOrderId(o.getOrderId());
				planList.add(plan);
			}
		}
		return planList;
	}

	@Override
	public Activity getActivityByPlanId(String planId) {
		// TODO Auto-generated method stub
		return activityDao.getActivityWithQuestionByPlanId(Integer.parseInt(planId));
	}

	@Override
	public void saveAnswer(String orderId, Integer[] questionIds,
			String[] answers) {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(orderId);
		Order order=orderDao.getOrderWithPlanByOrderId(id);
		for(int i=0;i<questionIds.length;i++){
			Questionare q=questionareDao.getQuestionareById(questionIds[i]);
			Answer ans=new Answer();
			ans.setOrder(order);
			ans.setQuestionare(q);
			ans.setAnswer(answers[i]);
			answerDao.save(ans);
		}
		order.setOrderState(true);
		orderDao.save(order);
	}

	@Override
	public Order getOrderWithAnswerByOrderId(String orderId) {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(orderId);
		Order order=orderDao.getOrderByOrderId(id);
		System.out.println(order.getAnswerList().get(0).getQuestionare().getTitle());
		return order;
	}

	@Override
	public List<Activity> getValidActivity() {
		// TODO Auto-generated method stub
		List<Activity> list=new ArrayList<Activity>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
		for(Activity a:activityDao.getAllActivity()){
			if(a.getActivityState().equals("进行中")){
				a.getPlanList().get(0).getMovie().getPoster();
				for(ScreeningPlan plan:a.getPlanList()){
					String time=df.format(plan.getScreeningTime());
					plan.setScreeningTimeInString(time);
				}
				list.add(a);
			}
		}
		return list;
	}
}
