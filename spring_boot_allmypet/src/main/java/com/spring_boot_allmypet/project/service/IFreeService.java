package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.FreeVO;


public interface IFreeService {
	
			// 목록
			public ArrayList<FreeVO> FreeBoardList(HashMap<String, Integer> map);
			public int FreePaging();
			
		    // 글 쓰기
			public void FreeInsert(FreeVO vo);
			
		    // 수정
			public void FreeUpdate(FreeVO vo);

			// 삭제
			public void FreeDelete(String bodNo);

			// 상세 조회
			public FreeVO FreeDetailView(int postNo);

			// 검색
			public ArrayList<FreeVO> FreeSearch(HashMap<String, String> map);
			
			// 인기글
			public ArrayList<FreeVO> FreeHotTopics();

}
