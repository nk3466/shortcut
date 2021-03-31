package com.greedy.shortcut.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greedy.shortcut.common.exception.MemberRegistException;
import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.member.model.service.MemberService;

@Controller
@RequestMapping("/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private final MemberService memberService;
	private final BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	
	@PostMapping("/regist")
	public String registMember(@ModelAttribute MemberDTO member, HttpServletRequest request, RedirectAttributes rttr)  {
		
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		
		System.out.println(member);
		if(!memberService.registMember(member)) {
			
		}
		
		rttr.addFlashAttribute("message", "회원 가입에 성공하셨습니다.");
		
		return "redirect:/";
		
	}
	
	
}
