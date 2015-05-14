package com.imovie.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tb_answer")
public class Answer extends BaseBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer answerId;
	private String answer;
	private Integer prizeCredit;
	
	@OneToOne(fetch=FetchType.EAGER,cascade={CascadeType.ALL},optional=false)
	@JoinColumn(name="questionId")
	private Questionare questionare;
	
	@ManyToOne(cascade={CascadeType.REFRESH},optional=false)
	@JoinColumn(name="orderId")
	private Order order;

	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getPrizeCredit() {
		return prizeCredit;
	}

	public void setPrizeCredit(Integer prizeCredit) {
		this.prizeCredit = prizeCredit;
	}

	public Questionare getQuestionare() {
		return questionare;
	}

	public void setQuestionare(Questionare questionare) {
		this.questionare = questionare;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
}
