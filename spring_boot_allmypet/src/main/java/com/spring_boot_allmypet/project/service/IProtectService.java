package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.ProtectVO;

public interface IProtectService {
	
				// 목록
				public ArrayList<ProtectVO> ProtectBoardList(HashMap<String, Integer> map);
				public int ProtectPaging();
				
			    // 글 쓰기
				public void ProtectInsert(ProtectVO vo);
				
			    // 수정
				public void ProtectUpdate(ProtectVO vo);

				// 삭제
				public void ProtectDelete(String bodNo);

				// 상세 조회
				public ProtectVO ProtectDetailView(int postNo);

				// 검색
				public ArrayList<ProtectVO> ProtectSearch(HashMap<String, String> map);

}
