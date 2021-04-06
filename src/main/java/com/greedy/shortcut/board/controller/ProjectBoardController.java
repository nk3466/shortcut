package com.greedy.shortcut.board.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.board.model.service.ProjectBoardService;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/board/*")
public class ProjectBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectBoardController.class);
	private final ProjectBoardService projectBoardService;

	@Autowired
	public ProjectBoardController(ProjectBoardService projectBoardService) {
		this.projectBoardService = projectBoardService;
	}

	@GetMapping("project_board")
	public void project() {
	}

	@PostMapping("/project_regist")
	@ResponseBody
	public String registProject(@ModelAttribute ProjectDTO project,
			@ModelAttribute ProjectAuthorityDTO projectAuthority, HttpServletRequest request) {

		System.out.println(project);
		System.out.println(projectAuthority);
		/* model key value 값 출력 */
		SortedMap<String, String[]> projectMake = Collections
				.synchronizedSortedMap(new TreeMap<String, String[]>(request.getParameterMap()));

		synchronized (projectMake) {

			for (String key : projectMake.keySet()) {
				String[] value = projectMake.get(key);

				for (int i = 0; i < value.length; i++) {
					System.out.println(key + " : " + value[i]);
				}
			}
		}

		
		SimpleDateFormat qwe = new SimpleDateFormat("yyyy-mm-dd");

		/*
		 * for(int i = 0; i < projectMake.get(key); i++) {
		 * 
		 * }
		 */
		 
		//projectAuthority.getMember().setEmail(((String[]) projectMake.get("nk[0][value]"))[0]); // 멤버 이메일
		// projectAuthority.set
		// project.setProjectStartDate(java.sql.Date.valueOf(((String[])projectMake.get("nk[1][value]"))[0]));
		// //project 시작 날짜

		return "";
	}
	/* 이메일 유무  체크*/
	@PostMapping(value="projectidDupCheck", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int idprojectcheck(@ModelAttribute MemberDTO member, HttpServletRequest request) {
		
		System.out.println(member);
		int result = projectBoardService.idprojectcheck(member);
		return result;
	}
}
