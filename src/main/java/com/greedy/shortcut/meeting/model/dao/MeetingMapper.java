package com.greedy.shortcut.meeting.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.ProjectAndAuthorityDTO;
import com.greedy.shortcut.meeting.model.dto.AttendListDTO;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface MeetingMapper {

	int insertMeeting(MeetingDTO meeting);

	ProjectAndAuthorityDTO projectMemberCheck(String name);

	List<MemberDTO> selectProjectMember(MemberDTO member);

	int insertProjectMember(int memberNo);

}
