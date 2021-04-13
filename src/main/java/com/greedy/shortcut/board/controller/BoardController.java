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
import com.greedy.shortcut.member.model.dto.MemberDTO;

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

	@GetMapping("/board/kanbanboard/")
	public String kanbanboard(@RequestParam(name="pjtNo") int pjtNo, @RequestParam(name="projectName") String projectName, @RequestParam(name="sprNo") int sprNo, Model model) {
		System.out.println("pjtNo : " + pjtNo);
		System.out.println("projectName : " + projectName);
		System.out.println("sprNo : " + sprNo);

		List<MemberDTO> memberList = boardService.selectMember(pjtNo);
		List<BoardDTO> boardList = boardService.selectboardList(sprNo);
		System.out.println("boardList :" + boardList);
		System.out.println("memberList : " + memberList);
		model.addAttribute("pjtNo", pjtNo);
		model.addAttribute("projectName", projectName);
		model.addAttribute("sprNo", sprNo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("boardList", boardList);
		

		return "/board/kanbanboard";
	}

	@RequestMapping(value = "/board/cardmember", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectAuthorityDTO> selectMember(@ModelAttribute ProjectAuthorityDTO pAuth, HttpServletRequest request) {

		int pjtNo = Integer.parseInt(request.getParameter("pjtNo"));
		System.out.println("pjtNo : " + pjtNo);

		List<ProjectAuthorityDTO> memberList = cardService.selectMember(pjtNo);

		return memberList;
	}
	
	@PostMapping("/card/regist")
	public String registCard(@ModelAttribute CardDTO card, HttpServletRequest request, RedirectAttributes rttr)  {
		
		/*
		 * if(!cardService.registCard(card)) { System.out.println(card); }
		 */
		
		rttr.addFlashAttribute("message", "카드 등록에 성공하셨습니다.");
		
		return "/board/kanbanboard";
	}
	
	
	
	@PostMapping("/board/kanbanboard")
	   public String newBoard(@RequestParam(name="title") String title,@RequestParam(name="sprNo") int sprNo ,@RequestParam(name="pjtNo") int pjtNo ,@RequestParam(name="projectName") String projectName ,RedirectAttributes redirect, Model model) {
		
		System.out.println("title:" +  title);
		System.out.println("sprNo:" +  sprNo);
		
		BoardDTO newboard = new BoardDTO();
		newboard.setBrdName(title);
		newboard.setSprNo(sprNo);
		newboard.setBrdOrder(1);
		boolean result = boardService.insertnewBoard(newboard);
		System.out.println( result);
	   	 
	      return "redirect:kanbanboard/?pjtNo="+pjtNo+"&sprNo="+sprNo+"&projectName="+projectName;
	   }
	
	
}


