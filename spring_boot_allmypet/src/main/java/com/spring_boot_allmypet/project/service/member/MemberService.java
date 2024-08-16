package com.spring_boot_allmypet.project.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.member.IMemberDAO;
import com.spring_boot_allmypet.project.model.member.MemberVO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	// 아이디 확인
	@Override
	public String memIdCheck(String id) {
		return dao.memIdCheck(id);
	}
	// 닉네임 확인
	@Override
	public String memNNCheck(String nn) {
		return dao.memNNCheck(nn);
	}
	
	/*
	 * public boolean isIdDuplicate(String memId) { return memDao.checkID(memId) >
	 * 0; }
	 * 
	 * public String findPW(String memId) { return memDao.findPW(memId); }
	 * 
	 * public String findID(String memName, String memEmail, String memHP) { return
	 * memDao.findID(memName, memEmail, memHP); }
	 */

}
