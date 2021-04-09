package com.greedy.shortcut.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.BacklogMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;

@Service("backlogService")
public class BacklogServiceImpl implements BacklogService {

	private BacklogMapper backlogMapper;
	
	@Autowired
	public BacklogServiceImpl(BacklogMapper backlogMapper) {
		this.backlogMapper = backlogMapper;
	}

	@Override
	public List<BacklogDTO> selectFinishSprint(int pjtNo) {
		return backlogMapper.selectFinishSprint(pjtNo);
	}
	
	@Override
    public ProjectDTO selectProjectList(int pjtNo) {
		return backlogMapper.selectProject(pjtNo);
	}

	@Override
    public List<ProjectAuthorityDTO> selectMemberList(int pjtNo) {
		return backlogMapper.selectMemberList(pjtNo);
	}
	
}
