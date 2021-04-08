package com.greedy.shortcut.board.model.dto;

import java.util.List;

import com.greedy.shortcut.member.model.dto.MemberDTO;

public class ProjectAuthorityDTO {

	private int projectRole;	//회원권한
	private int projectNo;		//프로젝트번호
	private int MemberNo;		//회원번호
	private int projectRoleNo;	//권한 고유 번호(pk)
	
	//private List<ProjectAuthorityDTO> memberList;
	
	private String memberId;
	
	public ProjectAuthorityDTO() {}

	public ProjectAuthorityDTO(int projectRole, int projectNo, int memberNo, int projectRoleNo,
			List<ProjectAuthorityDTO> memberList, String memberId) {
		super();
		this.projectRole = projectRole;
		this.projectNo = projectNo;
		this.MemberNo = memberNo;
		this.projectRoleNo = projectRoleNo;
		//this.memberList = memberList;
		this.memberId = memberId;
	}

	public int getProjectRole() {
		return projectRole;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public int getMemberNo() {
		return MemberNo;
	}

	public int getProjectRoleNo() {
		return projectRoleNo;
	}

//	public List<ProjectAuthorityDTO> getMemberList() {
//		return memberList;
//	}

	public String getMemberId() {
		return memberId;
	}

	public void setProjectRole(int projectRole) {
		this.projectRole = projectRole;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}

	public void setProjectRoleNo(int projectRoleNo) {
		this.projectRoleNo = projectRoleNo;
	}

	/*
	 * public void setMemberList(List<ProjectAuthorityDTO> memberList) {
	 * this.memberList = memberList; }
	 */

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "ProjectAuthorityDTO [projectRole=" + projectRole + ", projectNo=" + projectNo + ", MemberNo=" + MemberNo
				+ ", projectRoleNo=" + projectRoleNo /* + ", memberList=" + memberList */ + ", memberId=" + memberId + "]";
	}
	
	
	

	
	
	
}
