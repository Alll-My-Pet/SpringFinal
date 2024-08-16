package com.spring_boot_allmypet.project.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.member.IMemberDAO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	// 아이디 확인
	@Override
	public String memIdCheck(String id) {
		return dao.memIdCheck(id);
	}

}
