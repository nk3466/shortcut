package com.greedy.shortcut.mywork.model.service;

import java.util.List;

import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.mywork.model.dto.ClientProjectDTO;

public interface ClientService {

	List<ClientProjectDTO> selectProjectList(String email);
	
}
