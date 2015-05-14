package com.imovie.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tb_activity")
public class Activity extends BaseBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer activityId;
	private String activityState;
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy = "belongActivity")
	private List<Questionare> questions=new ArrayList<Questionare>();

	@OneToMany(fetch=FetchType.LAZY,cascade={CascadeType.MERGE},mappedBy = "activity")
	private List<ScreeningPlan> planList=new ArrayList<ScreeningPlan>();
	
	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	public String getActivityState() {
		return activityState;
	}

	public void setActivityState(String activityState) {
		this.activityState = activityState;
	}

	public List<Questionare> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Questionare> questions) {
		this.questions = questions;
	}

	public List<ScreeningPlan> getPlanList() {
		return planList;
	}

	public void setPlanList(List<ScreeningPlan> planList) {
		this.planList = planList;
	}
	
}
