package com.imovie.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="tb_order")
public class Order extends BaseBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderId;
	private String orderSeat;
	private Timestamp purchaseTime;
	private Float orderPrice;
	private Integer orderCredit;
	private Boolean orderState;
	@Transient
	private String purchaseTimeInString;
	
	@ManyToOne(cascade={CascadeType.REFRESH})
	@JoinColumn(name="userId")
	private User owner;
	
	@ManyToOne(cascade={CascadeType.REFRESH},optional=false)
	@JoinColumn(name="planId")
	private ScreeningPlan purchaseMovie;
	
	@OneToMany(cascade={CascadeType.ALL},mappedBy="order")
	private List<Answer> answerList=new ArrayList<Answer>();

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderSeat() {
		return orderSeat;
	}

	public void setOrderSeat(String orderSeat) {
		this.orderSeat = orderSeat;
	}

	public Timestamp getPurchaseTime() {
		return purchaseTime;
	}

	public void setPurchaseTime(Timestamp purchaseTime) {
		this.purchaseTime = purchaseTime;
	}

	public Float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Integer getOrderCredit() {
		return orderCredit;
	}

	public void setOrderCredit(Integer orderCredit) {
		this.orderCredit = orderCredit;
	}

	public Boolean getOrderState() {
		return orderState;
	}

	public void setOrderState(Boolean orderState) {
		this.orderState = orderState;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public ScreeningPlan getPurchaseMovie() {
		return purchaseMovie;
	}

	public void setPurchaseMovie(ScreeningPlan purchaseMovie) {
		this.purchaseMovie = purchaseMovie;
	}

	public List<Answer> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}

	public String getPurchaseTimeInString() {
		return purchaseTimeInString;
	}

	public void setPurchaseTimeInString(String purchaseTimeInString) {
		this.purchaseTimeInString = purchaseTimeInString;
	}
	
}
