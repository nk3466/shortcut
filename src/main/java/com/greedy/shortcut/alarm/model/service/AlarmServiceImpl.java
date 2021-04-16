package com.greedy.shortcut.alarm.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.alarm.model.dao.AlarmMapper;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {

	private AlarmMapper alarmMapper;
	
	@Autowired
	public AlarmServiceImpl(AlarmMapper alarmMapper) {
		this.alarmMapper = alarmMapper;
	}
	
	@Override
	public String selectGitUrl(int memNo) {
		return alarmMapper.selectGitUrl(memNo);
	}

	@Override
	public int registGitUrl(int memNo, String githubInfo) {
		
		Map<String, Object> transferMap = new HashMap<>();
		transferMap.put("memNo", memNo);
		transferMap.put("githubInfo", githubInfo);
		
		return alarmMapper.registGitUrl(transferMap);
	}

	@Override
	public int modifyGitUrl(int memNo, String modifyUrl) {

		Map<String, Object> transferMap = new HashMap<>();
		transferMap.put("memNo", memNo);
		transferMap.put("modifyUrl", modifyUrl);
		
		return alarmMapper.modifyGitUrl(transferMap);
	}

	@Override
	public int removeGitUrl(int memNo) {
		return alarmMapper.removeGitUrl(memNo);
	}

}
