package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface BacklogMapper {

	List<BacklogDTO> selectFinishSprint(int pjtNo);
	
	/* 프로젝트 수정용 프로젝트 조회  */
	ProjectDTO selectProject(int pjtNo);
	
	/* 프로젝트 수정용 프로젝트멤버 조회  */
	List<ProjectAuthorityDTO> selectMemberList(int pjtNo);

	/* 프로젝트 수정용 아이디 유무  */
	MemberDTO selectMemberDupCheck(String email);

	/* 프로젝트 수정   */
	int insertEditProject(ProjectDTO project);

	/* 프로젝트 수정 이력 등록  */
	int insertEditProjectHistory(ProjectDTO project);

	/* 프로젝트 회원 수정*/
	int insertEditProjectMember(ProjectAuthorityDTO projectAuthorityDTO);

	/* 프로젝트 회원 수정이력 등록*/
	int insertEditProjectMemberHistory(ProjectAuthorityDTO projectAuthorityDTO);

	boolean removeProject(int projectNo);

	int insertRemoveProjectHistory(ProjectDTO project);

}
