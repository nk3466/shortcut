package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface CardService {

	List<ProjectAuthorityDTO> selectMember(int pjtNo);

	boolean createCard(CardDTO card);

	boolean cardMember(int memberNo, int cNo);

	boolean registCard(CardDTO card);

	CardDTO currentCardNo();



}
