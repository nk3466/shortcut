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

	@PostMapping(value="backlogDetail" , produces ="application/json; charset=UTF-8")
	@ResponseBody
	public String backlogDetail(Model model,@RequestParam Map<String, String> parameters) throws JsonProcessingException {

		
		int blgNo = Integer.parseInt(parameters.get("blgNo"));
		int pjtNo = Integer.parseInt(parameters.get("projectNo"));
		System.out.println("blgNO : " +  blgNo);
		System.out.println("projectNo : " +  pjtNo);
		//System.out.println("프로젝터 번호" + pjtNo);
//		System.out.println("백로그 번호 : " +blgNo );
//		System.out.println("프로젝트 이름  : " + projectName);
//		/* 백로그 수정용 조회 */
		BacklogDTO backlogDetail = backlogService.selectBacklogToEdit(blgNo, pjtNo);
		System.out.println("으악 : " + backlogDetail);
//		System.out.println(backlog);
//		model.addAttribute("backlog", backlog);
		
		//model.addAttribute("backlogDetail", backlogDetail);
		 return new ObjectMapper().writeValueAsString(backlogDetail);
		
		//return "?pjtNo=" + pjtNo +"&projectName=" + projectName.replace(" ", "+");
		}
	
	@PostMapping(value="sprintDetail" , produces ="application/json; charset=UTF-8")
	@ResponseBody
	public String sprintDetail(Model model,@RequestParam Map<String, String> parameters) throws JsonProcessingException {

		
		int sprNo = Integer.parseInt(parameters.get("sprNo"));
		System.out.println("sprNo : " +  sprNo);
		
		SprintDTO sprintDetail = backlogService.selectsprintDetailToEdit(sprNo);
		System.out.println("으악 : " + sprintDetail);
		
		 return new ObjectMapper().writeValueAsString(sprintDetail);
		
		}
	
	

	@GetMapping("backlog")
	public String project(Model model, @RequestParam(name="pjtNo") int pjtNo, @RequestParam(name="projectName") String projectName
	/* , @RequestParam(name="blgNo1") int blgNo */
			) {
		/* 프로젝트 리스트 */
		ProjectDTO project = backlogService.selectProjectList(pjtNo);

		System.out.println("project는 : " + project);
		
		List<ProjectAuthorityDTO> memberList = backlogService.selectMemberList(pjtNo);
		
		
		/* 프로젝트 이름 출력용 */
		System.out.println("뽑아봐 : " + projectName);

		for(ProjectAuthorityDTO member : memberList) {
			System.out.println("프로젝트 멤버 :" + member);
		}
		/* 백로그 리스트 출력 */
		List<BacklogDTO> backlogList = backlogService.selectBacklogList(pjtNo);
		for(BacklogDTO backlog : backlogList) {
			System.out.println(backlog + "오잉");
		}
		System.out.println("와??응??");
		/* 스프린트 리스트 출력 */
		List<SprintDTO> sprintList = backlogService.selectSprintList(pjtNo);
		System.out.println("와??응??13131313131313");
		
		  for(SprintDTO sprint : sprintList) {
			  System.out.println("스프린트 리스트 :" + sprint); 
			  }
		model.addAttribute("projectName", projectName);
		model.addAttribute("projectList", project);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pjtNo", pjtNo);
		model.addAttribute("backlogList", backlogList);
		model.addAttribute("sprintList", sprintList);

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
			@RequestParam Map<String, String> parameters,
			HttpServletRequest request, RedirectAttributes rttr) throws JsonProcessingException {
		
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
		
		//SimpleDateFormat qwe = new SimpleDateFormat("yyyy-mm-dd");
		
		ProjectDTO project = new ProjectDTO();
		int memberCount = Integer.parseInt(((String[]) projectMake.get("nk1[0][value]"))[0]); //회원수
		
		project.setPjtNo(Integer.parseInt(((String[]) projectMake.get("nk1[1][value]"))[0]));
		project.setMemberNo(Integer.parseInt(((String[]) projectMake.get("nk1[1][value]"))[0]));
		project.setProjectName(((String[]) projectMake.get("nk1[3][value]"))[0]);
		project.setProjectStartDate(java.sql.Date.valueOf(((String[]) projectMake.get("nk1[4][value]"))[0]));
		project.setProjectEndDate(java.sql.Date.valueOf(((String[]) projectMake.get("nk1[5][value]"))[0]));
		project.setProjectColor(((String[]) projectMake.get("nk1[6][value]"))[0]);
		
		System.out.println("프로젝트 정보 촤르르르르 : " + project);
		/*회원 정보 담기*/
		 List<ProjectAuthorityDTO> projectMemberList = new ArrayList<>();
		 System.out.println("멤버 수는 : " + memberCount);
		 for(int i = 7; i < 7 + memberCount * 2 ; i++) {
			 ProjectAuthorityDTO projectAuthority = new ProjectAuthorityDTO();
			  
			 projectAuthority.setMemberNo(Integer.parseInt(((String[]) projectMake.get("nk1[" + i + "][value]"))[0]));
			 i++;
			 projectAuthority.setProjectRole(Integer.parseInt(((String[]) projectMake.get("nk1[" + i + "][value]"))[0]));
			 projectAuthority.setpjtNo(Integer.parseInt(((String[]) projectMake.get("nk1[1][value]"))[0]));
			 projectMemberList.add(projectAuthority);
		 }
		 System.out.println("멤버릿트" + projectMemberList);
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
	@PostMapping(value="/projectRemove" , produces="application/json; charset=UTF-8")
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
	
	/* 백로그 생성 */
	@PostMapping(value="/backlog/backlog_regist", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String registBacklog(@ModelAttribute BacklogDTO backlog, RedirectAttributes rttr ) throws JsonProcessingException {
		
		System.out.println(backlog);
		
		if(!backlogService.insertBacklog(backlog)) {
			rttr.addFlashAttribute("message", "백로그 생성이 취소되었습니다.");
			return "백로그 생성이 취소되었습니다.";
		}
		rttr.addFlashAttribute("message", "백로그가 생성되었습니다.");
		return new ObjectMapper().writeValueAsString(backlog);
	}
	

	/* 백로그 수정 */
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
		
		System.out.println("제발 : " + backlog);
		if(!backlogService.EditBacklog(backlog)) {
			rttr.addFlashAttribute("message", "백로그 수정이 취소되었습니다.");
			return "백로그 생성이 취소되었습니다.";
		}
		rttr.addFlashAttribute("message", "백로그가 수정되었습니다.");
		return new ObjectMapper().writeValueAsString(backlog);
	}
	
	
	/* 백로그 삭제 */
	@PostMapping(value="/backlog/backlog_Remove" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String RemoveBacklog(@RequestParam Map<String, String> parameters, RedirectAttributes rttr) throws JsonProcessingException {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo"));
		int blgNo = Integer.parseInt(parameters.get("blgNo"));		
		
		BacklogDTO backlogRemove = new BacklogDTO();
		backlogRemove.setPjtNo(pjtNo);
		backlogRemove.setBlgNo(blgNo);
		
		System.out.println("제발 : " + backlogRemove);
		if(!backlogService.RemoveBacklog(backlogRemove)) {
			rttr.addFlashAttribute("message", "백로그 삭제가 취소되었습니다.");
			return "백로그 삭제가 취소되었습니다..";
		}
		rttr.addFlashAttribute("message", "백로그가 삭제되었습니다.");
		return new ObjectMapper().writeValueAsString(backlogRemove);
	}
	
	/* 백로그 생성 */
	@PostMapping(value="/sprint/sprint_regist", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String registSprint(@ModelAttribute SprintDTO sprint, RedirectAttributes rttr ) throws JsonProcessingException {
		
		System.out.println("가져오니?" +  sprint);
		
		if(!backlogService.registSprint(sprint)) {
			rttr.addFlashAttribute("message", "스프린트 생성이 취소되었습니다.");
			return "백로그 생성이 취소되었습니다.";
		}
		rttr.addFlashAttribute("message", "스프린트가 생성되었습니다.");
		return new ObjectMapper().writeValueAsString(sprint);
	}
	
	/* 스프린트 삭제 */
	@PostMapping(value="/sprint/sprint_remove" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public String RemoveSprint(@RequestParam Map<String, String> parameters, RedirectAttributes rttr) throws JsonProcessingException {
		
		int sprNo = Integer.parseInt(parameters.get("sprNo"));
		System.out.println("sprNo : " + sprNo);
		
		if(!backlogService.RemoveSprint(sprNo)) {
			rttr.addFlashAttribute("message", "스프린트 삭제가 취소되었습니다.");
			return "스프린트 삭제가 취소되었습니다..";
		}
		rttr.addFlashAttribute("message", "스프린트 삭제되었습니다.");
		return new ObjectMapper().writeValueAsString(sprNo);
	}
	
	/* 백로그 수정 */
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
		
		
		System.out.println("제발 : " + sprint);
		if(!backlogService.EditSprint(sprint)) {
			rttr.addFlashAttribute("message", "백로그 수정이 취소되었습니다.");
			return "백로그 생성이 취소되었습니다.";
		}
		rttr.addFlashAttribute("message", "백로그가 수정되었습니다.");
		return new ObjectMapper().writeValueAsString(sprint);
	}
	
	
}
