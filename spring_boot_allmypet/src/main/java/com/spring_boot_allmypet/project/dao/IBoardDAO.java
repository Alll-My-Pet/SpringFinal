package com.spring_boot_allmypet.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.BoardVO;

public interface IBoardDAO {
	
	// 목록
	/* public ArrayList<BoardVO> listAllBoard(); */
	public ArrayList<BoardVO> listAllBoard(HashMap<String, Integer> map);
	public int getBoardCount();
	
    // 글 쓰기
	public void insertBoard(BoardVO vo);
	
    // 수정
	public void updateBoard(BoardVO vo);

	// 삭제
	public void deleteBoard(String bodNo);

	// 상세 조회
	public BoardVO detailViewBoard(int postNo);

	// 검색
	public ArrayList<BoardVO> boardSearch(HashMap<String, String> map);
	
	// 인기글
	public ArrayList<BoardVO> listHotTopics();
	
	

}

