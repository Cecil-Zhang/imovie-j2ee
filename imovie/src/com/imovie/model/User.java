package com.imovie.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tb_user")
public class User extends BaseBean {
	@Id
	private BigDecimal userId;
	private String password;
	private String role;
	
	@OneToOne(cascade = {CascadeType.ALL},optional=false)
	@JoinColumn(name = "memberId",unique=true)
	private Memberinfo information;
	
	@OneToMany(mappedBy = "user")
	private List<Recharge> rechargeList=new ArrayList<Recharge>();
	
	@OneToMany(mappedBy = "owner")
	private List<Order> orderList=new ArrayList<Order>();
	
	public BigDecimal getUserId() {
		return userId;
	}
	public void setUserId(BigDecimal userId) {
		this.userId = userId;
	}
	public Memberinfo getInformation() {
		return information;
	}
	public void setInformation(Memberinfo information) {
		this.information = information;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public List<Recharge> getRechargeList() {
		return rechargeList;
	}
	public void setRechargeList(List<Recharge> rechargeList) {
		this.rechargeList = rechargeList;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
}
