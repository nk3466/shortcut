package com.greedy.shortcut.meeting.controller;


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
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.meeting.model.service.MeetingService;


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
	public String meeting(@ModelAttribute MeetingDTO meeting, RedirectAttributes rttr){
	
		if(!meetingService.insertMeeting(meeting)) {
			
		}
		System.out.println("meeting : " + meeting);
		
		rttr.addFlashAttribute("message","회의 내용이 등록 되었습니다.");
		
		return "redirect:/";
	}
}
