package com.greedy.shortcut.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greedy.shortcut.common.exception.MemberRegistException;
import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.member.model.service.MemberService;

@Controller
@RequestMapping("/*")
public class MemberController {
	
	private final MemberService memberService;
	private final BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	@RequestMapping(value = "/loginPage")
	public String login() {
		return "loginPage";
	}
	
	@RequestMapping(value = "/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping(value = "/user")
	public String user() {
		return "user";
	}
	
	@RequestMapping(value = "/")
	public String all() {
		return "/";
	}
	
	@GetMapping("/regist")
	public String registForm() {
		return "regist";
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
