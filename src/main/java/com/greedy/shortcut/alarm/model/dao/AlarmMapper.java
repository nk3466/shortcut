package com.greedy.shortcut.alarm.model.dao;

import java.util.Map;

public interface AlarmMapper {

	String selectGitUrl(int memNo);
	
	int registGitUrl(Map transferMap);
}
