package com.greedy.shortcut.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.member.model.dao.MemberMapper;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper, BCryptPasswordEncoder passwordEncoder) {
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public boolean registMember(MemberDTO member) {
		
		Object userId = (Object) mapper.selectUserInfoCount(member.getEmail());
		System.out.println("userCount : " + userId);
		if(userId == member.getEmail()) {
			return false;
		} else {
			member.setPassword(passwordEncoder.encode(member.getPassword()));
			
			return mapper.registMember(member) > 0? true: false;
		}
		
	}

	@Override
	public void ModifyMember(MemberDTO memberDTO) {
		mapper.ModifyMember(memberDTO);
		System.out.println(memberDTO);
	}

}
