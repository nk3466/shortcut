package com.greedy.shortcut.meeting.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meeting/*")
public class MeetingLogController {

	@GetMapping("meetinglog")
	public void meetinglog(HttpServletRequest request) {
		
		String date = request.getParameter("meetingDate");
		System.out.println(date);
		
	}
}
