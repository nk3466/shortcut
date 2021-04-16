package com.greedy.shortcut.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.CardMapper;
import com.greedy.shortcut.board.model.dto.BoardDTO;
import com.greedy.shortcut.board.model.dto.CardAttendListDTO;
import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.RequestCardDTO;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
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
	public boolean registCard(RequestCardDTO card) {
		
		boolean result = false;
		
		result = cardMapper.registCard(card);
		
		if(result) {
			
			if( 1 == card.getType()) {
				
			}else if (2 == card.getType()) {
				result = cardMapper.registCardTask(card);
			}else if (3 == card.getType()) {
				result = cardMapper.registCardSchedule(card);
				for(int i = 0; i < card.getMemberList().size(); i++) {
					CardAttendListDTO cal = new CardAttendListDTO();
					cal.setMemNo(card.getMemberList().get(i));
					result = cardMapper.registSchAttendList(cal);
				}
				
			}else if (4 == card.getType()) {
				result = cardMapper.registCardTask(card);
				result = cardMapper.registCardSchedule(card);
				for(int i = 0; i < card.getMemberList().size(); i++) {
					CardAttendListDTO cal = new CardAttendListDTO();
					cal.setMemNo(card.getMemberList().get(i));
					result = cardMapper.registSchAttendList(cal);
				}
			}
		}
		return result;
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

	@Override
	public List<CardDTO> selectCardList(List<BoardDTO> boardList) {
		List<CardDTO> cardList = new ArrayList<>();
		for( int i = 0; i < boardList.size(); i++) {
		List<CardDTO> preCardList = cardMapper.selctCardList(boardList.get(i).getBrdNo());
			for( int j = 0; j < preCardList.size(); j++ ) {
				cardList.add(preCardList.get(j));
			}
		}
		return cardList;
	}

//	@Override
//	public HashMap<String, Object> selectCardInfo(int cardNo) {
//		RequestCardDTO card = cardMapper.selectCardDetail(cardNo);
//		
//		List<MemberDTO> memberList = cardMapper.selectCardDetailMember(cardNo);
//		
//		HashMap<String,Object> cardDetail = new HashMap<String,Object>();
//		
//		cardDetail.put("card", card);
//		cardDetail.put("memberList", memberList);
//		
//		
//	
//		return cardDetail;
//	}

	@Override
	public List<RequestCardDTO> selectCardInfo(int cardNo) {
		return cardMapper.selectCardInfo(cardNo);
	}


}
