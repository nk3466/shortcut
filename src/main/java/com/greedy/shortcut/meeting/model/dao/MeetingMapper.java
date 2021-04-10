package com.greedy.shortcut.meeting.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.greedy.shortcut.board.model.dto.ProjectAndAuthorityDTO;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Mapper
public interface MeetingMapper {

	int insertMeeting(MeetingDTO meeting);

	ProjectAndAuthorityDTO projectMemberCheck(String name);

	List<MemberDTO> selectProjectMember(MemberDTO member);

	int insertProjectMember(int memberNo, @Param("meetingNo") int mNo);

	Object selectMeeting();

}
