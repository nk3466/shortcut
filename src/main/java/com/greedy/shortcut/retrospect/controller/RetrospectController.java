package com.greedy.shortcut.retrospect.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.common.paging.Pagenation;
import com.greedy.shortcut.retrospect.model.dto.ReviewDTO;
import com.greedy.shortcut.retrospect.model.service.RetrospectService;

@Controller
@RequestMapping("/*")
public class RetrospectController {
	
	private final RetrospectService retrospectService;
	
	@Autowired
	public RetrospectController(RetrospectService retrospectService) {
		this.retrospectService = retrospectService;
	}
	
	@GetMapping(value="board/backlog/reviewPaging", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String reviewPaging(Model model, @RequestParam Map<String, String> parameters) throws JsonProcessingException {
		
		int pjtNo = Integer.parseInt(parameters.get("pjtNo")); 
		String currentPage = parameters.get("currentPage"); 
		int limit = 5;
		int buttonAmount = 3;
		
		int pageNo = 1;
		int totalCount = 0;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
	
		List<BacklogDTO> allfinishSprintList = retrospectService.selectFinishSprint(pjtNo);
		for(BacklogDTO backlog : allfinishSprintList) {
			System.out.println(backlog);
		}
	
		/* 총 개수 */
		totalCount = allfinishSprintList.size();
		
		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		System.out.println(pageInfo);
		
		List<BacklogDTO> finishSprintList = retrospectService.selectPagingFinishSprint(pjtNo, pageInfo);
		for(int i = 0; i < finishSprintList.size(); i++ ) {
			finishSprintList.get(i).setStartPage(pageInfo.getStartPage());
			finishSprintList.get(i).setEndPage(pageInfo.getEndPage());
			finishSprintList.get(i).setMaxPage(pageInfo.getMaxPage());
			System.out.println("finishSprintList " + i + " : " + finishSprintList.get(i));
		}
		
		return new ObjectMapper().writeValueAsString(finishSprintList);
	}
	
	@GetMapping("board/backlog/retrospect")
	public String retrospect() {
		
		List<ReviewDTO> review = retrospectService.selectReview();
		
		for(ReviewDTO rv : review) {
			System.out.println(rv);
		}
		
		
		
		
		
		
		
		return "retrospect/retrospect";
	}
	
}
