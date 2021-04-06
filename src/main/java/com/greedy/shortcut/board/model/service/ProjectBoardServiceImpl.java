package com.greedy.shortcut.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.ProjectMapper;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("projectBoardService")
public class ProjectBoardServiceImpl implements ProjectBoardService{

	private ProjectMapper mapper;
	
	@Autowired
	public ProjectBoardServiceImpl(ProjectMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public int idprojectcheck(MemberDTO member) {

		MemberDTO userNo = mapper.selectMemberDupCheck(member.getEmail());
		if(userNo == null) {
			System.out.println("가입된 회원이 아님");
			return 0;
		}else {
			System.out.println("사용자 넘버는 ? " + userNo.getNo());
			return userNo.getNo();
		}
		
	}

}
