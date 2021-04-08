package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface CardMapper {

	List<ProjectAuthorityDTO> selectMember(int memberNo);

}
