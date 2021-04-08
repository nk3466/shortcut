package com.greedy.shortcut.retrospect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("board/backlog/retrospect")
	public String retrospect() {
		
		
		List<ReviewDTO> review = retrospectService.selectReview();
		
		for(ReviewDTO rv : review) {
			System.out.println(rv);
		}
		
		
		
		
		
		
		
		return "retrospect/retrospect";
	}
	
}
