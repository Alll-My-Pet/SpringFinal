package com.spring_boot_allmypet.project.dao.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

public interface IMyTipDAO {
	// 양육팁 게시판 목록 출력
	public ArrayList<MyTipBoardVO> getTipList(String petCtgNo);

	// 베스트 양육팁 top 3
	public ArrayList<MyTipBoardVO> getTop3List(String petCtgNo);
}
