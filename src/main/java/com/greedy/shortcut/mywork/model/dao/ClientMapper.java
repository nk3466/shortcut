package com.greedy.shortcut.mywork.model.dao;

import java.util.List;

import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.mywork.model.dto.ClientProjectAndSprintDTO;
import com.greedy.shortcut.mywork.model.dto.ClientProjectDTO;

public interface ClientMapper {

	List<ClientProjectDTO> selectProjectList(String email);
	
	ClientProjectAndSprintDTO selectOneProjectByPjNo(int pjtNo);
	
	List<ClientProjectDTO> selectProjectList2(int pjtNo);
	
	int selectSprintCount(int pjtNo);
}
