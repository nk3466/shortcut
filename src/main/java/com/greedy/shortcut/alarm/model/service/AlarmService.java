package com.greedy.shortcut.alarm.model.service;

public interface AlarmService {

	String selectGitUrl(int memNo);

	int registGitUrl(int memNo, String githubInfo);
}
