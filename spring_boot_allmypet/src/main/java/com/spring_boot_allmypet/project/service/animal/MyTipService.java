package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.animal.IMyTipDAO;
import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

@Service
public class MyTipService implements IMyTipService {
	@Autowired
	@Qualifier("IMyTipDAO")
	IMyTipDAO dao;
	
	// 전체 양육팁 리스트 
	@Override
	public ArrayList<MyTipBoardVO> getTipList(String petCtgNo) {
		return dao.getTipList(petCtgNo);
	}
	
	// 베스트 양육팁 3개
	@Override
	public ArrayList<MyTipBoardVO> getTop3List(String petCtgNo) {
		return dao.getTop3List(petCtgNo);
	}
	
	// 상세게시글 조회
	@Override
	public MyTipBoardVO detailViewBoard(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 좋아요 업데이트
	@Override
	public void updateLikeCount(int postNo, int postLike) {
		// TODO Auto-generated method stub
		
	}
	
	// 게시글 삽입
	@Override
	public void insertPost(MyTipBoardVO vo) {
		dao.insertPost(vo);		
	}

}
