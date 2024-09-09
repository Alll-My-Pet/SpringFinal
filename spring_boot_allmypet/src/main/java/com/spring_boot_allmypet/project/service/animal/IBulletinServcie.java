package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;

public interface IBulletinServcie {
	// petCtgNo에 따른 전체게시판 목록 - animnal_index.jsp에 붙이는 미리보기
	public ArrayList<BulletinBoardVO> showBulletin(String petCtgNo);

	// petCtgNo에 따른 필터링 되는 목록 가져오기
	public ArrayList<BulletinBoardVO> getBulletinList(HashMap<String, Object> map);

	// 전체게시판 실시간 인기글
	public ArrayList<BulletinBoardVO> hotList(String petCtgNo);

	// postNo로 해당 게시글 가져오기
	public BulletinBoardVO getPost(int postNo);
	
	// 상세 게시글 보기
	public BulletinBoardVO detailViewBoard(int postNo);
	
	// 삽입/갱신/삭제
	public void insertPost(BulletinBoardVO vo);

	public void updatePost(BulletinBoardVO post);

	public void deletePost(int postNo);
}
