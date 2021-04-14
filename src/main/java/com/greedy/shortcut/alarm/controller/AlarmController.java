package com.greedy.shortcut.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.alarm.model.service.AlarmService;

@Controller
@RequestMapping("/*")
public class AlarmController {

	private final AlarmService alarmService;
	
	@Autowired
	public AlarmController(AlarmService alarmService) {
		this.alarmService = alarmService;
	}
	
//	@GetMapping(value="alarm/github", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public String selectGitUrl(@RequestParam int memNo, Model model	) throws JsonProcessingException {
//		
//		String gitUrl = alarmService.selectGitUrl(memNo);
//		model.addAttribute("gitUrl", gitUrl);
//		
//		return new ObjectMapper().writeValueAsString(gitUrl);
//	}
	
	@PostMapping("alarm/github/regist")
	public ModelAndView registGitUrl(ModelAndView mv, @RequestParam(required=true) String githubInfo, @RequestParam int memNo) {
		
		int success = alarmService.registGitUrl(memNo, githubInfo);
		System.out.println("success : " + success);
		
		String gitUrl = alarmService.selectGitUrl(memNo);
		
		mv.addObject("gitUrl", gitUrl);
		mv.setViewName("redirect:/");
		
		return mv;
	}
}
