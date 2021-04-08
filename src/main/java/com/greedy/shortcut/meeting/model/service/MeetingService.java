package com.greedy.shortcut.meeting.model.service;

import java.util.List;

import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface MeetingService {

	boolean insertMeeting(MeetingDTO meeting);

	List<MemberDTO> selectProjectMember(MemberDTO member);


}
