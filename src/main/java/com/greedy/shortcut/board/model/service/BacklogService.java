package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;


public interface BacklogService {

	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
	ProjectDTO selectProjectList(int pjtNo);

	List<ProjectAuthorityDTO> selectMemberList(int pjtNo);

	
	List<BacklogDTO> selectPagingFinishSprint(int pjtNo, PageInfoDTO pageInfo);


	int idprojectcheck(MemberDTO member);

	boolean insertEditProject(ProjectDTO project);

	boolean insertEditProjectMember(ProjectDTO project, List<ProjectAuthorityDTO> projectMemberList);

	boolean removeProject(ProjectDTO project);

}
