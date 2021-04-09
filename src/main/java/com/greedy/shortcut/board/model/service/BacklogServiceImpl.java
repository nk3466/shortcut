package com.greedy.shortcut.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.BackLogMapper;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
@Service("backlogService")
public class BacklogServiceImpl implements BacklogService{

	private BackLogMapper mapper;
	
	@Autowired
	public BacklogServiceImpl(BackLogMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public ProjectDTO selectProjectList(int pjtNo) {
		return mapper.selectProject(pjtNo);
	}

	@Override
	public List<ProjectAuthorityDTO> selectMemberList(int pjtNo) {
		return mapper.selectMemberList(pjtNo);
	}

}
