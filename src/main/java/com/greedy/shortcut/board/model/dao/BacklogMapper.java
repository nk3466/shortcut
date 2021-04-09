package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;

public interface BacklogMapper {

	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
}
