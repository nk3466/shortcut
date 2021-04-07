package com.greedy.shortcut.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greedy.shortcut.board.model.service.CardService;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private final CardService cardService;
	
	@Autowired
	public BoardController(CardService cardService) {
		this.cardService = cardService;
	}

	@GetMapping("/kanbanboard")
	public void kanbanboard() {}

	@RequestMapping(value = "/board/kanbanboard", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberDTO> selectMember(@ModelAttribute MemberDTO member, HttpServletRequest request) {
		
		
		List<MemberDTO> memberList = cardService.selectMember(member);
		System.out.println(memberList);
		return memberList;
	}


}
