package com.greedy.shortcut.board.controller;

import static org.junit.Assert.fail;
import static org.mockito.Matchers.anyInt;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

import com.greedy.shortcut.board.model.dto.BacklogDTO;
import com.greedy.shortcut.board.model.dto.ProjectDTO;
import com.greedy.shortcut.board.model.service.BacklogService;

public class BacklogBoardControllerTest {
	
//	@Test
//	public void testBacklogBoardController() {
//		fail("Not yet implemented"); // TODO
//	}

	@Test
	public void testProject() {
		MockHttpServletRequest request = new MockHttpServletRequest();
		MockHttpServletResponse response = new MockHttpServletResponse();
		
		request.addParameter("pjtNo","3");
		request.addParameter("projectName","PJOJECT16");
		
		 java.sql.Date projectStartDate=java.sql.Date.valueOf("2021-04-01");
		 java.sql.Date projectEndDate=java.sql.Date.valueOf("2021-04-30");

		
		BacklogService backlogService = mock(BacklogService.class);
		List<BacklogDTO> project = (List<BacklogDTO>) new ProjectDTO(3, "ShortCut 애자일 협업툴", projectStartDate, "N", 0, projectEndDate, "#e93535", null, null);

		when(backlogService.selectBacklogList(anyInt())).thenReturn(project);
		
		BacklogBoardController backlogController = new BacklogBoardController(backlogService);
//		backlogController.setModel(backlogService);
//		backlogController.service(request, response);
		//fail("Not yet implemented"); // TODO  뷰페이지로 값 전달
		
	}

	@Test
	public void testBacklogPaging() {
		fail("Not yet implemented"); // TODO 백로그 페이징 처리
	}

	@Test
	public void testSprintPaging() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testIdprojectcheck() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testEditProject() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testBacklogDetail() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testSprintDetail() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testRemoveProject() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testRegistBacklog() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testEditBacklog() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testRemoveBacklog() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testRegistSprint() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testRemoveSprint() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public void testEditSprint() {
		fail("Not yet implemented"); // TODO
	}

}
