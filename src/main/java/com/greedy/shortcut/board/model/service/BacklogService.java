package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;

public interface BacklogService {

	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
}
