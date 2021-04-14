package com.greedy.shortcut.board.model.dto;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CardDTO {

	private int no;
	private String title;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-mm-dd HH:mm:ss SSS", timezone = "Asia/Seoul")
	private java.sql.Date EnrollDate;
	private String delNo;
	private int brdNo;
	private int order;
	private int type;
	private int memNo;
	private String txt;
	private List<Integer> memberList;
	private int member; //담당자

	private List<CardScheduleDTO> cardScheduleDTO;
	private List<CardTaskDTO> cardTaskDTO;
	
	public CardDTO() {}

	public CardDTO(int no, String title, Date enrollDate, String delNo, int brdNo, int order, int type, int memNo,
			String txt, List<Integer> memberList, int member, List<CardScheduleDTO> cardScheduleDTO,
			List<CardTaskDTO> cardTaskDTO) {
		super();
		this.no = no;
		this.title = title;
		EnrollDate = enrollDate;
		this.delNo = delNo;
		this.brdNo = brdNo;
		this.order = order;
		this.type = type;
		this.memNo = memNo;
		this.txt = txt;
		this.memberList = memberList;
		this.member = member;
		this.cardScheduleDTO = cardScheduleDTO;
		this.cardTaskDTO = cardTaskDTO;
	}

	@Override
	public String toString() {
		return "CardDTO [no=" + no + ", title=" + title + ", EnrollDate=" + EnrollDate + ", delNo=" + delNo + ", brdNo="
				+ brdNo + ", order=" + order + ", type=" + type + ", memNo=" + memNo + ", txt=" + txt + ", memberList="
				+ memberList + ", member=" + member + ", cardScheduleDTO=" + cardScheduleDTO + ", cardTaskDTO="
				+ cardTaskDTO + "]";
	}

	public int getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public java.sql.Date getEnrollDate() {
		return EnrollDate;
	}

	public String getDelNo() {
		return delNo;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public int getOrder() {
		return order;
	}

	public int getType() {
		return type;
	}

	public int getMemNo() {
		return memNo;
	}

	public String getTxt() {
		return txt;
	}

	public List<Integer> getMemberList() {
		return memberList;
	}

	public int getMember() {
		return member;
	}

	public List<CardScheduleDTO> getCardScheduleDTO() {
		return cardScheduleDTO;
	}

	public List<CardTaskDTO> getCardTaskDTO() {
		return cardTaskDTO;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		EnrollDate = enrollDate;
	}

	public void setDelNo(String delNo) {
		this.delNo = delNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public void setMemberList(List<Integer> memberList) {
		this.memberList = memberList;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public void setCardScheduleDTO(List<CardScheduleDTO> cardScheduleDTO) {
		this.cardScheduleDTO = cardScheduleDTO;
	}

	public void setCardTaskDTO(List<CardTaskDTO> cardTaskDTO) {
		this.cardTaskDTO = cardTaskDTO;
	}

	
	

}
