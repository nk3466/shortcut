package com.greedy.shortcut.retrospect.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.retrospect.model.dao.RetrospectMapper;
import com.greedy.shortcut.retrospect.model.dto.ReviewDTO;

@Service("retrospectService")
public class RetrospectServiceImpl implements RetrospectService {

	private RetrospectMapper retrospectMapper;
	
	@Autowired
	public RetrospectServiceImpl(RetrospectMapper retrospectMapper) {
		this.retrospectMapper = retrospectMapper;
	}
	
	@Override
	public List<ReviewDTO> selectReview() {
		return retrospectMapper.selectReview();
	}

}
