package com.greedy.shortcut.board.model.dao;

import java.util.List;
import java.util.Map;

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

	
	List<BacklogDTO> selectPagingFinishSprint(Map<String, Object> pagingMap);


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
	
	/* 프로젝트 삭제 */
	boolean removeProject(int projectNo);

	/* 프로젝트 삭제 이력 등록 */
	int insertRemoveProjectHistory(ProjectDTO project);

	/* 백로그 리스트 조회 */
	List<BacklogDTO> selectBacklogList(int pjtNo);

	/* 백로그 등록 */
	int insertBacklog(BacklogDTO backlog);
	
	/* 백로그 히스토리 등록 */
	int insertBacklogHistory(BacklogDTO backlog);


}
