package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.BoardVO;

public interface IBoardService {
	
	/* public ArrayList<BoardVO> listAllBoard(); */
	public ArrayList<BoardVO> listAllBoard(HashMap<String, Integer> map);
    public int getBoardCount();

	public void insertBoard(BoardVO vo);
	

	public void updateBoard(BoardVO vo);

	// 게시글 삭제
	public void deleteBoard(String bodNo);

	// 상세 게시글 조회
	public BoardVO detailViewBoard(int postNo);

	// 상품 검색
	public ArrayList<BoardVO> boardSearch(HashMap<String, String> map);
	
	// 인기글
	public ArrayList<BoardVO> listHotTopics();
}
