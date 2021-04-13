package com.greedy.shortcut.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.CardMapper;
import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("cardService")
public class CardServiceImpl implements CardService {
	
	private final CardMapper cardMapper;
	
	@Autowired
	public CardServiceImpl(CardMapper cardMapper) {
		this.cardMapper = cardMapper;
	}

	@Override
	public List<ProjectAuthorityDTO> selectMember(int pjtNo) {
		return cardMapper.selectMember(pjtNo);
	}

	@Override
	public boolean cardMember(int memberNo, int cNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean registCard(CardDTO card) {
		
		return cardMapper.registCard(card);
	}

	@Override
	public boolean createCard(CardDTO card) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public CardDTO currentCardNo() {
		return cardMapper.currentCardNo();
	}


}
