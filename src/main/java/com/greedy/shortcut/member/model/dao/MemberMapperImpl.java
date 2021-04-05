package com.greedy.shortcut.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.greedy.shortcut.member.model.dto.MemberDTO;

@Repository
public class MemberMapperImpl implements MemberMapper {

	@Autowired
	SqlSessionFactory sqlSession;
	
	@Override
	public int registMember(MemberDTO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectUserInfoOne(String inputUserId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object selectUserInfoCount(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void ModifyMember(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
	}


	@Override
	public void updateMember(MemberDTO dto) {
		((SqlSession) sqlSession).update("updateMember", dto);
	}

}
