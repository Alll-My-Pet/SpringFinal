package com.spring_boot_allmypet.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.PromoteVO;


public interface IPromoteDAO {
	
		// 목록
		public ArrayList<PromoteVO> promoteList(HashMap<String, Integer> map);

		public int promoteCount();

		// 글 쓰기
		public void insertPromote(PromoteVO vo);

		// 수정
		public void updatePromote(PromoteVO vo);

		// 삭제
		public void deletePromote(String bodNo);

		// 상세 조회
		public PromoteVO promoteDetailView(int postNo);

		// 검색
		public ArrayList<PromoteVO> promoteSearch(HashMap<String, String> map);

}
