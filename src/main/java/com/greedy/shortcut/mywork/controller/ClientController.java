package com.greedy.shortcut.mywork.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.mywork.model.dto.ProjectInfoTest;
import com.greedy.shortcut.mywork.model.service.ClientService;

@Controller
@RequestMapping("/*")
public class ClientController {

	private final ClientService clientService;
	
	@Autowired
	public ClientController(ClientService clientService) {
		this.clientService = clientService;
	}
	
	@GetMapping("mywork/client")
	public String client(Model model, HttpServletRequest request/* , Principal principal */) {
		
		MemberDTO selectMem = clientService.selectMem(); 
		System.out.println("selectMem : " + selectMem);
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		System.out.println("username : " + userDetails.getUsername());
		System.out.println("password : " + userDetails.getPassword());
		System.out.println("toString : " + userDetails.toString());
//		String email = principal.getName();
//		Object cl = principal.getClass();
//		System.out.println("cl : " + cl);
		
		/* session 값 확인하기 */
		HttpSession session = request.getSession();
		String session_name = "";
		String session_value = "";
		Enumeration enum_01 = session.getAttributeNames(); 
		int i = 0;
		while(enum_01.hasMoreElements()) {
			i++;
			session_name = enum_01.nextElement().toString();
			session_value = session.getAttribute(session_name).toString();
			System.out.println("SESSION NAME[ " + session_name + " ] SESSION VALUE[ " + session_value + " ]");
		}
		/*====*/
		
		/*
		 * List<ClientProjectDTO> projectList = clientService.selectProjectList(email);
		 * for(ClientProjectDTO project : projectList) { System.out.println(project); }
		 */
		
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
	
	@GetMapping(value="mywork/projectInfo", produces="application/json; charset=UTF-8")
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
	
	@GetMapping(value="mywork/client/projectInfo/{flag}")
	public String selectProjectInfo(Model model, @PathVariable("flag") int flag) {
		
		System.out.println("flag : " + flag);
		
		model.addAttribute("message", flag + "번 프로젝트");
		
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
	
}
