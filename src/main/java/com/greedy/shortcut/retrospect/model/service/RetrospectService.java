package com.greedy.shortcut.retrospect.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.retrospect.model.dto.ReviewDTO;

public interface RetrospectService {

	List<ReviewDTO> selectReview();
	
	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
	List<BacklogDTO> selectPagingFinishSprint(int pjtNo, PageInfoDTO pageInfo);
}
