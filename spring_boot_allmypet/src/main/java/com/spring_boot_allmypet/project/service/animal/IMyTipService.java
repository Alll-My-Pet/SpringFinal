package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

public interface IMyTipService {
	
	// 전체 양육팁 게시판 리스트 가져옴	
	public ArrayList<MyTipBoardVO> getTipList(String petCtgNo);
	
	// 베스트 양육팁 top 3
	public ArrayList<MyTipBoardVO> getTop3List(String petCtgNo);
}
