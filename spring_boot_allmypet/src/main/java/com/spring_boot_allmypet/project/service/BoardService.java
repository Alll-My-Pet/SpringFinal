package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.model.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Override
	public ArrayList<BoardVO> listAllBoard() {
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public BoardVO detailViewBoard(String bodNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardVO> boardSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
