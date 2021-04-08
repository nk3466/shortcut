package com.greedy.shortcut.retrospect.model.dao;

import java.util.List;

import com.greedy.shortcut.retrospect.model.dto.ReviewDTO;

public interface RetrospectMapper {

	List<ReviewDTO> selectReview();
	
}
