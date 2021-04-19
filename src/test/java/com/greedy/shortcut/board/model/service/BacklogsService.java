package com.greedy.shortcut.board.model.service;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.greedy.shortcut.board.model.dao.BacklogMapper;
import com.greedy.shortcut.board.model.dto.BacklogDTO;

@RunWith(SpringJUnit4ClassRunner.class)			//spring-test에서 제공하는 단위 테스트를 위한 클래스 러너
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/resources/spring/servlet-context.xml", 
									"file:src/main/resources/spring/root-context.xml", 
									"file:src/main/resources/spring/security-context.xml"})		 //테스트의 설정이 들어있는 xml의 위치
public class BacklogsService {

	
	  @Mock 
	  private BacklogMapper backlogMapper;
	  
	  @InjectMocks BacklogServiceImpl backlogServiceImpl;
	 
	
	@Autowired
	BacklogServiceImpl backlogService;
	
	BacklogDTO backlogDTO;
	
	@Before
    public void setUp() {
		MockitoAnnotations.initMocks(this);
		backlogDTO = new BacklogDTO();
		backlogDTO.setPjtNo(1);
		
	    }
	
	@Test
	public void BacklogViewtest() {
		List<String> expected = Arrays.asList("회원가입", "로그인", "프로젝트", "백로그", "스프린트");
		assertThat(backlogService.selectBacklogList(1),is(expected));
	}
}
