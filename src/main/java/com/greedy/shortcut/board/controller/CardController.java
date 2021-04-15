package com.greedy.shortcut.board.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Iterator;
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
import com.greedy.shortcut.board.model.dto.CardScheduleDTO;
import com.greedy.shortcut.board.model.dto.CardTaskDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.RequestCardDTO;
import com.greedy.shortcut.board.model.service.BoardService;
import com.greedy.shortcut.board.model.service.CardService;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/*")
public class CardController {

	private final CardService cardService;

	@Autowired
	public CardController(CardService cardService) {
		this.cardService = cardService;
	}

	@RequestMapping(value = "/card/cardmember", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<ProjectAuthorityDTO> selectMember(@ModelAttribute ProjectAuthorityDTO pAuth,
			HttpServletRequest request) {

		int pjtNo = Integer.parseInt(request.getParameter("pjtNo"));
		System.out.println("pjtNo : " + pjtNo);

		List<ProjectAuthorityDTO> memberList = cardService.selectMember(pjtNo);

		return memberList;
	}

	@PostMapping("/card/create")
	public String registCard(@ModelAttribute RequestCardDTO card, HttpServletRequest request, RedirectAttributes rttr
							, Model model) {
		System.out.println("dddddddddddddddddddddddddd");
		CardScheduleDTO crd_sch = new CardScheduleDTO();
		CardTaskDTO crd_task = new CardTaskDTO();
		
		System.out.println("card : " + card);
		
		Enumeration eParam = request.getParameterNames();
		 
		 while (eParam.hasMoreElements()) {
		        String pName = (String)eParam.nextElement();
		        String pValue = request.getParameter(pName);

		        System.out.println(pName + " : " + pValue + "<br>");
		 }
		 
		 String schA = card.getScheduleStartDate().replace("T", "").replace("-", "").replace(":", "");
		 String schB = card.getScheduleEndDate().replace("T", "").replace("-", "").replace(":", "");
		 card.setScheduleEndDate(schB);
		 card.setScheduleStartDate(schA);
		
		System.out.println("card: " + card);
		
		if (!cardService.registCard(card)) {
			System.out.println(card);
		}

		//CardDTO currentCardNo = cardService.currentCardNo();
		//System.out.println("currentCardNo??? : " + currentCardNo);
		
		rttr.addFlashAttribute("message", "카드 등록에 성공하셨습니다.");

		return "/board/kanbanboard";
		/* 
		 * 
		 
		 * 
		 *  */
	}

}
