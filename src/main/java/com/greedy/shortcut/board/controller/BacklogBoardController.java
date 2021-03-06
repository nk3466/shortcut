package com.greedy.shortcut.board.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.board.model.dto.SprintDTO;
import com.greedy.shortcut.board.model.service.BacklogService;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.common.paging.Pagenation;
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

	

	@GetMapping("backlog")
	public String project(Model model, @RequestParam(name="pjtNo") int pjtNo, @RequestParam(name="projectName") String projectName
	/* , @RequestParam(name="blgNo1") int blgNo */
			) {
		/* ???????????? ????????? */
		ProjectDTO project = backlogService.selectProjectList(pjtNo);

		/* ???????????? ?????? ?????? */
		List<ProjectAuthorityDTO> memberList = backlogService.selectMemberList(pjtNo);
		
		for(ProjectAuthorityDTO member : memberList) {
			System.out.println("???????????? ?????? :" + member);
		}
		
		/* ????????? ????????? ?????? */
		/*
		 * List<BacklogDTO> backlogList = backlogService.selectBacklogList(pjtNo);
		 * for(BacklogDTO backlog : backlogList) { System.out.println(backlog + "??????"); }
		 */
		
		/* ???????????? ????????? ?????? */
		/* List<SprintDTO> sprintList = backlogService.selectSprintList(pjtNo); */
		
		/*
		 * for(SprintDTO sprint : sprintList) { System.out.println("???????????? ????????? :" +
		 * sprint); }
		 */
		  
		model.addAttribute("projectName", projectName);
		model.addAttribute("projectList", project);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pjtNo", pjtNo);
		/* model.addAttribute("backlogList", backlogList); */
		/* model.addAttribute("sprintList", sprintList); */

		return "board/backlog";
	}
	@PostMapping(value="backlog/backlogPaging", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String backlogPaging(Model model, @RequestParam Map<String, String>parameters) throws JsonProcessingException {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo")); 
		String currentPage = parameters.get("currentBacklogPage"); 
		int limit = 5;
		int buttonAmount = 3;

		int pageNo = 1;
		int totalCount = 0;
		
		System.out.println("?????????????");
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}

		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		List<BacklogDTO> allBacklogList = backlogService.selectBacklogList(pjtNo);
		for(BacklogDTO backlog : allBacklogList) {
			System.out.println(backlog);
		}
		
		/* ??? ?????? */
		totalCount = allBacklogList.size();

		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		System.out.println("???????" + pageInfo);
		
		
		List<BacklogDTO> backlogList = backlogService.selectPagingSelectBacklog(pjtNo, pageInfo);
		for(int i = 0; i < backlogList.size(); i++) {
			backlogList.get(i).setStartPage(pageInfo.getStartPage());
			backlogList.get(i).setEndPage(pageInfo.getEndPage());
			backlogList.get(i).setMaxPage(pageInfo.getMaxPage());
			
			System.out.println("backlogList " + i + " : " + backlogList.get(i));
		}
		return new ObjectMapper().writeValueAsString(backlogList);
	}
	
	/*  */
	@PostMapping(value="sprint/sprintPaging", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String sprintPaging(Model model, @RequestParam Map<String, String>parameters) throws JsonProcessingException {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo")); 
		String currentPage = parameters.get("currentSprintPage"); 
		int limit = 5;
		int buttonAmount = 3;

		int pageNo = 1;
		int totalCount = 0;
		
		System.out.println("?????????????");
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}

		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		List<SprintDTO> selectSprintList = backlogService.selectSprintList(pjtNo);
		for(SprintDTO sprint : selectSprintList) {
			System.out.println(sprint);
		}
		
		/* ??? ?????? */
		totalCount = selectSprintList.size();

		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		System.out.println("???????" + pageInfo);
		
		
		List<SprintDTO> sprintList = backlogService.selectPagingSelectSprint(pjtNo, pageInfo);
		for(int i = 0; i < sprintList.size(); i++) {
			sprintList.get(i).setStartPage(pageInfo.getStartPage());
			sprintList.get(i).setEndPage(pageInfo.getEndPage());
			sprintList.get(i).setMaxPage(pageInfo.getMaxPage());
			
			System.out.println("backlogList " + i + " : " + sprintList.get(i));
		}
		return new ObjectMapper().writeValueAsString(sprintList);
	}
	
	
	/* ????????? ??????  ??????*/
	@PostMapping(value="/projectidDupCheckEdit" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public int idprojectcheck(@ModelAttribute MemberDTO member, HttpServletRequest request) {
		
		int result = backlogService.idprojectcheck(member.getEmail());
		return result;
	}
	
	/* ???????????? ?????? */
	@PostMapping(value="backlog/project_edit" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String EditProject(HttpSession httpsession,		
			@RequestParam Map<String, String> parameters,
			HttpServletRequest request, RedirectAttributes rttr) throws JsonProcessingException {
		
			/* model key value ??? ?????? */
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
			
			ProjectDTO project = new ProjectDTO();
			int memberCount = Integer.parseInt(((String[]) projectMake.get("nk1[0][value]"))[0]); //?????????
			
			/* ???????????? ?????? ?????? */
			project.setPjtNo(Integer.parseInt(((String[]) projectMake.get("nk1[1][value]"))[0]));
			project.setMemberNo(Integer.parseInt(((String[]) projectMake.get("nk1[1][value]"))[0]));
			project.setProjectName(((String[]) projectMake.get("nk1[3][value]"))[0]);
			project.setProjectStartDate(java.sql.Date.valueOf(((String[]) projectMake.get("nk1[4][value]"))[0]));
			project.setProjectEndDate(java.sql.Date.valueOf(((String[]) projectMake.get("nk1[5][value]"))[0]));
			project.setProjectColor(((String[]) projectMake.get("nk1[6][value]"))[0]);
			
			
			/*?????? ?????? ??????*/
			 List<ProjectAuthorityDTO> projectMemberList = new ArrayList<>();
	
			 
			 for(int i = 7; i < 7 + memberCount * 2 ; i++) {
				 ProjectAuthorityDTO projectAuthority = new ProjectAuthorityDTO();
				  
				 projectAuthority.setMemberNo(Integer.parseInt(((String[]) projectMake.get("nk1[" + i + "][value]"))[0]));
				 i++;
				 projectAuthority.setProjectRole(Integer.parseInt(((String[]) projectMake.get("nk1[" + i + "][value]"))[0]));
				 projectAuthority.setpjtNo(Integer.parseInt(((String[]) projectMake.get("nk1[1][value]"))[0]));
				 projectMemberList.add(projectAuthority);
			 }
			 
			if (!backlogService.insertEditProject(project) 
			 || !backlogService.insertEditProjectMember(project, projectMemberList)	) {
			 rttr.addFlashAttribute("message","???????????? ????????? ?????????????????????.");
				return new ObjectMapper().writeValueAsString(project);
			}
			 rttr.addFlashAttribute("message","??????????????? ?????????????????????.");
			 return new ObjectMapper().writeValueAsString(project);
}
	
	
	
	@PostMapping(value="backlogDetail" , produces ="application/json; charset=UTF-8")
	@ResponseBody
	public String backlogDetail(Model model,@RequestParam Map<String, String> parameters) throws JsonProcessingException {

		
			int blgNo = Integer.parseInt(parameters.get("blgNo"));
			int pjtNo = Integer.parseInt(parameters.get("projectNo"));
	
			/* ????????? ????????? ?????? */
			BacklogDTO backlogDetail = backlogService.selectBacklogToEdit(blgNo, pjtNo);
			
			 return new ObjectMapper().writeValueAsString(backlogDetail);
		}
	
	
	
	@PostMapping(value="sprintDetail" , produces ="application/json; charset=UTF-8")
	@ResponseBody
	public String sprintDetail(Model model,@RequestParam Map<String, String> parameters) throws JsonProcessingException {

		
			int sprNo = Integer.parseInt(parameters.get("sprNo"));
			
			SprintDTO sprintDetail = backlogService.selectsprintDetailToEdit(sprNo);
			
			 return new ObjectMapper().writeValueAsString(sprintDetail);
			
		}
	
	
	/*???????????? ??????*/
	@PostMapping(value="/projectRemove" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String removeProject(@ModelAttribute ProjectDTO project, RedirectAttributes rttr) throws JsonProcessingException {
	
			if(!backlogService.removeProject(project)) {
				rttr.addFlashAttribute("message","???????????? ????????? ?????????????????????.");
			}else {
				rttr.addFlashAttribute("message","??????????????? ?????????????????????.");	
			}
			
			return new ObjectMapper().writeValueAsString(project);
	}
	
	/* ????????? ?????? */
	@PostMapping(value="/backlog/backlog_regist", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String registBacklog(@ModelAttribute BacklogDTO backlog, RedirectAttributes rttr ) throws JsonProcessingException {
		
			if(!backlogService.insertBacklog(backlog)) {
				rttr.addFlashAttribute("message", "????????? ????????? ?????????????????????.");
				return "????????? ????????? ?????????????????????.";
			}
			rttr.addFlashAttribute("message", "???????????? ?????????????????????.");
			return new ObjectMapper().writeValueAsString(backlog);
	}
	

	/* ????????? ?????? */
	@PostMapping(value="/backlog/backlog_Edit" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String EditBacklog(@RequestParam Map<String, String> parameters, RedirectAttributes rttr) throws JsonProcessingException {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo"));
		int blgNo = Integer.parseInt(parameters.get("blgNo"));		
		String blgName = parameters.get("blgName");		
		int blgPri = Integer.parseInt(parameters.get("blgPri"));		
		String blgDemoMemo = parameters.get("blgDemoMemo");		
		String blgRefMemo = parameters.get("blgRefMemo");		
		
		BacklogDTO backlog = new BacklogDTO();
		backlog.setPjtNo(pjtNo);
		backlog.setBlgNo(blgNo);
		backlog.setBlgName(blgName);
		backlog.setBlgPri(blgPri);
		backlog.setBlgDemoMemo(blgDemoMemo);
		backlog.setBlgRefMemo(blgRefMemo);
		
		if(!backlogService.EditBacklog(backlog)) {
			rttr.addFlashAttribute("message", "????????? ????????? ?????????????????????.");
			return "????????? ????????? ?????????????????????.";
		}
		rttr.addFlashAttribute("message", "???????????? ?????????????????????.");
		return new ObjectMapper().writeValueAsString(backlog);
	}
	
	
	/* ????????? ?????? */
	@PostMapping(value="/backlog/backlog_Remove" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String RemoveBacklog(@RequestParam Map<String, String> parameters, RedirectAttributes rttr) throws JsonProcessingException {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo"));
		int blgNo = Integer.parseInt(parameters.get("blgNo"));		
		
		BacklogDTO backlogRemove = new BacklogDTO();
		backlogRemove.setPjtNo(pjtNo);
		backlogRemove.setBlgNo(blgNo);
		
		System.out.println("?????? : " + backlogRemove);
		if(!backlogService.RemoveBacklog(backlogRemove)) {
			rttr.addFlashAttribute("message", "????????? ????????? ?????????????????????.");
			return "????????? ????????? ?????????????????????..";
		}
		rttr.addFlashAttribute("message", "???????????? ?????????????????????.");
		return new ObjectMapper().writeValueAsString(backlogRemove);
	}
	
	/* ???????????? ?????? */
	@PostMapping(value="/sprint/sprint_regist", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String registSprint(@ModelAttribute SprintDTO sprint, RedirectAttributes rttr ) throws JsonProcessingException {
		
		if(!backlogService.registSprint(sprint)) {
			rttr.addFlashAttribute("message", "???????????? ????????? ?????????????????????.");
			return "????????? ????????? ?????????????????????.";
		}
		rttr.addFlashAttribute("message", "??????????????? ?????????????????????.");
		return new ObjectMapper().writeValueAsString(sprint);
	}
	
	/* ???????????? ?????? */
	@PostMapping(value="/sprint/sprint_remove" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String RemoveSprint(@RequestParam Map<String, String> parameters, RedirectAttributes rttr) throws JsonProcessingException {
		
		int sprNo = Integer.parseInt(parameters.get("sprNo"));
		
		if(!backlogService.RemoveSprint(sprNo)) {
			rttr.addFlashAttribute("message", "???????????? ????????? ?????????????????????.");
			return "???????????? ????????? ?????????????????????..";
		}
		rttr.addFlashAttribute("message", "???????????? ?????????????????????.");
		return new ObjectMapper().writeValueAsString(sprNo);
	}
	
	/* ???????????? ?????? */
	@PostMapping(value="/sprint/sprint_Edit" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String EditSprint(@RequestParam Map<String, String> parameters, RedirectAttributes rttr) throws JsonProcessingException {
		
		int sprNo = Integer.parseInt(parameters.get("sprNo"));		
		String sprName = parameters.get("sprName");		
		Date sprStardDate = java.sql.Date.valueOf(parameters.get("sprStardDate"));		
		Date sprEndDate = java.sql.Date.valueOf(parameters.get("sprEndDate"));	
		String sprGoal = parameters.get("sprGoal");	
		
		SprintDTO sprint = new SprintDTO();
		sprint.setSprNo(sprNo);
		sprint.setSprName(sprName);
		sprint.setSprStardDate(sprStardDate);
		sprint.setSprEndDate(sprEndDate);
		sprint.setSprGoal(sprGoal);
		
		
		if(!backlogService.EditSprint(sprint)) {
			rttr.addFlashAttribute("message", "????????? ????????? ?????????????????????.");
			return "????????? ????????? ?????????????????????.";
		}
		rttr.addFlashAttribute("message", "???????????? ?????????????????????.");
		return new ObjectMapper().writeValueAsString(sprint);
	}
	
	
}
