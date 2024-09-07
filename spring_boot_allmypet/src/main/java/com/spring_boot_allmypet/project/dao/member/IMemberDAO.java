package com.spring_boot_allmypet.project.dao.member;

import java.util.HashMap;

import com.spring_boot_allmypet.project.model.member.MemberVO;

public interface IMemberDAO {
	// 회원가입
	public void insertMember(MemberVO vo);
	// 아이디 체크
	public String memIdCheck(String id);
	// 닉네임 체크
	public String memNNCheck(String nn);
	// 포지션 체크 (일반, 브리더, 관리자)
	public int memPosition(String id);
	// 필터링 체크
	public int memFiltering(String id);
	// 로그인
	public String loginCheck(HashMap<String, Object> map);
	// 아이디 찾기
	public String findId(HashMap<String, Object> map);
	// 비밀번호 찾기
	public String findPwd(HashMap<String, Object> map);
}
