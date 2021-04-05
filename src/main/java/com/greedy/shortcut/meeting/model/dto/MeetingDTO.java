package com.greedy.shortcut.meeting.model.dto;

import java.sql.Date;
import java.sql.Time;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MeetingDTO {

	private int meetingNO;
	private String meetingName;
	private String meetingText;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-mm-dd HH:mm:ss SSS", timezone = "Asia/Seoul")
	private java.sql.Date enrollDate;
	private String status;
	private int sprintNo;
	
	public MeetingDTO() {}

	public MeetingDTO(int meetingNO, String meetingName, String meetingText, Date enrollDate, String status,
			int sprintNo) {
		super();
		this.meetingNO = meetingNO;
		this.meetingName = meetingName;
		this.meetingText = meetingText;
		this.enrollDate = enrollDate;
		this.status = status;
		this.sprintNo = sprintNo;
	}

	public int getMeetingNO() {
		return meetingNO;
	}

	public void setMeetingNO(int meetingNO) {
		this.meetingNO = meetingNO;
	}

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public String getMeetingText() {
		return meetingText;
	}

	public void setMeetingText(String meetingText) {
		this.meetingText = meetingText;
	}

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getSprintNo() {
		return sprintNo;
	}

	public void setSprintNo(int sprintNo) {
		this.sprintNo = sprintNo;
	}

	@Override
	public String toString() {
		return "MeetingDTO [meetingNO=" + meetingNO + ", meetingName=" + meetingName + ", meetingText=" + meetingText
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", sprintNo=" + sprintNo + "]";
	}

	
	
	
}
