package com.spring_boot_allmypet.project.dao.mypage;

import java.util.ArrayList;
import java.util.Map;

import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;

public interface IMypageDAO {
	// 내정보 출력
	public MemberVO memInfoView(String mid);
	// 내정보 수정
	public void updateMyInfo(MemberVO vo);
	// 팻정보 출력
	public ArrayList<PetVO> myPetList(String mid);
	// 포인트 내역 전부 출력
	public ArrayList<MemberPointVO> myPointList_total(String mid);
	// 포인트 내역 조건 출력
	public ArrayList<MemberPointVO> myPointList(Map<String, Object> params);
}
