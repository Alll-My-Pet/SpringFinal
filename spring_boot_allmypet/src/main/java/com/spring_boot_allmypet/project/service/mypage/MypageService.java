package com.spring_boot_allmypet.project.service.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.mypage.IMypageDAO;
import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;

@Service
public class MypageService implements IMypageService {
	@Autowired
	@Qualifier("IMypageDAO")
	IMypageDAO dao;
	
	/* 내정보 출력 */
	@Override
	public MemberVO memInfoView(String mid) {
		return dao.memInfoView(mid);
	}
	/* 내정보 수정 */
	@Override
	public void updateMyInfo(MemberVO vo) {
		dao.updateMyInfo(vo);
	}
	/* 펫 정보 출력 */
	@Override
	public ArrayList<PetVO> myPetList(String mid) {
		return dao.myPetList(mid);
	}
	/* 포인트 내역 출력*/
	@Override
	public ArrayList<MemberPointVO> myPointList_total(String mid){ 
		return dao.myPointList_total(mid);
	}
	@Override
	public ArrayList<MemberPointVO> myPointList(String mid, int year, int month) {
		Map<String, Object> params = new HashMap<>();
        params.put("memId", mid);
        params.put("year", year);
        params.put("month", month);
        return dao.myPointList(params);
	}

}
