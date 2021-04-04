package com.greedy.shortcut.meeting.model.dto;

import java.sql.Date;
import java.sql.Time;

public class MeetingDTO {

	private String title;
	private String content;
	private java.sql.Date meetingDate;
	private java.sql.Time startTime;
	private java.sql.Time endTime;
	
	public MeetingDTO() {}

	public MeetingDTO(String title, String content, Date meetingDate, Time startTime, Time endTime) {
		super();
		this.title = title;
		this.content = content;
		this.meetingDate = meetingDate;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Date getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(java.sql.Date meetingDate) {
		this.meetingDate = meetingDate;
	}

	public java.sql.Time getStartTime() {
		return startTime;
	}

	public void setStartTime(java.sql.Time startTime) {
		this.startTime = startTime;
	}

	public java.sql.Time getEndTime() {
		return endTime;
	}

	public void setEndTime(java.sql.Time endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "MeetingDTO [title=" + title + ", content=" + content + ", meetingDate=" + meetingDate + ", startTime="
				+ startTime + ", endTime=" + endTime + "]";
	}
	
	
	
}
