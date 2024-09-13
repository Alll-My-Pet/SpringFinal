package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

public interface IMyTipService {

	// 전체 양육팁 게시판 리스트 가져옴
	public ArrayList<MyTipBoardVO> getTipList(String petCtgNo);

	// 동물별 베스트 양육팁 top 3
	public ArrayList<MyTipBoardVO> getTop3List(String petCtgNo);

	// 상세 게시글 보기
	public MyTipBoardVO detailViewBoard(int postNo);

	// 좋아요 업데이트
	public void updateLikeCount(int postNo, int postLike);

	// 게시글 삽입
	public void insertPost(MyTipBoardVO vo);

	// ****************** 베스트 양육팁 게시판 *************************
	// 베스트 양육팁 : postLike 기준으로 6개
	public ArrayList<MyTipBoardVO> bestTips(String petCtgNo);
	public ArrayList<MyTipBoardVO> bestTips2(String petCtgNo);
}
