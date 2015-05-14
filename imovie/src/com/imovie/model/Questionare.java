package com.imovie.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tb_questionare")
public class Questionare extends BaseBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer questionId;
	private Boolean questionType;
	private Integer questionCredit;
	private String title;
	private String answerA;
	private String answerB;
	private String answerC;
	private String correct;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade={CascadeType.MERGE})
	@JoinColumn(name="activityId")
	private Activity belongActivity;
	
	public Activity getBelongActivity() {
		return belongActivity;
	}
	public void setBelongActivity(Activity belongActivity) {
		this.belongActivity = belongActivity;
	}
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public Boolean getQuestionType() {
		return questionType;
	}
	public void setQuestionType(Boolean questionType) {
		this.questionType = questionType;
	}
	public Integer getQuestionCredit() {
		return questionCredit;
	}
	public void setQuestionCredit(Integer questionCredit) {
		this.questionCredit = questionCredit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswerA() {
		return answerA;
	}
	public void setAnswerA(String answerA) {
		this.answerA = answerA;
	}
	public String getAnswerB() {
		return answerB;
	}
	public void setAnswerB(String answerB) {
		this.answerB = answerB;
	}
	public String getAnswerC() {
		return answerC;
	}
	public void setAnswerC(String answerC) {
		this.answerC = answerC;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	
}
