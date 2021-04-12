package com.greedy.shortcut.meeting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dto.ProjectAndAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.meeting.model.dao.MeetingMapper;
import com.greedy.shortcut.meeting.model.dto.AttendListDTO;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("meetingService")
public class MeetingServiceImpl implements MeetingService{

	private MeetingMapper mapper;
	
	@Autowired
	public MeetingServiceImpl(MeetingMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public boolean insertMeeting(MeetingDTO meeting) {

		return mapper.insertMeeting(meeting) > 0? true:false;
	}

	/*
	 * @Override public List<MemberDTO> selectProjectMember(MemberDTO member) {
	 * 
	 * return mapper.selectProjectMember(member); }
	 */


	@Override
	public MeetingDTO selectMeeting() {

		return mapper.selectMeeting();
	}


	@Override
	public boolean insertProjectMember(int memberNo, int mNo) {

		return mapper.insertProjectMember(memberNo, mNo) > 0? true:false;
	}

	@Override
	public List<MemberDTO> selectProjectMember(MemberDTO member, int pjtNo) {

		return mapper.selectProjectMember(member, pjtNo);
	}

	@Override
	public List<MeetingDTO> selectMeetingList(int pjtNo) {

		return mapper.selectMeetingList(pjtNo);
	}

	

	
	


	
	
}
