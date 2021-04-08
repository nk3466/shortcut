package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public interface ProjectMapper {
	/* 아이디 유무 체크 */
	MemberDTO selectMemberDupCheck(String inputUserId);
	
	/* 프로젝트 생성 */
	int insertPoject(ProjectDTO project);
	
	ProjectDTO selectProjectNum(ProjectDTO project);
	
	/* 프로젝트 멤버 등록 */
	int insertProjectMember(List<ProjectAuthorityDTO> projectMemberList, int projectNo);

	List<ProjectDTO> selectProjectList(String email);
}
