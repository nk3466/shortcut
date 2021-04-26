package com.greedy.shortcut.board.model.service;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;

import com.greedy.shortcut.board.model.dao.BacklogMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectAuthorityDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;
@RunWith(MockitoJUnitRunner.class)			//spring-test에서 제공하는 단위 테스트를 위한 클래스 러너
//@WebAppConfiguration
//@ContextConfiguration(locations = {"file:src/main/resources/spring/servlet-context.xml", 
//									"file:src/main/resources/spring/root-context.xml", 
//									"file:src/main/resources/spring/security-context.xml"})		 //테스트의 설정이 들어있는 xml의 위치

public class BacklogServiceImplTest {
	
	@InjectMocks
	private BacklogServiceImpl backlogService;
	
//	@Spy
//	BacklogMapper backlogMapper;
	
	@Mock
	private BacklogMapper backlogMapper;
	
	 java.sql.Date projectStartDate=java.sql.Date.valueOf("2021-04-20");
	 java.sql.Date projectEndDate=java.sql.Date.valueOf("2021-05-13");
	 
	 List<ProjectAuthorityDTO> projectMember = new ArrayList<ProjectAuthorityDTO>();
	 private List<MemberDTO> member = new ArrayList<MemberDTO>();
	 
	 ProjectDTO project = new ProjectDTO(1, "PJOJECT1",projectStartDate, "N", 1,  projectEndDate, "#FFD9EC", projectMember,member);
	 ProjectAuthorityDTO member1 = new ProjectAuthorityDTO(1,1,1,1, "shortcut");
	 ProjectAuthorityDTO member2 = new ProjectAuthorityDTO(2,1,2,2, "wankkyu@greedy.com");
	 
	 List<BacklogDTO> backlogList= new ArrayList<BacklogDTO>();
	 BacklogDTO backlog1= new BacklogDTO(1, "BACKLOG1-1",1,"테스트 데모 방식1", "테스트 참고 1" );
	 BacklogDTO backlog2= new BacklogDTO(2, "BACKLOG1-2",1,"테스트 데모 방식2", "테스트 참고 2" );
	 
	@Before
	public void setup() {
		MockitoAnnotations.initMocks(this);
		backlogService = new BacklogServiceImpl(backlogMapper);
		projectMember.add(member1);
		projectMember.add(member2);
		
		backlogList.add(backlog1);
		backlogList.add(backlog2);
	}

	@Test
	public void testSelectProjectList() {
		when(backlogService.selectProjectList(project.getPjtNo())).thenReturn(project);
		ProjectDTO projects = backlogService.selectProjectList(project.getPjtNo());
		assertThat(projects, is(notNullValue()));
	}

	@Test
	public void testSelectMemberList() {
		when(backlogService.selectMemberList(project.getPjtNo())).thenReturn(projectMember);
		List<ProjectAuthorityDTO> projectMembers = backlogService.selectMemberList(project.getPjtNo());
		assertThat(projectMembers.size(), is(equalTo(2)));
	} 

	@Test
	public void testIdprojectcheck() {
		//MemberDTO member = new MemberDTO();
		int memberNo;
		System.out.println("eee" + member1);
		when(backlogService.idprojectcheck(member1.getMemberId())).thenReturn(member1.getMemberNo());		//회원 가입 되어있는 회원 조회
		memberNo = backlogService.idprojectcheck(member1.getMemberId());
		//memberNo = backlogService.idprojectcheck(member1.getMemberId());
		System.out.println("memberNo" + memberNo);
		assertThat(memberNo, is(equalTo(member1.getMemberNo())));
		//fail("Not yet implemented"); // TODO
		
	}

	@Test
	public void testInsertEditProject() {
		
	//	boolean insertProject = backlogService.insertEditProject(project);
	//	when(backlogService.insertEditProject(project)).thenReturn(2);
		System.out.println("34342 "+ project);
		assertThat(backlogService.insertEditProject(project), is(equalTo(2)));
	}

	@Test
	public void testInsertEditProjectMember() {
		assertTrue(backlogService.insertEditProjectMember(project, projectMember));
	}

	@Test
	public void testRemoveProject() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testSelectBacklogList() {
		BacklogDTO backlog= new BacklogDTO();
		
		List<BacklogDTO> backlogData = new ArrayList<BacklogDTO>();
		backlogData.add(backlog);
		            
		when(backlogMapper.selectBacklogList(1)).thenReturn(backlogData);
		
		List<BacklogDTO> backlogs = backlogService.selectBacklogList(1);
		
		//assertEquals(backlogs.size(),1 );
		assertThat(backlogs.size(), is(equalTo(1)));
		//fail("Not yet implemented"); // TODO
	}
//
//	@Test
//	public void testInsertBacklog() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testSelectBacklogToEdit() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testSelectSprintList() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testEditBacklog() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testRemoveBacklog() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testRegistSprint() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testSelectsprintDetailToEdit() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testRemoveSprint() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testEditSprint() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testSelectPagingSelectBacklog() {
//		fail("Not yet implemented"); // TODO
//	}
//
//	@Test
//	public void testSelectPagingSelectSprint() {
//		fail("Not yet implemented"); // TODO
//	}

}
