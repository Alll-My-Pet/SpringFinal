package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.IBoardDAO;
import com.spring_boot_allmypet.project.model.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	@Qualifier("IBoardDAO")
	IBoardDAO dao;

	@Override
	public ArrayList<BoardVO> listAllBoard(HashMap<String, Integer> map) {
		return dao.listAllBoard(map);
	}
	
	@Override
	public int getBoardCount() {
		// TODO Auto-generated method stub
		return dao.getBoardCount();
	}

	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoard(String bodNo) {
		// TODO Auto-generated method stub

	}
    // 상세 조회
	@Override
	public BoardVO detailViewBoard(String bodNo) {
		return dao.detailViewBoard(bodNo);
	}

	@Override
	public ArrayList<BoardVO> boardSearch(HashMap<String, Object> map) {
		return dao.boardSearch(map);
	}

}
