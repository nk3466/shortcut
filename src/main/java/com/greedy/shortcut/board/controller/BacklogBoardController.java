package com.greedy.shortcut.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.board.model.service.BacklogService;
import com.greedy.shortcut.board.model.service.ProjectBoardService;

@Controller
@RequestMapping("/board/*")
public class BacklogBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectBoardController.class);
	private final BacklogService backlogService;
	
	@Autowired
	public BacklogBoardController(BacklogService backlogService) {
		this.backlogService = backlogService;
	}

	@GetMapping("backlog/{pjtNo}")
	public String project(Model model, @PathVariable("pjtNo") int pjtNo) {
		
		ProjectDTO project = backlogService.selectProjectList(pjtNo);
		
		System.out.println("project는 : " + project);
		
		List<ProjectAuthorityDTO> memberList = backlogService.selectMemberList(pjtNo);
		
		for(ProjectAuthorityDTO member : memberList) {
			System.out.println("프로젝트 멤버 :" + memberList);
		}
		
		model.addAttribute("projectList", project);
		model.addAttribute("memberList", memberList);
		return "board/backlog";
	}
}
