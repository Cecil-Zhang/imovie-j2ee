package com.imovie.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="tb_recharge")
public class Recharge extends BaseBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer rechargeId;
	private Timestamp rechargeTime;
	@Transient
	private String rechargeTimeInString;
	private Integer amount;
	
	@ManyToOne(cascade = {CascadeType.MERGE})
	@JoinColumn(name="userId")
	private User user;

	public Integer getRechargeId() {
		return rechargeId;
	}

	public void setRechargeId(Integer rechargeId) {
		this.rechargeId = rechargeId;
	}

	public Timestamp getRechargeTime() {
		return rechargeTime;
	}

	public void setRechargeTime(Timestamp rechargeTime) {
		this.rechargeTime = rechargeTime;
	}

	public String getRechargeTimeInString() {
		return rechargeTimeInString;
	}

	public void setRechargeTimeInString(String rechargeTimeInString) {
		this.rechargeTimeInString = rechargeTimeInString;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
