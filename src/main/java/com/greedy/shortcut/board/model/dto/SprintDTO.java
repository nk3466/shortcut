package com.greedy.shortcut.board.model.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SprintDTO {
	
	private int sprNo;
	private String sprName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date sprStardDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date sprEndDate;
	private String sprGoal;
	private String sprDelYn;
	private int sprBlgNo;
	
	
	public SprintDTO() {}

	public SprintDTO(int sprNo, String sprName, Date sprStardDate, Date sprEndDate, String sprGoal, String sprDelYn,
			int sprBlgNo) {
		super();
		this.sprNo = sprNo;
		this.sprName = sprName;
		this.sprStardDate = sprStardDate;
		this.sprEndDate = sprEndDate;
		this.sprGoal = sprGoal;
		this.sprDelYn = sprDelYn;
		this.sprBlgNo = sprBlgNo;
	}

	public int getSprNo() {
		return sprNo;
	}

	public String getSprName() {
		return sprName;
	}

	public Date getSprStardDate() {
		return sprStardDate;
	}

	public Date getSprEndDate() {
		return sprEndDate;
	}

	public String getSprGoal() {
		return sprGoal;
	}

	public String getSprDelYn() {
		return sprDelYn;
	}

	public int getSprBlgNo() {
		return sprBlgNo;
	}

	public void setSprNo(int sprNo) {
		this.sprNo = sprNo;
	}

	public void setSprName(String sprName) {
		this.sprName = sprName;
	}

	public void setSprStardDate(Date sprStardDate) {
		this.sprStardDate = sprStardDate;
	}

	public void setSprEndDate(Date sprEndDate) {
		this.sprEndDate = sprEndDate;
	}

	public void setSprGoal(String sprGoal) {
		this.sprGoal = sprGoal;
	}

	public void setSprDelYn(String sprDelYn) {
		this.sprDelYn = sprDelYn;
	}

	public void setSprBlgNo(int sprBlgNo) {
		this.sprBlgNo = sprBlgNo;
	}

	@Override
	public String toString() {
		return "SprintDTO [sprNo=" + sprNo + ", sprName=" + sprName + ", sprStardDate=" + sprStardDate + ", sprEndDate="
				+ sprEndDate + ", sprGoal=" + sprGoal + ", sprDelYn=" + sprDelYn + ", sprBlgNo=" + sprBlgNo + "]";
	}

	
	
}
