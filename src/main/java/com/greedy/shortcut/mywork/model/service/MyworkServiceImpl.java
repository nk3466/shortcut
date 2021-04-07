package com.greedy.shortcut.mywork.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.mywork.model.dao.MyworkMapper;
import com.greedy.shortcut.mywork.model.dto.ClientCardDTO;
import com.greedy.shortcut.mywork.model.dto.ClientTaskDTO;
import com.greedy.shortcut.mywork.model.dto.MyworkResponseCardAndTaskDTO;

@Service
public class MyworkServiceImpl implements MyworkService{
	
	private MyworkMapper myworkMapper; 
	
	@Autowired
	public MyworkServiceImpl(MyworkMapper myworkMapper) {
		this.myworkMapper = myworkMapper;
	}

	@Override
	public MemberDTO selectUserInfoOne(String userName) {
		
		return myworkMapper.selectUserInfoOne(userName);
	}

	@Override
	public List<ClientCardDTO> selectCardList(Integer no) {
		
		
		return myworkMapper.selectCardList(no);
	}


	@Override
	public List<MyworkResponseCardAndTaskDTO> selectTaskList(Integer no) {
		
		return myworkMapper.selectTaskList(no);
	}

}
