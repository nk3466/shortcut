package com.greedy.shortcut.meeting.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.meeting.model.dto.AttendListDTO;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.meeting.model.service.MeetingService;
import com.greedy.shortcut.member.model.dto.MemberDTO;


@Controller
@RequestMapping("/meeting/*")
public class MeetingLogController {
	
	private final MeetingService meetingService;

	@Autowired
	public MeetingLogController(MeetingService meetingService) {
		this.meetingService = meetingService;
		
	}
	
	@GetMapping("meetinglog")
	public String meetinglog(Model model, @RequestParam(name="pjtNo") int pjtNo, @RequestParam(name="projectName") String projectName) {
			
		System.out.println("제발;;" + pjtNo);
		System.out.println("제발;!!!;" + projectName);
		
		
		/* 미팅조회 */
		List<MeetingDTO> meetingList = meetingService.selectMeetingList(pjtNo);
		
		System.out.println("이거뜸??????????" + meetingList);
		
		model.addAttribute("pjtNo", pjtNo);
		model.addAttribute("projectName", projectName);
		model.addAttribute("meetingList", meetingList);
		
		
		return "meeting/meetinglog";
	}
	
	
	@PostMapping(value="/meetinglog", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String meeting(@ModelAttribute MeetingDTO meeting, RedirectAttributes rttr, @ModelAttribute AttendListDTO memberList ,@ModelAttribute MemberDTO member,HttpServletRequest request) throws JsonProcessingException{
	
		
		System.out.println("meeting : " + meeting);
		System.out.println("memberList : " + memberList);
		
		
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
		int memberListsize = Integer.parseInt(((String[])projectMake.get("index"))[0]);
		
		
		System.out.println("사이즈 : " + projectMake.size());
		/*회원 정보 담기*/
		 List<AttendListDTO> projectMemberList = new ArrayList<>();
		
		for(int i = 0; i < memberListsize; i++ ) {
			
			AttendListDTO projectmember = new AttendListDTO();
			
			  projectmember.setMemberNo(Integer.parseInt((((String[]) projectMake.get("meetingMember[" + i
			  + "][value]"))[0])));
			  System.out.println("가져온 이름 : " + projectmember.getMemberNo());
			 
			  projectMemberList.add(projectmember);
			  
		}
		
		System.out.println("이거 값이 있나? : " + projectMemberList);
		
		for(int i = 0; i < projectMemberList.size(); i++) {
			System.out.println("DTO에 넣은 이름 : " + projectMemberList.get(i).getMemberNo());
		}
		
		
		/* 미팅 인서트 */
		if(!meetingService.insertMeeting(meeting)) {}
		
		/* 미팅번호 */
		MeetingDTO meetingNo = meetingService.selectMeeting();
		
		
		int mNo = meetingNo.getMeetingNo();
		
		System.out.println("몬데이거 ;;" + mNo);
		
		
		/*
		 * int mNo = (int) meetingNo;
		 * 
		 * System.out.println("아 돌겠네 ;;" + mNo);
		 */
		
		for(int i = 0; i < projectMemberList.size(); i++ ) {
			int memberNo = projectMemberList.get(i).getMemberNo();
			if(meetingService.insertProjectMember(memberNo, mNo)) {
				System.out.println("입력완료!!" + memberNo) ;
			}
		}
		//if(!meetingService.insertProjectMember(projectMemberList)) {}
		
		rttr.addFlashAttribute("message","회의 내용이 등록 되었습니다.");
		
		return new ObjectMapper().writeValueAsString(meeting);
	}
	
	@PostMapping(value="meetinglog/selectProjectMember", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberDTO> selectProjectMember(@ModelAttribute MemberDTO member,   @RequestParam Map<String, String> parameters) {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@넘ㅁ버 " + pjtNo);
		
		List<MemberDTO> memberList = meetingService.selectProjectMember(member, pjtNo);
		
		System.out.println("넘버" + pjtNo);
		System.out.println("프젝맴버" + memberList);
		
		return memberList;
		
		
	}
	
//	@RequestMapping(value="meetinglog/meeitinglog_detail", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public void meeting_detail() {}
//	
	@PostMapping(value="meetinglog/selectAllmeeting", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String meetingList( Model model, @RequestParam Map<String, String> parameters) throws JsonProcessingException {
		int PjtNo = Integer.parseInt(parameters.get("pjtNo"));
		System.out.println("PjtNo : " + PjtNo);
		
		List<MeetingDTO> meetingList = meetingService.selectMeetingList(PjtNo);
		System.out.println(meetingList.get(0).getMeetingName());
		
		return new ObjectMapper().writeValueAsString(meetingList);
	}
	
}
