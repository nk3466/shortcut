package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface CardMapper {

	List<MemberDTO> selectMember(MemberDTO member);

}
