package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.CardAttendListDTO;
import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.RequestCardDTO;

public interface CardMapper {

	List<ProjectAuthorityDTO> selectMember(int pjtNo);

	boolean registCard(RequestCardDTO card);

	CardDTO currentCardNo();

	List<CardDTO> selctCardList(int brdNo);

	boolean registCardTask(RequestCardDTO card);

	boolean registCardSchedule(RequestCardDTO card);

	boolean registSchAttendList(CardAttendListDTO cal);




}
