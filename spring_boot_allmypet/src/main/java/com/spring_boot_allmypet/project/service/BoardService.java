package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.IBoardDAO;
import com.spring_boot_allmypet.project.model.BoardVO;
import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	@Qualifier("IBoardDAO")
	IBoardDAO dao;

	@Override
	public ArrayList<BoardVO> listAllBoard(HashMap<String, Integer> map) {
		return dao.listAllBoard(map);
	}

	// 공지 게시판
	@Override
	public ArrayList<BoardVO> viewNotice() {
		return dao.viewNotice();
	}

	// 자유 게시판
	@Override
	public ArrayList<BoardVO> viewFreeboard(HashMap<String, Integer> map) {
		return dao.viewFreeboard(map);
	}

	// 자유게시판 페이징
	@Override
	public int paging() {
		return dao.paging();
	}

	// 자유게시판 - index.jsp에 미리보기로 붙이는 용
	@Override
	public ArrayList<BoardVO> index_freeBoard() {
		return dao.index_freeBoard();
	}
	
	// 자유게시판 - 실시간 인기글
	@Override
	public ArrayList<BoardVO> free_hotList() {
		return dao.free_hotList();
	}

	@Override
	public int getBoardCount() {
		// TODO Auto-generated method stub
		return dao.getBoardCount();
	}

	// 작성
	@Override
	public void insertBoard(BoardVO vo) {
		dao.insertBoard(vo);

	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoard(String postNo) {
		// TODO Auto-generated method stub

	}

	// 상세 조회
	@Override
	public BoardVO detailViewBoard(int postNo) {
		return dao.detailViewBoard(postNo);
	}

	// 검색
	@Override
	public ArrayList<BoardVO> boardSearch(HashMap<String, String> param) {
		return dao.boardSearch(param);
	}

	// 인기글
	@Override
	public ArrayList<BoardVO> listHotTopics() {
		return dao.listHotTopics();
	}

}
