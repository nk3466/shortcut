package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface CardService {

	List<MemberDTO> selectMember(MemberDTO member);

}
