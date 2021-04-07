package com.greedy.shortcut.member.model.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import static com.greedy.shortcut.common.mail.SendMail2.sendingMailId;
import com.greedy.shortcut.common.mail.SendingMail;
import com.greedy.shortcut.member.model.dao.MemberMapper;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper, BCryptPasswordEncoder passwordEncoder) {
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public boolean registMember(MemberDTO member) {
		
		Object userId = (Object) mapper.selectUserInfoCount(member.getEmail());
		System.out.println("userCount : " + userId);
		if(userId == member.getEmail()) {
			return false;
		} else {
			member.setPassword(passwordEncoder.encode(member.getPassword()));
//			member.setEmail_approval_key(createKey());
//			sendingMailId(member.getEmail(), createKey(), "");
			return mapper.registMember(member) > 0? true: false;
		}
		
	}

	@Override
	public void ModifyMember(MemberDTO memberDTO) {
		mapper.ModifyMember(memberDTO);
		System.out.println(memberDTO);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		dto.setPassword(passwordEncoder.encode(dto.getPassword()));
		mapper.updateMember(dto);
	}

//	@Override
//	public String createKey() {
//		
//		String key = "";
//		Random random = new Random();
//		
//		for(int i = 0; i < 8; i++) {
//			key += random.nextInt(10);
//		}
//		
//		return key;
//	}
//
//	@Override
//	public void sendMail(MemberDTO member) {
//		new SendingMail("cjhoon1992@gmail.com" , "1234", "asdf");
//	}

}
