package com.imovie.action;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.imovie.model.Activity;
import com.imovie.model.Answer;
import com.imovie.model.Movie;
import com.imovie.model.Order;
import com.imovie.model.Questionare;
import com.imovie.model.ScreeningPlan;
import com.imovie.model.User;
import com.imovie.service.MovieService;
import com.imovie.service.OrderService;
import com.imovie.service.UserService;

public class OrderAction extends BaseAction {

	@Autowired
	private OrderService orderService;

	@Autowired
	private MovieService movieService;

	@Autowired
	private UserService userService;

	private List<ScreeningPlan> planList;
	private List<Movie> movieList;
	private List<Questionare> questionList;
	private List<Activity> activityList;
	private String[] plans;
	private String[] questions;
	private String[] credit;
	private String type;
	private String[] answerA;
	private String[] answerB;
	private String[] answerC;
	private List<Order> orderList;
	private User checkUser;
	private String movie;
	private Movie showMovie;
	private Activity activity;
	private String activityId;
	private String planId;
	private String password;
	private String price;
	private String seatString;
	private String balance;
	private Order order;
	private String orderId;
	private String questionNum;
	private String payWay;
	private String userid;
	private String userId;

	// 保存订单
	public String execute() {
		User user = (User) session.get("user");
		if (user.getRole().equals("member")) {
			if (user.getPassword().equals(password)) {
				// 密码正确
				ScreeningPlan plan = movieService
						.getScreeningPlanByPlanIdWithMovie(planId);
				float bal = orderService
						.getBalanceByMemberId(String.valueOf(user
								.getInformation().getMemberId()));
				if (bal < Float.parseFloat(price)) {
					return "failure";
				}
				balance=String.valueOf(bal-Float.parseFloat(price));
				String orderId = String.valueOf(orderService.saveOrder(
						seatString, price, user, plan));
				order = orderService.getOrderByOrderId(orderId);
				order.setPurchaseMovie(plan);
				return "member_orderComplete";
			} else {
				// 密码错误
				return "failure";
			}
		} else {
			if (payWay.equals("0")) {
				// 现金
				ScreeningPlan plan = movieService
						.getScreeningPlanByPlanIdWithMovie(planId);
				String orderId = String.valueOf(orderService.saveOrder(
						seatString, price, null, plan));
				order = orderService.getOrderByOrderId(orderId);
				order.setPurchaseMovie(plan);
				balance = "现金0";
			} else {
				// 会员账户
				ScreeningPlan plan = movieService
						.getScreeningPlanByPlanIdWithMovie(planId);
				User member = userService.getUserByUserId(userId);
				balance = String.valueOf(orderService
						.getBalanceByMemberId(String.valueOf(member
								.getInformation().getMemberId())));
				if (Float.parseFloat(balance) < Float.parseFloat(price)) {
					return "failure";
				}
				String orderId = String.valueOf(orderService.saveOrder(
						seatString, price, member, plan));
				order = orderService.getOrderByOrderId(orderId);
				order.setPurchaseMovie(plan);
			}
			return "worker_orderComplete";
		}

	}

	// 显示工作人员制作活动界面
	public String MakeQuiz() {
		movieList = movieService.getAllValidMovie();
		Movie movie = movieList.get(0);
		planList = movieService.getAllValidScreeningPlanByMovieId(String
				.valueOf(movie.getMovieId()));
		for (ScreeningPlan plan : planList) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
			String time = df.format(plan.getScreeningTime());
			plan.setScreeningTimeInString(time);
		}
		return "worker_makeQuiz";
	}

	// 保存活动
	public String SaveQuiz() {
		if ((questions.length == credit.length)
				&& (credit.length == Integer.parseInt(type))
				&& (Integer.parseInt(type) == answerA.length)
				&& (answerA.length == answerB.length)
				&& (answerB.length == answerC.length) && (answerC.length != 0)) {
			String[] types=new String[Integer.parseInt(type)];
			for(int i=0;i<types.length;i++){
				types[i]=request.getParameter("type"+i);
			}
			Integer activityId = orderService.createActivity(questions, types,
					credit, answerA, answerB, answerC);
			if (activityId != null) {
				showMovie = this.movieService.getMovieByMovieId(movie);
				Activity temp = orderService.getActivityByActivityId(String
						.valueOf(activityId));

				for (String id : plans) {
					ScreeningPlan plan = movieService
							.getScreeningPlanByPlanId(id);
					plan.setActivity(temp);
					movieService.updateScreeningPlan(plan);
				}
				activity = orderService.getActivityByActivityId(String
						.valueOf(activityId));
				return "worker_quiz";
			}
		}else{
			System.out.println(questions.length);
			System.out.println(credit.length);
			System.out.println(answerA.length);
			System.out.println(answerB.length);
			System.out.println(answerC.length);
			System.out.println(Integer.parseInt(type));
		}

		return "failure";
	}

	// 查看会员消费记录
	public String OrderRecord() {
		if (userid != null) {
			orderList = orderService.getMyOrderByUserid(userid);
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
			for (Order order : orderList) {
				String time = df.format(order.getPurchaseTime());
				order.setPurchaseTimeInString(time);
				String[] seat = order.getOrderSeat().split(",");
				order.setOrderSeat(seat.length + "座");
			}
			return "worker_orderRecord";
		} else {
			User user = (User) session.get("user");
			orderList = orderService.getMyOrderByUserid(String.valueOf(user
					.getUserId()));
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");
			for (Order order : orderList) {
				String time = df.format(order.getPurchaseTime());
				order.setPurchaseTimeInString(time);
				String[] seat = order.getOrderSeat().split(",");
				order.setOrderSeat(seat.length + "座");
			}
			return "member_orderRecord";
		}
	}

	// 查看消费订单
	public String ShowOrder() {
		order = orderService.getOrderByOrderId(orderId);
		return "worker_orderComplete";
	}
	
	//所有有效活动
	public String ValidActivity(){
		activityList=orderService.getValidActivity();
		return "worker_validActivity";
	}
	
	//服务员查看活动
	public String CheckActivity(){
		showMovie = this.movieService.getMovieByMovieId(movie);
		activity = orderService.getActivityByActivityId(String
				.valueOf(activityId));
		return "worker_quiz";
	}

	// 我的未使用活动
	public String MyValidActivity() {
		String userid;

		BigDecimal id = ((User) session.get("user")).getUserId();
		userid = String.valueOf(id);

		planList = orderService.getPlanWatchedByUserid(userid);
		return "member_activityWatched";
	}

	// 我的已使用活动
	public String MyAnsweredActivity() {
		String userid;

		BigDecimal id = ((User) session.get("user")).getUserId();
		userid = String.valueOf(id);

		planList = orderService.getPlanAnsweredByUserid(userid);
		return "member_activityAnswered";
	}

	// 会员题目
	public String AnswerQuestion() {
		try {
			movie = new String(movie.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (planId != null) {
			activity = orderService.getActivityByPlanId(planId);
			return "member_quiz";
		} else {
			return "failure";
		}
	}

	// 保存答案
	public String SaveAnswer() {
		Integer num = Integer.parseInt(questionNum);
		String[] answers = new String[num];
		Integer[] questions = new Integer[num];
		for (int i = 0; i < num; i++) {
			answers[i] = request.getParameter("answer" + i);
			questions[i] = Integer.parseInt(request.getParameter("questionId"
					+ i));
			System.out.println(questions[i] + " " + answers[i]);
		}
		orderService.saveAnswer(orderId, questions, answers);
		return this.MyAnsweredActivity();
	}

	// 查看我的活动
	public String MyQuiz() {
		try {
			movie = new String(movie.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order = orderService.getOrderWithAnswerByOrderId(orderId);
		return "member_myQuiz";
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public List<ScreeningPlan> getPlanList() {
		return planList;
	}

	public void setPlanList(List<ScreeningPlan> planList) {
		this.planList = planList;
	}

	public List<Movie> getMovieList() {
		return movieList;
	}

	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}

	public List<Questionare> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Questionare> questionList) {
		this.questionList = questionList;
	}

	public String[] getPlans() {
		return plans;
	}

	public void setPlans(String[] plans) {
		this.plans = plans;
	}

	public String[] getQuestions() {
		return questions;
	}

	public void setQuestions(String[] questions) {
		this.questions = questions;
	}

	public String[] getCredit() {
		return credit;
	}

	public void setCredit(String[] credit) {
		this.credit = credit;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String[] getAnswerA() {
		return answerA;
	}

	public void setAnswerA(String[] answerA) {
		this.answerA = answerA;
	}

	public String[] getAnswerB() {
		return answerB;
	}

	public void setAnswerB(String[] answerB) {
		this.answerB = answerB;
	}

	public String[] getAnswerC() {
		return answerC;
	}

	public void setAnswerC(String[] answerC) {
		this.answerC = answerC;
	}

	public String getMovie() {
		return movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
	}

	public Movie getShowMovie() {
		return showMovie;
	}

	public void setShowMovie(Movie showMovie) {
		this.showMovie = showMovie;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSeatString() {
		return seatString;
	}

	public void setSeatString(String seatString) {
		this.seatString = seatString;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(String questionNum) {
		this.questionNum = questionNum;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPayWay() {
		return payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public User getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(User checkUser) {
		this.checkUser = checkUser;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Activity> getActivityList() {
		return activityList;
	}

	public void setActivityList(List<Activity> activityList) {
		this.activityList = activityList;
	}
}
