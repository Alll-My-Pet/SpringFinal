package com.spring_boot_allmypet.project.service.mypage;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;

public interface IMypageService {
	// 내정보 출력
	public MemberVO memInfoView(String mid);
	// 내정보 수정
	public void updateMyInfo(MemberVO vo);
	// 팻정보 출력
	public ArrayList<PetVO> myPetList(String mid);
}
