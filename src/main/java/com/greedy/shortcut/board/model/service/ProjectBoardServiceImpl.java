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

	@Override
	public boolean insertProject(ProjectDTO project) {

		return mapper.insertPoject(project) > 0? true : false;
	}

	
	@Override
	public boolean insertProjectMember(ProjectDTO project, List<ProjectAuthorityDTO> projectMemberList) {
		
		ProjectDTO project1 =  mapper.selectProjectNum(project);
		
		
		System.out.println(project1);
		int projectNo = project1.getPjtNo();

		//projectMemberList.add(project1.getPjtNo());
		
		  if(!Integer.toString(projectNo).isEmpty()) { return
		  mapper.insertProjectMember(projectMemberList, projectNo) > 0? true : false;
		  
		  }else {
		  
		  }
		 
		return false;
	
	}

	/* 프로젝트 조회 */
	@Override
	public List<ProjectDTO> selectProjectList(String email) {
		return mapper.selectProjectList(email);
	}


}
