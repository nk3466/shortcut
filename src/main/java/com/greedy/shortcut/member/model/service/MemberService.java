package com.greedy.shortcut.member.model.service;

import org.springframework.stereotype.Service;

import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface MemberService {

	boolean registMember(MemberDTO member);

	void ModifyMember(MemberDTO memberDTO);

	void updateMember(MemberDTO dto);
	
	String createKey();
//	
//	void sendMail(MemberDTO member);

}
