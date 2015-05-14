package com.imovie.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.imovie.model.Memberinfo;
import com.imovie.model.Movie;
import com.imovie.model.ScreeningPlan;
import com.imovie.model.User;
import com.imovie.service.MovieService;
import com.imovie.service.OrderService;

public class MovieAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private MovieService movieService;
	@Autowired
	private OrderService orderService;
	
	private String videoHall;
	private String screeningMovie;
	private String language;
	private String screeningTime;
	private String price;
	private String planId;
	private ArrayList<Movie> movieList;
	private List<ScreeningPlan> planList;
	private ScreeningPlan screeningPlan;
	private String todo;
	private String seatString;
	private String[] seat;
	private String discountPrice;


	public String getVideoHall() {
		return videoHall;
	}

	public void setVideoHall(String videoHall) {
		this.videoHall = videoHall;
	}

	public String getScreeningMovie() {
		return screeningMovie;
	}

	public void setScreeningMovie(String screeningMovie) {
		this.screeningMovie = screeningMovie;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getScreeningTime() {
		return screeningTime;
	}

	public void setScreeningTime(String screeningTime) {
		this.screeningTime = screeningTime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public ArrayList<Movie> getMovieList() {
		return movieList;
	}

	public void setMovieList(ArrayList<Movie> movieList) {
		this.movieList = movieList;
	}

	public List<ScreeningPlan> getPlanList() {
		return planList;
	}

	public void setPlanList(List<ScreeningPlan> planList) {
		this.planList = planList;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public ScreeningPlan getScreeningPlan() {
		return screeningPlan;
	}

	public void setScreeningPlan(ScreeningPlan screeningPlan) {
		this.screeningPlan = screeningPlan;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public String getSeatString() {
		return seatString;
	}

	public void setSeatString(String seatString) {
		this.seatString = seatString;
	}

	public String[] getSeat() {
		return seat;
	}

	public void setSeat(String[] seat) {
		this.seat = seat;
	}

	public String getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(String discountPrice) {
		this.discountPrice = discountPrice;
	}

	//显示所有有效的放映计划
	public String execute(){
		this.setPlanList(movieService.getAllValidScreeningPlan());
		for(ScreeningPlan plan:planList){
			SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日   HH:mm");   
		    String time = df.format(plan.getScreeningTime());
		    plan.setScreeningTimeInString(time);
		}
		if(todo.equals("edit")){
			return "worker_editPlan";
		}else if(todo.equals("review")){
			for(int i=0;i<planList.size();i++){
				ScreeningPlan plan=planList.get(i);
				if(plan.getPlanState().equals("已结束") ){
					planList.remove(plan);
					i=i-1;
				}
			}
			return "manager_reviewPlan";
		}else{
			for(int i=0;i<planList.size();i++){
				ScreeningPlan plan=planList.get(i);
				if(!plan.getPlanState().equals("已生效")){
					planList.remove(plan);
					i=i-1;
				}
			}
			if(todo.equals("sale")){
				return "worker_sale";
			}else{
				return "member_buy";
			}
		}
	}
	
	//保存放映计划
	public String MakePlan(){
		if(planId!=null && !planId.equals("")){
			//编辑放映计划
			ScreeningPlan myplan=movieService.editScreeningPlan(planId, screeningMovie, language, screeningTime, videoHall, price, "待批准");
			if(myplan!=null){
				this.screeningPlan=myplan;
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");   
			    String time = df.format(screeningPlan.getScreeningTime());
			    screeningPlan.setScreeningTimeInString(time);
				return "worker_plan";
			}else{
				return "failure";
			}
		}else{
			//新建放映计划
			Integer planId=movieService.saveScreeningPlan(screeningMovie,language, screeningTime, videoHall, price, "待批准");
			this.screeningPlan=movieService.getScreeningPlanByPlanIdWithMovie(String.valueOf(planId));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");   
		    String time = df.format(screeningPlan.getScreeningTime());
		    screeningPlan.setScreeningTimeInString(time);
		    return "worker_plan";
		}
	}
	
	//显示编辑放映计划界面
	public String EditPlan(){
		this.movieList=(ArrayList<Movie>) movieService.getAllValidMovie();
		if(planId!=null&& !planId.equals("")){
			screeningPlan=movieService.getScreeningPlanByPlanIdWithMovie(planId);
		}
		return "worker_makePlan";
	}
	
	//查看放映计划界面
	public String ShowPlan(){
		this.screeningPlan=movieService.getScreeningPlanByPlanIdWithMovie(planId);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");   
	    String time = df.format(screeningPlan.getScreeningTime());
	    screeningPlan.setScreeningTimeInString(time);
	    return "worker_plan";
	}
	
	//审核申请计划
	public String AcceptPlan(){
		movieService.acceptScreeningPlan(planId);
		this.setTodo("review");
		return this.execute();
	}
	
	//选座界面
	public String ChooseSeat(){
		screeningPlan=movieService.getScreeningPlanByPlanIdWithMovie(planId);
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");   
	    String time = df.format(screeningPlan.getScreeningTime());
	    screeningPlan.setScreeningTimeInString(time);
		if(((User) session.get("user")).getRole().equals("member")){
			return "member_choose";
		}else{
			return "worker_choose";
		}
	}
	
	//订单确认界面
	public String ConfirmOrder(){
		int seatPrice=movieService.getPriceByPlanId(planId);
		screeningPlan=movieService.getScreeningPlanByPlanIdWithMovie(planId);
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");   
	    String time = df.format(screeningPlan.getScreeningTime());
	    screeningPlan.setScreeningTimeInString(time);
	    seatString="";
	    for(int i=0;i<seat.length;i++){
	    	char row=seat[i].charAt(4);
	    	char column=seat[i].charAt(5);
	    	int x=(int)row-(int)'0';
	    	int y=(int)column-(int)'0';
	    	seat[i]=(x+1)+"排"+y+"座,";
	    	seatString=seatString+seat[i];
	    }
		int total=seat.length*seatPrice;
		price=String.valueOf(total);
		if(((User) session.get("user")).getRole().equals("member")){
			User user=(User) session.get("user");
			float discountTotal=orderService.getDiscountPricebyMemberId(String.valueOf(user.getInformation().getMemberId()),total );
			discountPrice=String.valueOf(discountTotal);
			float balance=orderService.getBalanceByMemberId(String.valueOf(user.getInformation().getMemberId()));
			if(balance>=discountTotal){
				todo="buy";
			}else{
				todo="recharge";
			}
			return "member_orderConfirm";
		}else{
			return "worker_orderConfirm";
		}
	}
}
