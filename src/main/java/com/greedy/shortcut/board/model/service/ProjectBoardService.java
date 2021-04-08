package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface ProjectBoardService {

	int idprojectcheck(MemberDTO member);

	boolean insertProject(ProjectDTO project);
	
	boolean insertProjectMember(ProjectDTO project, List<ProjectAuthorityDTO> projectMemberList);

	List<ProjectDTO> selectProjectList(String email);

}
