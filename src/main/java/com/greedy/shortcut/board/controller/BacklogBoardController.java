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

	@PostMapping("backlog")
	public String backlog(Model model, @RequestParam(name="blgNo") int blgNo,  @RequestParam(name="pjtNo") int pjtNo, @RequestParam(name="projectName") String projectName) {
		System.out.println("프로젝터 번호" + pjtNo);
		System.out.println("백로그 번호 : " +blgNo );
		System.out.println("프로젝트 이름  : " + projectName);
		/* 백로그 수정용 조회 */
		BacklogDTO backlog = backlogService.selectBacklogToEdit(blgNo, pjtNo);
		
		System.out.println(backlog);
		model.addAttribute("backlog", backlog);
		
		return"야야";
		//return "?pjtNo=" + pjtNo +"&projectName=" + projectName.replace(" ", "+");
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
			System.out.println(backlog);
		}
		
		/* 스프린트 리스트 출력 */

		model.addAttribute("projectName", projectName);
		model.addAttribute("projectList", project);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pjtNo", pjtNo);
		model.addAttribute("backlogList", backlogList);

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
	

//	/* 백로그 수정 */
//	@PostMapping(value="backlog/SelectBacklog" , produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public String SelectBacklog(HttpSession httpsession,		
//			@ModelAttribute ProjectDTO project,
//			HttpServletRequest request, RedirectAttributes rttr) throws JsonProcessingException {
//		
//		
//		BacklogDTO backlog = backlogService.selectBacklogList(pjtNo);
//		return "";
//				
//		
//	}
//	
}
