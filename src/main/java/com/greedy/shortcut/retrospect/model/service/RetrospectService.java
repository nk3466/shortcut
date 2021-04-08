package com.greedy.shortcut.retrospect.model.service;

import java.util.List;

import com.greedy.shortcut.retrospect.model.dto.ReviewDTO;

public interface RetrospectService {

	List<ReviewDTO> selectReview();
	
}
