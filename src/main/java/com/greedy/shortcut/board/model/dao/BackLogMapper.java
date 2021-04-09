package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;

public interface BackLogMapper {

	ProjectDTO selectProject(int pjtNo);

	List<ProjectAuthorityDTO> selectMemberList(int pjtNo);
	
	}

	

