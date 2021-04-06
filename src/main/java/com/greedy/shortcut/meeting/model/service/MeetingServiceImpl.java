package com.greedy.shortcut.meeting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.meeting.model.dao.MeetingMapper;
import com.greedy.shortcut.meeting.model.dto.MeetingDTO;

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
	
}
