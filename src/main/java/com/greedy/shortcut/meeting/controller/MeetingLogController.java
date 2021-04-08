package com.greedy.shortcut.meeting.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.meeting.model.dto.AttendListDTO;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.meeting.model.service.MeetingService;
import com.greedy.shortcut.member.model.dto.MemberDTO;


@Controller
@RequestMapping("/meeting/*")
public class MeetingLogController {
	
	private final MeetingService meetingService;

	@Autowired
	public MeetingLogController(MeetingService meetingService) {
		this.meetingService = meetingService;
		
	}
	
	@GetMapping("/meetinglog")
	public void meetinglog() {
			
	}
	
	
	@PostMapping(value="/meetinglog", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String meeting(@ModelAttribute MeetingDTO meeting, RedirectAttributes rttr, @ModelAttribute AttendListDTO memberList) throws JsonProcessingException{
	
		if(!meetingService.insertMeeting(meeting)) {
			
		}
		System.out.println("meeting : " + meeting);
		System.out.println("memberList : " + memberList);
		
		rttr.addFlashAttribute("message","회의 내용이 등록 되었습니다.");
		
		return new ObjectMapper().writeValueAsString(meeting);
	}
	
	@PostMapping(value="selectProjectMember", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberDTO> selectProjectMember(@ModelAttribute MemberDTO member) {
		
		List<MemberDTO> memberList = meetingService.selectProjectMember(member);
		
		System.out.println("프젝맴버" + memberList);
		
		return memberList;
		
		
	}
}
