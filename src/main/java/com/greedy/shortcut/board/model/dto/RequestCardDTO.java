package com.greedy.shortcut.board.model.dto;

import java.sql.Date;
import java.util.List;

public class RequestCardDTO {
	
	private int no;
	private String title;
	private java.sql.Date enrollDate;
	private String delNo;
	private int brdNo;
	private int order;
	private int type;
	private int memNo;
	private String txt;
	private List<CardAttendListDTO> memberList;
	private int member; //담당자
	private String place;
	private int alert;

	private String scheduleStartDate;
	private String scheduleEndDate;
	private java.sql.Date taskStartDate;
	private java.sql.Date taskEndDate;
	
	public RequestCardDTO() {}

	public RequestCardDTO(int no, String title, Date enrollDate, String delNo, int brdNo, int order, int type,
			int memNo, String txt, List<CardAttendListDTO> memberList, int member, String place, int alert,
			String scheduleStartDate, String scheduleEndDate, Date taskStartDate, Date taskEndDate) {
		super();
		this.no = no;
		this.title = title;
		this.enrollDate = enrollDate;
		this.delNo = delNo;
		this.brdNo = brdNo;
		this.order = order;
		this.type = type;
		this.memNo = memNo;
		this.txt = txt;
		this.memberList = memberList;
		this.member = member;
		this.place = place;
		this.alert = alert;
		this.scheduleStartDate = scheduleStartDate;
		this.scheduleEndDate = scheduleEndDate;
		this.taskStartDate = taskStartDate;
		this.taskEndDate = taskEndDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getDelNo() {
		return delNo;
	}

	public void setDelNo(String delNo) {
		this.delNo = delNo;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public List<CardAttendListDTO> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<CardAttendListDTO> memberList) {
		this.memberList = memberList;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getAlert() {
		return alert;
	}

	public void setAlert(int alert) {
		this.alert = alert;
	}

	public String getScheduleStartDate() {
		return scheduleStartDate;
	}

	public void setScheduleStartDate(String scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}

	public String getScheduleEndDate() {
		return scheduleEndDate;
	}

	public void setScheduleEndDate(String scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}

	public java.sql.Date getTaskStartDate() {
		return taskStartDate;
	}

	public void setTaskStartDate(java.sql.Date taskStartDate) {
		this.taskStartDate = taskStartDate;
	}

	public java.sql.Date getTaskEndDate() {
		return taskEndDate;
	}

	public void setTaskEndDate(java.sql.Date taskEndDate) {
		this.taskEndDate = taskEndDate;
	}

	@Override
	public String toString() {
		return "RequestCardDTO [no=" + no + ", title=" + title + ", enrollDate=" + enrollDate + ", delNo=" + delNo
				+ ", brdNo=" + brdNo + ", order=" + order + ", type=" + type + ", memNo=" + memNo + ", txt=" + txt
				+ ", memberList=" + memberList + ", member=" + member + ", place=" + place + ", alert=" + alert
				+ ", scheduleStartDate=" + scheduleStartDate + ", scheduleEndDate=" + scheduleEndDate
				+ ", taskStartDate=" + taskStartDate + ", taskEndDate=" + taskEndDate + "]";
	}
	
	
	
}	
