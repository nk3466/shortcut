package com.greedy.shortcut.meeting.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;


@Controller
@RequestMapping("/meeting/*")
public class MeetingLogController {
	
	private List<MeetingDTO> meeting;

	@GetMapping("/meetinglog")
	public void meetinglog() {
				
	}
	
	@Autowired
	public MeetingLogController(List<MeetingDTO> meeting) {

		this.meeting = meeting;
	
	}
	
	@PostMapping(value="/meetinglog", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String meeting(HttpServletRequest request, Model model) throws JsonProcessingException {
		
		String date2 = (String) model.getAttribute("meetingDate");
		String date = request.getParameter("meetingDate");
		
		
		System.out.println("요기 :" + date);
		System.out.println("요기 :" + date2);
		
		return date;
	}
}
