package com.greedy.shortcut.board.model.dao;

import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface ProjectMapper {
	/* 아이디 유무 체크 */
	MemberDTO selectMemberDupCheck(String inputUserId);
}
