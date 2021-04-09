package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.common.paging.PageInfoDTO;

public interface BacklogService {

	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
	ProjectDTO selectProjectList(int pjtNo);

	List<ProjectAuthorityDTO> selectMemberList(int pjtNo);
	
	List<BacklogDTO> selectPagingFinishSprint(int pjtNo, PageInfoDTO pageInfo);
}
