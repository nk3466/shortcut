package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.CardAttendListDTO;
import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.RequestCardDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface CardMapper {

	List<ProjectAuthorityDTO> selectMember(int pjtNo);

	boolean registCard(RequestCardDTO card);

	CardDTO currentCardNo();

	List<CardDTO> selctCardList(int brdNo);

	boolean registCardTask(RequestCardDTO card);

	boolean registCardSchedule(RequestCardDTO card);

	boolean registSchAttendList(CardAttendListDTO cal);

//	RequestCardDTO selectCardDetail(int cardNo);
//
//	List<MemberDTO> selectCardDetailMember(int cardNo);

//	List<RequestCardDTO> selectCardInfo(int cardNo);
	List<RequestCardDTO> selectCardInfo(int cardNo);





}
