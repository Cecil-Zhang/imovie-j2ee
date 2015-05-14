package com.imovie.model;

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

import org.apache.struts2.json.annotations.JSON;
@Entity
@Table(name="tb_movie")
public class Movie extends BaseBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer movieId;
	private String name;
	private String poster;
	private String type;
	private Integer duration;
	private String description;
	private String movieState;
	
	@OneToMany(mappedBy="movie")
	private List<ScreeningPlan> planList=new ArrayList<ScreeningPlan>();
	
	@JSON(serialize=false)
	public List<ScreeningPlan> getPlanList() {
		return planList;
	}
	public void setPlanList(List<ScreeningPlan> planList) {
		this.planList = planList;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMovieState() {
		return movieState;
	}
	public void setMovieState(String movieState) {
		this.movieState = movieState;
	}
	
}
