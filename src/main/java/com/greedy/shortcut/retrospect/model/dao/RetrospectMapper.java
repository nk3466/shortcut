package com.greedy.shortcut.retrospect.model.dao;

import java.util.List;
import java.util.Map;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.retrospect.model.dto.ReviewDTO;

public interface RetrospectMapper {

	List<ReviewDTO> selectReview();
	
	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
	List<BacklogDTO> selectPagingFinishSprint(Map<String, Object> pagingMap);
	
}
