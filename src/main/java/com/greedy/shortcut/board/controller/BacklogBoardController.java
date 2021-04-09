package com.greedy.shortcut.board.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.board.model.service.BacklogService;
import com.greedy.shortcut.member.model.dto.MemberDTO;


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
			System.out.println("프로젝트 멤버 :" + member);
		}

		/* 종료된 백로그(스프린트) */
		System.out.println("pjtNo : " + pjtNo);
		List<BacklogDTO> finishSprintList = backlogService.selectFinishSprint(pjtNo);
		for(BacklogDTO backlog : finishSprintList) {
			System.out.println(backlog);
		}
		model.addAttribute("finishSprintList", finishSprintList);
		/* 종료된 백로그(스프린트) */

		model.addAttribute("projectList", project);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pjtNo", pjtNo);
		
		return "board/backlog";
	}
	
	/* 이메일 유무  체크*/
	@PostMapping(value="/projectidDupCheckEdit" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public int idprojectcheck(@ModelAttribute MemberDTO member, HttpServletRequest request) {
		
		System.out.println(member);
		int result = backlogService.idprojectcheck(member);
		return result;
	}
	
	/* 프로젝트 수정 */
	@PostMapping(value="backlog/project_edit" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String EditProject(HttpSession httpsession,		
			@ModelAttribute ProjectDTO project,
			HttpServletRequest request, RedirectAttributes rttr) throws JsonProcessingException {
		
		System.out.println(project);
		
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
		/*회원 정보 담기*/
		 List<ProjectAuthorityDTO> projectMemberList = new ArrayList<>();
		 
		 for(int i = 0; i < (projectMake.size() - 4)/2; i++) {
			 ProjectAuthorityDTO projectAuthority = new ProjectAuthorityDTO();
			  
			 projectAuthority.setMemberNo(Integer.parseInt(((String[]) projectMake.get("nk1[" + i + "][value]"))[0]));
			 i++;
			 projectAuthority.setProjectRole(Integer.parseInt(((String[]) projectMake.get("nk1[" + i + "][value]"))[0]));
			 
			 projectMemberList.add(projectAuthority);
		 }
			
			if (!backlogService.insertEditProject(project) 
					|| !backlogService.insertEditProjectMember(project, projectMemberList)	) {
			 rttr.addFlashAttribute("message","프로젝트 수정이 취소되었습니다.");
				return new ObjectMapper().writeValueAsString(project);
		 }
			 rttr.addFlashAttribute("message","프로젝트가 수정되었습니다.");
			 return new ObjectMapper().writeValueAsString(project);
		//return "/board/backlog";
	}
	
	
	/*프로젝트 삭제*/
	@PostMapping(value="/backlogRemove" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String removeProject(@ModelAttribute ProjectDTO project, RedirectAttributes rttr) throws JsonProcessingException {
	
		System.out.println("워후 : " + project);
		
		
		if(!backlogService.removeProject(project)) {
			rttr.addFlashAttribute("message","프로젝트 삭제가 취소되었습니다.");
		}else {
			rttr.addFlashAttribute("message","프로젝트가 삭제되었습니다.");	
		}
		
		return new ObjectMapper().writeValueAsString(project);
	}
	
}
