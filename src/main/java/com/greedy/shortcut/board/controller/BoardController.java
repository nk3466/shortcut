package com.greedy.shortcut.board.controller;

import java.util.List;

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

import com.greedy.shortcut.board.model.dto.BoardDTO;
import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.service.BoardService;
import com.greedy.shortcut.board.model.service.CardService;

@Controller
@RequestMapping("/*")
public class BoardController {

	private final CardService cardService;
	private final BoardService boardService;

	@Autowired
	public BoardController(CardService cardService, BoardService boardService) {
		this.cardService = cardService;
		this.boardService = boardService;
	}

	@GetMapping("/board/kanbanboard/{pjtNo}")
	public String kanbanboard(@PathVariable("pjtNo") int pjtNo, Model model) {
		System.out.println("{pjtNo} : " + pjtNo);

		model.addAttribute("pjtNo", pjtNo);

		return "/board/kanbanboard";
	}

	@RequestMapping(value = "/board/kanbanboard", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectAuthorityDTO> selectMember(@ModelAttribute ProjectAuthorityDTO pAuth, HttpServletRequest request) {

		int pjtNo = Integer.parseInt(request.getParameter("pjtNo"));
		System.out.println("pjtNo : " + pjtNo);

		List<ProjectAuthorityDTO> memberList = cardService.selectMember(pjtNo);

		return memberList;
	}
	
	@PostMapping("/card/regist")
	public String registCard(@ModelAttribute CardDTO card, HttpServletRequest request, RedirectAttributes rttr)  {
		
		if(!cardService.registCard(card)) {
			System.out.println(card);
		}
		
		rttr.addFlashAttribute("message", "카드 등록에 성공하셨습니다.");
		
		return "/board/kanbanboard";
	}
	
	
	
	@PostMapping("kanbanboard")
	@ResponseBody
	   public String newBoard(@ModelAttribute BoardDTO board, RedirectAttributes redirect, Model model) {

	   
	      if (!boardService.newBoard(board)) {
	    	  System.out.println("왔다?!");
	         redirect.addFlashAttribute("message", "게시글등록실패하였습니다");
	      }

	      redirect.addFlashAttribute("message", "게시글 등록성공");
	      System.out.println("왓다");
	      List<BoardDTO> boardList = boardService.selectBoard();

	      model.addAttribute("boardList", boardList);
	      return "board/kanbanboard";
	   }
	
	
}


