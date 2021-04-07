package com.greedy.shortcut.board.model.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProjectDTO {

	private int pjtNo;
	private String projectName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-mm-dd HH:mm:ss SSS", timezone = "Asia/Seoul")
	private java.sql.Date projectStartDate;
	private String projectDelYN;
	private int memberNo;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-mm-dd HH:mm:ss SSS", timezone = "Asia/Seoul")
	private java.sql.Date projectEndDate;
	private String projectColor;
	
	
	public ProjectDTO() {}


	public ProjectDTO(int pjtNo, String projectName, Date projectStartDate, String projectDelYN, int memberNo,
			Date projectEndDate, String projectColor) {
		super();
		this.pjtNo = pjtNo;
		this.projectName = projectName;
		this.projectStartDate = projectStartDate;
		this.projectDelYN = projectDelYN;
		this.memberNo = memberNo;
		this.projectEndDate = projectEndDate;
		this.projectColor = projectColor;
	}


	public int getPjtNo() {
		return pjtNo;
	}


	public String getProjectName() {
		return projectName;
	}


	public java.sql.Date getProjectStartDate() {
		return projectStartDate;
	}


	public String getProjectDelYN() {
		return projectDelYN;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public java.sql.Date getProjectEndDate() {
		return projectEndDate;
	}


	public String getProjectColor() {
		return projectColor;
	}


	public void setPjtNo(int pjtNo) {
		this.pjtNo = pjtNo;
	}


	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	public void setProjectStartDate(java.sql.Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}


	public void setProjectDelYN(String projectDelYN) {
		this.projectDelYN = projectDelYN;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public void setProjectEndDate(java.sql.Date projectEndDate) {
		this.projectEndDate = projectEndDate;
	}


	public void setProjectColor(String projectColor) {
		this.projectColor = projectColor;
	}


	@Override
	public String toString() {
		return "ProjectDTO [pjtNo=" + pjtNo + ", projectName=" + projectName + ", projectStartDate=" + projectStartDate
				+ ", projectDelYN=" + projectDelYN + ", memberNo=" + memberNo + ", projectEndDate=" + projectEndDate
				+ ", projectColor=" + projectColor + "]";
	}


	
	
	
}
