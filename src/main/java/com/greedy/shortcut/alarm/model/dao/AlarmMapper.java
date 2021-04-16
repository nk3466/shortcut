package com.greedy.shortcut.alarm.model.dao;

import java.util.Map;

public interface AlarmMapper {

	String selectGitUrl(int memNo);
	
	int registGitUrl(Map<String, Object> transferMap);
	
	int modifyGitUrl(Map<String, Object> transferMap);
	
	int removeGitUrl(int memNo);

	CharSequence countReceiveNote(String payload);
}
