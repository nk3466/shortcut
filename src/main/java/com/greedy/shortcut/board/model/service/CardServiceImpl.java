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
	public boolean createCard(CardDTO card) {
		return cardMapper.createCard(card) > 0? true:false;
	}

	@Override
	public CardDTO selectCard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean cardMember(int memberNo, int cNo) {
		// TODO Auto-generated method stub
		return false;
	}



}
