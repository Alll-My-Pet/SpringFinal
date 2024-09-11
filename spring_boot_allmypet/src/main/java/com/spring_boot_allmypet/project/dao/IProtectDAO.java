package com.spring_boot_allmypet.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.ProtectVO;


public interface IProtectDAO {
	
			// 목록
			public ArrayList<ProtectVO> ProtectBoardList(HashMap<String, Integer> map);
			//유기동물 신고
			public ArrayList<ProtectVO> ProtectReportList(HashMap<String, Integer> map);
			//페이징
			public int ProtectPaging();
			
		    // 글 쓰기
			public void ProtectInsert(ProtectVO vo);
			
			public void reportInsert(ProtectVO vo);
			
		    // 수정
			public void ProtectUpdate(ProtectVO vo);

			// 삭제
			public void ProtectDelete(int postNo);

			// 상세 조회
			public ProtectVO ProtectDetailView(int postNo);

			// 검색
			public ArrayList<ProtectVO> ProtectSearch(HashMap<String, String> map);
			

}
