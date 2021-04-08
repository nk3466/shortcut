package com.greedy.shortcut.messenger.model.sevice;

import java.util.List;

import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.messenger.model.dto.MessengerDTO;
import com.greedy.shortcut.messenger.model.dto.PmDTO;


public interface MsgService {

	List<PmDTO> selectMember(PmDTO pmDTO);

	List<MessengerDTO> selectReceive();

	List<MessengerDTO> selectSend();


}
