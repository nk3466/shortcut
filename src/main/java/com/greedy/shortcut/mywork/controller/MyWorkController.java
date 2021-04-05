package com.greedy.shortcut.mywork.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.mywork.model.dto.ProjectInfoTest;

@Controller
@RequestMapping("/mywork/*")
public class MyWorkController {

	@GetMapping("/mywork")
	public void mywork() {}
	
	@GetMapping("/client")
	public String client(Model model) {
		
		List<Object> testList = new ArrayList<>();
		testList.add(new String("A"));
		testList.add(new String("B"));
		testList.add(new String("C"));
		testList.add(new String("D"));
		testList.add(new String("E"));
		testList.add(new String("F"));
		testList.add(new String("G"));
		testList.add(new String("H"));
		testList.add(new String("I"));
		testList.add(new String("J"));
		testList.add(new String("K"));
		testList.add(new String("L"));
		testList.add(new String("M"));
		testList.add(new String("N"));
		testList.add(new String("O"));
		testList.add(new String("P"));
		testList.add(new String("Q"));
		testList.add(new String("R"));
		testList.add(new String("S"));
		testList.add(new String("T"));
		testList.add(new String("U"));
		testList.add(new String("V"));
		
		model.addAttribute("testList", testList);
		
		return "mywork/client";
	}
	
	@GetMapping(value="/projectInfo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getProjectInfo() throws JsonProcessingException {
		
		List<ProjectInfoTest> projectTestList = new ArrayList<>();
		
		Calendar startDate = new GregorianCalendar(2021, 4, 4);
		Date stDate = new Date(startDate.getTimeInMillis());
		Calendar endDate = new GregorianCalendar(2021, 4, 30);
		Date enDate = new Date(endDate.getTimeInMillis());
		
//		Date from = new Date();
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String to = transFormat.format(from);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String s = transFormat.format(stDate);
		System.out.println(s);
		String e = transFormat.format(enDate);
		System.out.println(e);
		
		String s2 = s.substring(5);
		String e2 = e.substring(5);
		System.out.println(s2);
		System.out.println(e2);
		
		
		projectTestList.add(new ProjectInfoTest("project1", "test1", stDate, enDate));
		//System.out.println(projectTestList);
		//System.out.println(projectTestList.get(0));
		//System.out.println(new ObjectMapper().writeValueAsString(projectTestList));
		
		return new ObjectMapper().writeValueAsString(projectTestList);
	}
}
