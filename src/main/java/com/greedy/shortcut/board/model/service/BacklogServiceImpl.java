package com.greedy.shortcut.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.BacklogMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.common.paging.PageInfoDTO;

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

	@Override
	public List<BacklogDTO> selectPagingFinishSprint(int pjtNo, PageInfoDTO pageInfo) {
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("pjtNo", pjtNo);
		pagingMap.put("startRow", pageInfo.getStartRow());
		pagingMap.put("endRow", pageInfo.getEndRow());
		
		return backlogMapper.selectPagingFinishSprint(pagingMap);
	}
	
}
