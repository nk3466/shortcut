package com.greedy.shortcut.member.model.dao;

import java.util.List;

import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface MemberMapper {

	int registMember(MemberDTO member);

	MemberDTO selectUserInfoOne(String inputUserId);

	
	
}
