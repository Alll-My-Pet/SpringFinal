package com.spring_boot_allmypet.project.service.member;

import com.spring_boot_allmypet.project.model.member.MemberVO;

public interface IMemberService {
	// 회원가입
	public void insertMember(MemberVO vo);
	// 아이디 체크
	public String memIdCheck(String id);
	// 닉네임 체크
	public String memNNCheck(String nn);
	
}
