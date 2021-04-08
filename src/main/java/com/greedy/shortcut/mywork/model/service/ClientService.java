package com.greedy.shortcut.mywork.model.service;

import java.util.List;

import com.greedy.shortcut.mywork.model.dto.ClientCardTaskAndCardAndMemberDTO;
import com.greedy.shortcut.mywork.model.dto.ClientProjectAndSprintDTO;
import com.greedy.shortcut.mywork.model.dto.ClientProjectDTO;

public interface ClientService {

	List<ClientProjectDTO> selectProjectList(String email);
	
	ClientProjectAndSprintDTO selectOneProjectByPjNo(int pjtNo);
	
	List<ClientProjectDTO> selectProjectList2(int pjtNo);
	
	int selectSprintCount(int pjtNo);
	
	List<ClientCardTaskAndCardAndMemberDTO> selectBarInfo(int sprNo);
}
