package com.greedy.shortcut.board.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.greedy.shortcut.board.model.dto.CardScheduleDTO;
import com.greedy.shortcut.board.model.dto.CardTaskDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.RequestCardDTO;
import com.greedy.shortcut.board.model.service.CardService;

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
	public String registCard(@ModelAttribute RequestCardDTO card, HttpServletRequest request, 
			@RequestParam(name="sprNo") int sprNo ,@RequestParam(name="pjtNo") int
			pjtNo ,@RequestParam(name="projectName") String projectName
			,RedirectAttributes redirect,RedirectAttributes rttr, Model model) {
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

		return "redirect:/board/kanbanboard/?pjtNo="+pjtNo+"&sprNo="+sprNo+"&projectName="+
		 projectName;
		
	}
	
	@GetMapping(value = "/select/cardInfo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectCardInfo(@RequestParam Map<String, String> parameters, HttpServletRequest request, Model model) throws JsonProcessingException {
		
		int cardNo = Integer.parseInt(request.getParameter("crdNo"));
		System.out.println("cardNo 무야호: " + cardNo);
		
		List<RequestCardDTO> selectCardInfo = cardService.selectCardInfo(cardNo);
		System.out.println("selectCardInfo무야호 : " + selectCardInfo);
		
		model.addAttribute("selectCardInfo", selectCardInfo);
		
		return new ObjectMapper().writeValueAsString(selectCardInfo);
		
	}
	
//	@PostMapping(value="/select/cardInfo", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public String selectMeetingDetail(@RequestParam Map<String, String> parameters, Model model) throws JsonProcessingException {
//		int cardNo = Integer.parseInt(parameters.get("crdNo"));
//		System.out.println("cardNo 무야호 : " + cardNo);
//		HashMap<String,Object> card = cardService.selectCardInfo(cardNo);
//		System.out.println("card무야호 : " + card);
//
//		model.addAttribute("card", card);
//		
//		
//		return new ObjectMapper().writeValueAsString(card);
//	}

}
