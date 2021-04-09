package com.greedy.shortcut.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.ProjectMapper;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("projectBoardService")
public class ProjectBoardServiceImpl implements ProjectBoardService{

	private ProjectMapper mapper;
	
	@Autowired
	public ProjectBoardServiceImpl(ProjectMapper mapper) {
		this.mapper = mapper;
	}
	
	/* 아이디 유무 체크 */
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
	
	/* 프로젝트 생성 */
	@Override
	public boolean insertProject(ProjectDTO project) {
		/*
		 * mapper.insertPoject(project); mapper.insertProjectHistory(project);
		 */
		return mapper.insertPoject(project) + mapper.insertProjectHistory(project) > 0? true : false;
	}

	/* 프로젝트 회원 등록 */
	@Override
	public boolean insertProjectMember(ProjectDTO project, List<ProjectAuthorityDTO> projectMemberList) {
		
		/*
		 * ProjectDTO project1 = mapper.selectProjectNum(project);
		 * 
		 * System.out.println(project1); int projectNo = project1.getPjtNo();
		 */
		/*
		 * for(int i = 0; i < projectMemberList.size();i++) {
		 * projectMemberList.get(i).setProjectNo(projectNo); }
		System.out.println("야호" + projectMemberList); */
		
		int count = 0;
		 /* if(!Integer.toString(projectNo).isEmpty()) { */
			  for(int i = 0; i < projectMemberList.size(); i++) {
				  mapper.insertProjectMember(projectMemberList.get(i));
				  mapper.insertProjectMemberHistory(projectMemberList.get(i));
				  count++;
			  }
			  return  count >= projectMemberList.size()? true : false;
		  
	}
	
	/* 프로젝트 생성 이력 insert */
	/*
	 * @Override public boolean insertProjectHistory(ProjectDTO project) {
	 * 
	 * return mapper.insertProjectHistory(project) > 0? true : false; }
	 */
	/* 프로젝트 회원 이력 insert */
	/*
	 * @Override public boolean insertProjectMemberHistory(ProjectDTO project,
	 * List<ProjectAuthorityDTO> projectMemberList) {
	 * 
	 * return mapper.insertProjectMemberHistory; }
	 * 
	 */
	
	/* 프로젝트 조회 */
	@Override
	public List<ProjectDTO> selectProjectList(int no) {
		return mapper.selectProjectList(no);
	}

	


}
