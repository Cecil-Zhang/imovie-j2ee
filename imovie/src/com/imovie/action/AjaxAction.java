package com.imovie.action;

import java.util.List;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;

import com.imovie.model.Memberinfo;
import com.imovie.model.ScreeningPlan;
import com.imovie.model.User;
import com.imovie.service.ManagerService;
import com.imovie.service.MovieService;
import com.imovie.service.OrderService;
import com.imovie.service.UserService;

public class AjaxAction extends BaseAction {
	@Autowired
	private UserService userService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private OrderService orderService;
	
	private String userId;
	private String password;
	private String role;
	private String movieId;
	private List<ScreeningPlan> planList;
	private boolean loginFlag;
	private String bank;
	private String bankAccount;
	private String price;
	private String balance;
	private String credit;
	private String screeningTime;
	private String videoHall;
	private String planId;
	
	//根据电影ID查找放映计划
	public String FetchPlanByMovieId(){
		planList=movieService.getAllValidScreeningPlanByMovieId(movieId);
		for(ScreeningPlan p:planList){
			System.out.println(p.getPlanId());
		}
		return "FetchPlanByMovieId";
	}
	
	//登录检查
	public String Login(){
		if(userService.loginUser(userId, password, role)!=null){
			loginFlag=true;
		}else{
			loginFlag=false;
		}
		return "Login";
	}
	
	//充值前信息检查
	public String RechargeCheck(){
		User user=(User) session.get("user");
		Memberinfo info=user.getInformation();
		if(info.getBank().equals(bank) && info.getBankAccout().equals(bankAccount)
				&& user.getPassword().equals(password)){
			loginFlag=true;
		}else{
			loginFlag=false;
		}
		System.out.println(loginFlag);
		return "RechargeCheck";
	}
	
	//工作人员购票时检查账户余额
	public String CheckBalance(){
		User user=userService.getUserByUserId(userId);
		if(user==null){
			loginFlag=false;
		}else{
			loginFlag=true;
			float discountTotal=orderService.getDiscountPricebyMemberId(String.valueOf(user.getInformation().getMemberId()),Integer.parseInt(price) );
			price=String.valueOf(discountTotal);
			float bal=orderService.getBalanceByMemberId(String.valueOf(user.getInformation().getMemberId()));
			balance=String.valueOf(bal);
		}
		
		return "CheckBalance";
	}
	
	//会员暂停资格
	public String CancelQualify(){
		User user=(User) session.get("user");
		if(userService.stopQualifyForUser(user)){
			loginFlag=true;
		}else{
			loginFlag=false;
		}
		User newU=userService.getUserByUserId(String.valueOf(user.getUserId()));
		session.put("user", newU);
		return "CancelQualify";
	}
	
	//会员兑换积分
	public String CreditExchange(){
		User user=(User) session.get("user");
		if(user.getInformation().getCredit()<Integer.parseInt(credit)){
			loginFlag=false;
		}else{
			userService.creditExchangeForUser(user, credit);
			user=userService.getUserByUserId(String.valueOf(user.getUserId()));
			session.put("user", user);
			credit=String.valueOf(user.getInformation().getCredit());
			balance=String.valueOf(user.getInformation().getBalance());
			loginFlag=true;
		}
		
		return "CreditExchange";
	}
	
	//放映厅判断放映时间是否繁忙
	public String CheckTimeForHall(){
		loginFlag=movieService.checkTimeFreeForScreeningPlan(screeningTime, videoHall,planId);
		System.out.println(loginFlag);
		return "CheckTimeForHall";
	}
	
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public List<ScreeningPlan> getPlanList() {
		return planList;
	}
	public void setPlanList(List<ScreeningPlan> planList) {
		this.planList = planList;
	}

	public boolean isLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(boolean loginFlag) {
		this.loginFlag = loginFlag;
	}

	@JSON(serialize=false)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@JSON(serialize=false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@JSON(serialize=false)
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@JSON(serialize=false)
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	@JSON(serialize=false)
	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getScreeningTime() {
		return screeningTime;
	}

	public void setScreeningTime(String screeningTime) {
		this.screeningTime = screeningTime;
	}

	public String getVideoHall() {
		return videoHall;
	}

	public void setVideoHall(String videoHall) {
		this.videoHall = videoHall;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}
}
