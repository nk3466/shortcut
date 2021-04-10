package com.greedy.shortcut.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.board.model.service.BacklogService;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.common.paging.Pagenation;


@Controller
@RequestMapping("/board/*")
public class BacklogBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectBoardController.class);
	private final BacklogService backlogService;

	@Autowired
	public BacklogBoardController(BacklogService backlogService) {
		this.backlogService = backlogService;
	}


	@GetMapping("backlog")
	public String project(Model model, @RequestParam(name="pjtNo") int pjtNo) {

		ProjectDTO project = backlogService.selectProjectList(pjtNo);

		System.out.println("project는 : " + project);

		List<ProjectAuthorityDTO> memberList = backlogService.selectMemberList(pjtNo);

		for(ProjectAuthorityDTO member : memberList) {
			System.out.println("프로젝트 멤버 :" + member);
		}

		/* =================== 종료된 백로그(스프린트) =================== */
		int pageNo = 1;
		int totalCount = 0;

		List<BacklogDTO> allfinishSprintList = backlogService.selectFinishSprint(pjtNo);
		for(BacklogDTO backlog : allfinishSprintList) {
			System.out.println(backlog);
		}

		/* 총 개수 */
		totalCount = allfinishSprintList.size();

		int limit = 5;
		int buttonAmount = 3;
		
		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		System.out.println(pageInfo);
		//		logger.debug("finishSpringList :::::::::::::::::::: " + finishSprintList);
		List<BacklogDTO> finishSprintList = backlogService.selectPagingFinishSprint(pjtNo, pageInfo);
		System.out.println();
		for(BacklogDTO pagingBacklog : finishSprintList) {
			System.out.println(pagingBacklog);
		}
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("finishSprintList", finishSprintList);
		/* =================== 종료된 백로그(스프린트) =================== */

		model.addAttribute("projectList", project);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pjtNo", pjtNo);

		return "board/backlog";
	}

	

}
