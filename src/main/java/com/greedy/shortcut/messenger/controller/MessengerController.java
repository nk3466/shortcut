package com.greedy.shortcut.messenger.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greedy.shortcut.messenger.model.dto.MessengerDTO;
import com.greedy.shortcut.messenger.model.dto.PmDTO;
import com.greedy.shortcut.messenger.model.sevice.MsgService;

@Controller
@RequestMapping("/messenger/*")
public class MessengerController<PjtMemDTO> {
	
	private final MsgService msgService;
	
	@Autowired
	public MessengerController(MsgService msgService) {
		this.msgService = msgService;
	}

	@GetMapping("messenger")
	public void messenger() {}
	
	@RequestMapping(value="/messenger/messenger", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<PmDTO> selectMember(@ModelAttribute PmDTO pmDTO, HttpServletRequest request) {
		
		List<PmDTO> pjtList = msgService.selectMember(pmDTO);
		System.out.println(pjtList);
		
		return pjtList;
	}
	
	@GetMapping("messenger_receive")
public String selectReceiveList(Model model) {
		
		List<MessengerDTO> msgList = msgService.selectReceive();
		System.out.println(msgList);
		
		model.addAttribute("msgList", msgList);
		
		return "messenger/messenger_receive";
	}
	
	@GetMapping("messenger_inbox_send")
	public String selectSend(Model model) {
		
		List<MessengerDTO> msgList = msgService.selectSend();
		System.out.println(msgList);
		
		model.addAttribute("msgList", msgList);
		
		return "messenger/messenger_receive";
	}
}
