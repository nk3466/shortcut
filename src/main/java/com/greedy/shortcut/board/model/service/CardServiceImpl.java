package com.greedy.shortcut.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.CardMapper;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("cardService")
public class CardServiceImpl implements CardService {
	
	private final CardMapper cardMapper;
	
	@Autowired
	public CardServiceImpl(CardMapper cardMapper) {
		this.cardMapper = cardMapper;
	}

	@Override
	public List<MemberDTO> selectMember(MemberDTO member) {
		return cardMapper.selectMember(member);
	}

}
