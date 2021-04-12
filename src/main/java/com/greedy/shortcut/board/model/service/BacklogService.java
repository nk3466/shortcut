package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;


public interface BacklogService {

	ProjectDTO selectProjectList(int pjtNo);

	List<ProjectAuthorityDTO> selectMemberList(int pjtNo);

	int idprojectcheck(MemberDTO member);

	boolean insertEditProject(ProjectDTO project);

	boolean insertEditProjectMember(ProjectDTO project, List<ProjectAuthorityDTO> projectMemberList);

	boolean removeProject(ProjectDTO project);

	List<BacklogDTO> selectBacklogList(int pjtNo);
	
	/* 백로그 생성 */
	boolean insertBacklog(BacklogDTO backlog);

}
